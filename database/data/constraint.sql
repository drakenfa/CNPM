-- ACCOUNTS ----------------------------
-- 1.Dùng CHECK Kiểm tra mật khẩu có chứa username không
-- ALTER TABLE `accounts`
-- ADD CONSTRAINT check_password_accounts CHECK(INSTR(LOWER(password), LOWER(username)) = 0);
-- 2.Dùng check Kiểm tra ký tự đặc biệt của username
-- ALTER TABLE `accounts`
-- ADD CONSTRAINT check_special_character_accounts CHECK (username NOT REGEXP '[^a-zA-Z0-9]');
-- 3.Dùng check Kiểm tra xem ngày tạo tk có trước ngày cập nhật tk không
ALTER TABLE `accounts`
ADD CONSTRAINT check_created_bigger_updated_accounts CHECK (created_at <= updated_at);


-- CUSTOMERS ---------------------------
-- trong Check không được phép dùng hàm và biểu thức động như curdate() => nên dùng trigger
-- ALTER TABLE `customers`
-- ADD CONSTRAINT check_age_customers CHECK (TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) >= 13);
-- ALTER TABLE `customers`
-- ADD CONSTRAINT check_age_customers CHECK (YEAR(CURDATE()) - YEAR(date_of_birth) > 13 OR (YEAR(CURDATE()) - YEAR(date_of_birth) = 13 AND DATE_FORMAT(date_of_birth, '%m-%d') <= DATE_FORMAT(CURDATE(), '%m-%d')))
-- 1.Kiểm tra xem khách hàng có trên 13 tuổi không
-- DELIMITER //
-- CREATE TRIGGER check_age_customer_insert
-- BEFORE INSERT ON `customers`
-- FOR EACH ROW
-- BEGIN
--     IF NOT TIMESTAMPDIFF(YEAR, NEW.date_of_birth, CURDATE()) >= 13 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = "Error: Customer's age must be over 13";
--     END IF;
-- END; // 
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER check_age_customer_update
-- BEFORE UPDATE ON `customers`
-- FOR EACH ROW
-- BEGIN
--     IF NOT TIMESTAMPDIFF(YEAR, NEW.date_of_birth, CURDATE()) >= 13 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = "Error: Customer's age must be over 13";
--     END IF;
-- END; // 
-- DELIMITER ;

-- 2.Kiểm tra xem email nhập vào có đúng định dạng không
-- ALTER TABLE `customers`
-- ADD CONSTRAINT check_email_format_customers CHECK (`customers`.`customer_email` REGEXP '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$');
-- 3.Kiểm Fullname khách hàng chỉ chứa chữ(có Tiếng Việt) và khoảng trắng
-- ALTER TABLE `customers`
-- ADD CONSTRAINT check_fullname_customers CHECK (`customers`.customer_fullname REGEXP '^[a-zA-z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]+$');  
-- 4.Kiểm tra Role_id của khách hàng phải là 5
ALTER TABLE `customers`
ADD CONSTRAINT check_role_customers CHECK (`customers`.role_id = 5);
-- 5.Kiểm tra gender của khách hàng chỉ là 0 hoặc 1
ALTER TABLE `customers`
ADD CONSTRAINT check_gender_customers CHECK (`customers`.gender = 0 OR `customers`.gender = 1);
-- 6.Kiểm tra Phone number phải có 10 số và bắt đầu bằng số 0
-- ALTER TABLE `customers`
-- ADD CONSTRAINT check_phone_number_customers CHECK (`customers`.phone_number REGEXP '^0[0-9]{9}$');
-- 7.Tạo ra id khách hàng tự tăng
-- DELIMITER //
-- CREATE TRIGGER auto_increment_id_customer
-- BEFORE INSERT ON `customers`
-- FOR EACH ROW
-- BEGIN
--   DECLARE last_id INT;
--   DECLARE new_id VARCHAR(10);
  
--   SELECT MAX(CAST(SUBSTR(customer_id, 3) AS UNSIGNED)) INTO last_id
--   FROM customers;
  
--   IF last_id IS NULL THEN
--     SET new_id = 'KH001';
--   ELSEIF last_id < 9 THEN
--     SET new_id = CONCAT('KH00', last_id + 1);
--   ELSEIF last_id < 99 THEN
--     SET new_id = CONCAT('KH0', last_id + 1);
--   ELSE
--     SET new_id = CONCAT('KH', last_id + 1);
--   END IF;
  
--   SET NEW.customer_id = new_id;
-- END; //
-- DELIMITER ;



-- EXPORTS ----------------------------------------
-- 1.Kiểm tra xem role_id của staff đang thực hiện phiếu xuất có phải là role 1,2,4 không
-- Truy vấn phức tạp trên nhiều bảng thì phải dùng trigger
DELIMITER //
CREATE TRIGGER check_role_export_insert
BEFORE INSERT ON `exports`
FOR EACH ROW
BEGIN
    DECLARE role_id INT;
    SELECT `staffs`.`role_id` INTO role_id FROM `staffs` WHERE `staff_id` = NEW.staff_id;
    IF NOT role_id IN (1,2,4) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: role_id of staff must be 1, 2, or 4';
    END IF;
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER check_role_export_update
BEFORE UPDATE ON `exports`
FOR EACH ROW
BEGIN
    DECLARE role_id INT;
    SELECT `staffs`.`role_id` INTO role_id FROM `staffs` WHERE `staff_id` = NEW.staff_id;
    IF NOT role_id IN (1,2,4) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: role_id of staff must be 1, 2, or 4';
    END IF;
END; //
DELIMITER ;
-- 2. Kiểm tra quantity_export > 0
ALTER TABLE `export_details`
ADD CONSTRAINT check_export_quantity_export_details CHECK (`export_details`.quantity_export > 0);
-- 3. Kiểm tra xem total_price = unit_price_export*quantity_export không
DELIMITER //
CREATE TRIGGER calculate_total_price_export_insert
AFTER INSERT ON export_details
FOR EACH ROW
BEGIN
    UPDATE `exports`
    SET `exports`.total_price = (
        SELECT SUM(unit_price_export * quantity_export)
        FROM export_details
        WHERE export_id = NEW.export_id
    )
    WHERE export_id = NEW.export_id;
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER calculate_total_price_export_update
AFTER UPDATE ON export_details
FOR EACH ROW
BEGIN
    UPDATE `exports`
    SET `exports`.total_price = (
        SELECT SUM(unit_price_export * quantity_export)
        FROM export_details
        WHERE export_id = NEW.export_id
    )
    WHERE export_id = NEW.export_id;
END; //
DELIMITER ;

-- SHIPMENTS ----------------------------------------------
-- 1.Kiểm tra xem số lượng sản phẩm ban đầu của mỗi lô có > 0
ALTER TABLE `shipments`
ADD CONSTRAINT check_quantity_shipments CHECK (`shipments`.quantity > 0);
-- 2.Kiểm tra unit_price_import > 0
ALTER TABLE `shipments`
ADD CONSTRAINT check_unit_price_import_shipments CHECK (`shipments`.unit_price_import > 0);
-- 3.Kiểm tra remain >= 0 và remain <= quantity
ALTER TABLE `shipments`
ADD CONSTRAINT check_remain_shipments CHECK (`shipments`.remain >= 0 AND `shipments`.remain <= `shipments`.quantity);
-- 4.Kiểm tra mfg trước ngày exp
ALTER TABLE `shipments`
ADD CONSTRAINT check_mfg_shipments CHECK (`shipments`.mfg < `shipments`.exp);
-- 5.Kiểm tra nếu thời gian hiện tại mà sau exp thì is_active = 0
-- ALTER TABLE `shipments`
-- ADD CONSTRAINT check_exp_shipments CHECK (`shipments`.exp < CURDATE())

DELIMITER //
CREATE TRIGGER check_exp_shipment_insert
BEFORE INSERT ON `shipments`
FOR EACH ROW
BEGIN
    IF (NEW.exp <= CURDATE()) THEN
        SET NEW.is_active = 0;
    ELSE 
        SET NEW.is_active = 1;
    END IF;
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER check_exp_shipment_update
BEFORE UPDATE ON `shipments`
FOR EACH ROW
BEGIN
    IF (NEW.exp <= CURDATE()) THEN
        SET NEW.is_active = 0;
    ELSE 
        SET NEW.is_active = 1;
    END IF;
END; //
DELIMITER ;

-- ORDERS ----------------------------------------
-- 1.Kiểm tra Phone number phải có 10 số và bắt đầu bằng số 0
ALTER TABLE `orders`
ADD CONSTRAINT check_phone_number_orders CHECK (`orders`.phone_number_of_receiver REGEXP '^0[0-9]{9}$');
-- 2.Kiểm tra account_id phải có role_là 5(nếu không có customer nào có account_id đó thì không được tạo order)
DELIMITER //
CREATE TRIGGER check_account_order_insert
BEFORE INSERT ON `orders`
FOR EACH ROW
BEGIN
    DECLARE role_id INT;
    SELECT `customers`.`role_id` INTO role_id FROM `customers` WHERE `account_id` = NEW.account_id;
    IF role_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Account ID not found in customers';
    END IF;
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER check_account_order_update
BEFORE UPDATE ON `orders`
FOR EACH ROW
BEGIN
    DECLARE role_id INT;
    SELECT `customers`.`role_id` INTO role_id FROM `customers` WHERE `account_id` = NEW.account_id;
    IF role_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Account ID not found in customers';
    END IF;
END; //
DELIMITER ;
-- 3.Kiểm tra định dạng email
ALTER TABLE `orders`
ADD CONSTRAINT check_email_format_orders CHECK (`orders`.`email_of_receiver` REGEXP '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$');
-- 4.Kiểm tra number_of_product > 0
ALTER TABLE `order_details`
ADD CONSTRAINT check_number_of_product_order_details CHECK (`order_details`.number_of_products > 0);
-- 5.Kiểm tra giá mỗi sản phẩm >= 0
ALTER TABLE `order_details`
ADD CONSTRAINT check_price_order_details CHECK (`order_details`.price >= 0);
-- 6.Kiểm tra total_money = price*number_of_product
DELIMITER //
CREATE TRIGGER calculate_total_money_order_insert
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE `orders`
    SET `orders`.total_money = (
        SELECT SUM(number_of_products * price)
        FROM order_details
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER calculate_total_money_order_update
AFTER UPDATE ON order_details
FOR EACH ROW
BEGIN
    UPDATE `orders`
    SET `orders`.total_money = (
        SELECT SUM(number_of_products * price)
        FROM order_details
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END; //
DELIMITER ;
-- 7.Kiểm tra shipping_date > ngày hiện tại
DELIMITER //
CREATE TRIGGER check_shipping_date_order_insert
BEFORE INSERT ON `orders`
FOR EACH ROW
BEGIN
    IF (NEW.shipping_date <= CURDATE()) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Shipping_date must bigger current date';
    END IF;
END; //
DELIMITER ;
DELIMITER //

CREATE TRIGGER check_shipping_date_order_update
BEFORE UPDATE ON `orders`
FOR EACH ROW
BEGIN
    IF (NEW.shipping_date IS NOT NULL AND NEW.shipping_date <= CURDATE()) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Shipping_date must be greater than the current date';
    END IF;
END; //

DELIMITER ;

-- 8.Kiểm tra staff_id phải có role_là 1,2,3
DELIMITER //
CREATE TRIGGER check_role_staff_order_insert
BEFORE INSERT ON `orders`
FOR EACH ROW
BEGIN
    DECLARE role_id INT;
    SELECT `staffs`.`role_id` INTO role_id FROM `staffs` WHERE `staff_id` = NEW.staff_id;
    IF NOT role_id IN (1,2,3) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: role_id of staff must be 1, 2, or 3';
    END IF;
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER check_role_staff_order_update
BEFORE UPDATE ON `orders`
FOR EACH ROW
BEGIN
    DECLARE role_id INT;
    SELECT `staffs`.`role_id` INTO role_id FROM `staffs` WHERE `staff_id` = NEW.staff_id;
    IF NOT role_id IN (1,2,3) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: role_id of staff must be 1, 2, or 3';
    END IF;
END; //
DELIMITER ;
-- PRODUCTS -------------------------------------
-- 1.Kiểm tra giá sản phẩm > 0 (khác giá nhập hàng)
ALTER TABLE `products`
ADD CONSTRAINT check_price_products CHECK (price > 0);
-- 2.Kiểm tra guarantee >= 0
ALTER TABLE `products`
ADD CONSTRAINT check_guarantee_products CHECK (guarantee >= 0);
-- 3.Kiểm tra xem created_at có trước updated_at không
ALTER TABLE `products`
ADD CONSTRAINT check_created_bigger_updated_products CHECK (created_at <= updated_at); 

-- STAFFS -------------------------------------
-- 1.Kiểm tra Fullname nhân viên chỉ chứa chữ(có Tiếng Việt) và khoảng trắng
ALTER TABLE `staffs`
ADD CONSTRAINT check_fullname_staffs CHECK (`staffs`.staff_fullname REGEXP '^[a-zA-z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]+$');  
-- 2.Kiểm tra Phone number phải có 10 số và bắt đầu bằng số 0
ALTER TABLE `staffs`
ADD CONSTRAINT check_phone_number_staffs CHECK (`staffs`.staff_phone_number REGEXP '^0[0-9]{9}$');
-- 3.Kiểm tra định dạng email
ALTER TABLE `staffs`
ADD CONSTRAINT check_email_format_staffs CHECK (`staffs`.`staff_email` REGEXP '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$');
-- 4.Kiểm tra xem role_id của staff có phải là role 1,2,3,4 không
ALTER TABLE `staffs`
ADD CONSTRAINT check_role_staffs CHECK (`staffs`.role_id IN (1,2,3,4)); 
-- 5.Kiểm tra gender chỉ là 0 hoặc 1
ALTER TABLE `staffs`
ADD CONSTRAINT check_gender_staffs CHECK (`staffs`.gender IN (0,1));

-- SUPPLIERS ---------------------------------------
-- 1.Kiểm tra Phone number phải có 10 số và bắt đầu bằng số 0 (bỏ do nhà cung cấp có thể ở nước ngoài sđt sẽ khác VN)
ALTER TABLE `suppliers`
ADD CONSTRAINT check_email_suppliers CHECK (`suppliers`.email_of_supplier REGEXP '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$');
-- 2. Gán id tự tăng cho nhà cung cấp
-- DELIMITER //
-- CREATE TRIGGER auto_increment_id_supplier
-- BEFORE INSERT ON `suppliers`
-- FOR EACH ROW
-- BEGIN
--   DECLARE last_id INT;
--   DECLARE new_id VARCHAR(10);
  
--   SELECT MAX(CAST(SUBSTR(supplier_id, 4) AS UNSIGNED)) INTO last_id
--   FROM suppliers;
  
--   IF last_id IS NULL THEN
--     SET new_id = 'NCC001';
--   ELSEIF last_id < 9 THEN
--     SET new_id = CONCAT('NCC00', last_id + 1);
--   ELSEIF last_id < 99 THEN
--     SET new_id = CONCAT('NCC0', last_id + 1);
--   ELSE
--     SET new_id = CONCAT('NCC', last_id + 1);
--   END IF;
  
--   SET NEW.supplier_id = new_id;
-- END; //
-- DELIMITER ;


-- CONTRACTS --------------------------------------
-- 1.Kiểm tra thời hạn hợp đồng phải ít nhất là 3 tháng
DELIMITER //
CREATE TRIGGER check_start_end_date_contract_insert
BEFORE INSERT ON `contracts`
FOR EACH ROW
BEGIN
    IF NOT TIMESTAMPDIFF(MONTH, NEW.start_date, NEW.end_date) >= 3 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Error: Time of contract must be over 3 month";
    END IF;
END; // 
DELIMITER ;
DELIMITER //
CREATE TRIGGER check_start_end_date_contract_update
BEFORE UPDATE ON `contracts`
FOR EACH ROW
BEGIN
    IF NOT TIMESTAMPDIFF(MONTH, NEW.start_date, NEW.end_date) >= 3 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Error: Time of contract must be over 3 month";
    END IF;
END; // 
DELIMITER ;
-- 2.Kiểm tra salary >= 0
ALTER TABLE `contracts`
ADD CONSTRAINT check_salary_contracts CHECK (`contracts`.salary >= 0);
-- 3.Kiểm tra salary >= total_salary
-- DELIMITER //
-- CREATE TRIGGER check_salary_total_salary_contract_insert
-- BEFORE INSERT ON `contracts`
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_salary decimal(10,2);
--     SELECT `timesheet_details`.`total_salary` INTO total_salary FROM `timesheet_details` WHERE contract_id = NEW.contract_id;
--     IF NOT (NEW.salary >= total_salary) THEN 
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = "Error: Salary in contract must be over total_salary";
--     END IF;
-- END; //
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER check_salary_total_salary_contract_update
-- BEFORE UPDATE ON `contracts`
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_salary decimal(10,2);
--     SELECT `timesheet_details`.`total_salary` INTO total_salary FROM `timesheet_details` WHERE contract_id = NEW.contract_id;
--     IF NOT (NEW.salary >= total_salary) THEN 
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = "Error: Salary in contract must be over total_salary";
--     END IF;
-- END; //
-- DELIMITER ;
-- sửa
-- DELIMITER //
-- CREATE TRIGGER check_salary_total_salary_contract_insert
-- BEFORE INSERT ON `contracts`
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_salary decimal(10,2);
--     IF EXISTS (SELECT 1 FROM `timesheet_details` WHERE contract_id = NEW.contract_id) THEN
--         SELECT `timesheet_details`.`total_salary` INTO total_salary FROM `timesheet_details` WHERE contract_id = NEW.contract_id;
--     ELSE
--         SET total_salary = 0;
--     END IF;
--     IF NOT (NEW.salary >= total_salary) THEN 
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = "Error: Salary in contract must be over total_salary";
--     END IF;
-- END; //
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER check_salary_total_salary_contract_update
-- BEFORE UPDATE ON `contracts`
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_salary decimal(10,2);
--     IF EXISTS (SELECT 1 FROM `timesheet_details` WHERE contract_id = NEW.contract_id) THEN
--         SELECT `timesheet_details`.`total_salary` INTO total_salary FROM `timesheet_details` WHERE contract_id = NEW.contract_id;
--     ELSE
--         SET total_salary = 0;
--     END IF;
--     IF NOT (NEW.salary >= total_salary) THEN 
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = "Error: Salary in contract must be over total_salary";
--     END IF;
-- END; //
-- DELIMITER ;

-- 4.Kiểm tra total_salary >= 0
ALTER TABLE `timesheet_details`
ADD CONSTRAINT check_total_salary_timesheet_details CHECK (`timesheet_details`.total_salary >= 0);
-- 5.Kiểm tra staff_id chỉ là 2,3,4
ALTER TABLE `contracts`
ADD CONSTRAINT check_staff_id_contracts CHECK (`contracts`.staff_id IN (2,3,4));
-- 6.Kiểm tra month là 12 tháng
ALTER TABLE `timesheets`
ADD CONSTRAINT check_month_timesheets CHECK (`timesheets`.month IN (1,2,3,4,5,6,7,8,9,10,11,12));
-- 7.Kiểm tra year từ 2000 - 3000 (tạm)
ALTER TABLE `timesheets`
ADD CONSTRAINT check_year_timesheets CHECK (`timesheets`.year >= 2000 AND `timesheets`.year <= 3000);
-- 8.Kiểm tra days_worked <= 26
ALTER TABLE `timesheets`
ADD CONSTRAINT check_days_worked_timesheets CHECK (`timesheets`.days_worked >= 0 AND `timesheets`.days_worked <= 26);
-- 9.Kiểm tra days_off <= 26
ALTER TABLE `timesheets`
ADD CONSTRAINT check_days_off_timesheets CHECK (`timesheets`.days_off >= 0 AND `timesheets`.days_off <= 26);
-- 10.Kiểm tra days_late <= 26
ALTER TABLE `timesheets`
ADD CONSTRAINT check_days_late_timesheets CHECK (`timesheets`.days_late >= 0 AND `timesheets`.days_late <= 26);
-- 11.Kiểm tra days_worked = 26 - days_off
ALTER TABLE `timesheets`
ADD CONSTRAINT check_days_worked_late_timesheets CHECK (`timesheets`.days_worked + `timesheets`.days_off = 26);
-- 12.Kiểm tra total_salary = salary/26 * days_worked - (salary/26 * days_late * 30%)
DELIMITER //
CREATE TRIGGER update_total_salary_timesheets_insert
AFTER INSERT ON timesheets
FOR EACH ROW
BEGIN
    DECLARE total_days_worked INT;
    DECLARE total_days_late INT;
    DECLARE total_salary DECIMAL(10, 2);
    SET total_days_worked = NEW.days_worked;
    SET total_days_late = NEW.days_late;
    SET total_salary = (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_worked
                      - (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_late * 0.3;
    INSERT INTO timesheet_details(timesheet_id, total_salary) VALUES (NEW.timesheet_id, total_salary);
    UPDATE timesheet_details SET timesheet_details.total_salary = total_salary WHERE timesheet_details.timesheet_id = NEW.timesheet_id;
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER update_total_salary_timesheets_update
AFTER UPDATE ON timesheets
FOR EACH ROW
BEGIN
    DECLARE total_days_worked INT;
    DECLARE total_days_late INT;
    DECLARE total_salary DECIMAL(10, 2);
    SET total_days_worked = NEW.days_worked;
    SET total_days_late = NEW.days_late;
    SET total_salary = (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_worked
                      - (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_late * 0.3;
    UPDATE timesheet_details SET timesheet_details.total_salary = total_salary WHERE timesheet_details.timesheet_id = NEW.timesheet_id;
END;
//
DELIMITER ;


-- CREATE VIEW PhieuBaoHanh_SanPham AS
-- SELECT pb.MaPhieu, pb.SoSeri, pb.NgayBatDau, pb.NgayKetThuc, ctp.MaSP
-- FROM PhieuBaoHanh pb
-- JOIN ChiTietSanPham ctp ON pb.SoSeri = ctp.SoSeri;

CREATE TRIGGER `reviews_BEFORE_INSERT` BEFORE INSERT ON `reviews` FOR EACH ROW BEGIN
	if(exists(select * from reviews where reviews.customer_id = new.customer_id and reviews.product_id = new.product_id))
    then
    begin
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: role_id of staff must be 1, 2, or 3';
    end;
    end if;
END

CREATE TRIGGER `reviews_AFTER_INSERT` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
	update products set products.average_rating = (products.average_rating * products.total_reviews + new.rating)/ (products.total_reviews + 1), products.total_reviews = products.total_reviews + 1 where products.product_id = new.product_id;
END

CREATE TRIGGER `reviews_AFTER_DELETE` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
	update products set products.average_rating = (products.average_rating * products.total_reviews - old.rating)/ (products.total_reviews - 1 ), products.total_reviews = products.total_reviews - 1 where products.product_id = old.product_id;
END

DELIMITER //
CREATE TRIGGER create_export_details_trigger
AFTER INSERT ON exports
FOR EACH ROW
BEGIN
    DECLARE export_id INT;
    SET export_id = NEW.export_id;

    INSERT INTO export_details (export_id, shipment_id, unit_price_export, quantity_export)
    SELECT export_id, shipment_id, price, number
    FROM Removes
    JOIN order_details ON Removes.order_detail_id = order_details.order_detail_id
    WHERE order_details.order_id = NEW.order_id;
END//
DELIMITER ;


DELIMITER //

CREATE TRIGGER create_export_trigger
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    -- Check if the status_of_order has been changed to 'Shipped'
    IF OLD.status_of_order <> NEW.status_of_order AND NEW.status_of_order = 'Shipped' THEN
        -- Insert a new row into exports table
        INSERT INTO exports (staff_id, order_id, export_date, total_price)
        SELECT NEW.staff_id, NEW.order_id, NOW(), NEW.total_money;

        -- Update the orders table to set the shipping_date to current date

        -- Insert into export_details table
        INSERT INTO export_details (export_id, shipment_id, unit_price_export, quantity_export)
        SELECT (SELECT MAX(export_id) FROM exports), shipment_id, unit_price_import, quantity
        FROM shipments
        WHERE import_id = NEW.order_id;
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER create_removes_trigger
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    DECLARE productsRemaining INT;
    DECLARE shipmentID INT;
    DECLARE shipmentRemain INT;
    DECLARE productsToAdd INT;

    -- Get the total number of products to add and initialize remaining products
    SET productsRemaining = NEW.number_of_products;

    -- Iterate over shipments with remaining products
    shipment_loop: WHILE productsRemaining > 0 DO
        -- Find the next shipment with remaining products
        SELECT shipment_id, remain INTO shipmentID, shipmentRemain
        FROM shipments
        WHERE sku_id = NEW.sku_id AND remain > 0
        ORDER BY shipment_id
        LIMIT 1;

        -- If no shipment is found, exit the loop
        IF shipmentID IS NULL THEN
            LEAVE shipment_loop;
        END IF;

        -- Calculate the number of products to assign from this shipment
        SET productsToAdd = LEAST(productsRemaining, shipmentRemain);

        -- Insert into Removes with the calculated number
        INSERT INTO Removes (orderID, order_detail_id, shipment_id, number)
        VALUES (NEW.order_id, NEW.order_detail_id, shipmentID, productsToAdd);

        -- Update remaining products
        SET productsRemaining = productsRemaining - productsToAdd;

        -- Update remaining quantity in the shipment
        UPDATE shipments
        SET remain = remain - productsToAdd
        WHERE shipment_id = shipmentID;
    END WHILE;
END//

DELIMITER ;
DELIMITER //

CREATE TRIGGER return_remaining_products_trigger
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF OLD.status_of_order <> NEW.status_of_order AND NEW.status_of_order = 'Cancelled' THEN
        -- Add the returned quantity to the shipment's remain
        UPDATE shipments s
        JOIN Removes r ON s.shipment_id = r.shipment_id
        JOIN order_details od ON od.order_detail_id = r.order_detail_id
        SET s.remain = s.remain + r.number
        WHERE od.order_id = NEW.order_id;
        
        -- Delete the processed order details from Removes
        DELETE FROM Removes WHERE order_detail_id IN (
            SELECT order_detail_id
            FROM order_details
            WHERE order_id = NEW.order_id
        );
    END IF;
END//

DELIMITER ;
DELIMITER //

CREATE TRIGGER orders_status_change_trigger
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    DECLARE notification_text VARCHAR(500);
    
    -- Construct notification text based on the new status_of_order
    CASE NEW.status_of_order
        WHEN 'Processing' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đang xử lý');
        WHEN 'Shipped' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đã giao');
        WHEN 'Delivered' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đã nhận');
        WHEN 'Cancelled' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đã hủy');
    END CASE;
    
    -- Insert the new notification into the noti table
    INSERT INTO noti (account_id, text, date_noti) VALUES (NEW.account_id, notification_text, NOW());
END;
//

DELIMITER ;
