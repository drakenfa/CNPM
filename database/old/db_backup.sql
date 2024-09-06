CREATE TABLE `noti` (
  `noti_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0
);

CREATE TABLE `accounts` (
  `account_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(20) UNIQUE NOT NULL,
  `email` varchar(200) UNIQUE DEFAULT '',
  `password` varchar(300) NOT NULL,
  `avatar` varchar(300),
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `brands` (
  `brand_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) UNIQUE DEFAULT '' COMMENT 'Ex: SANYO, TOSHIBA,...',
  `brand_logo` varchar(300) DEFAULT '',
  `supplier_id` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `categories` (
  `category_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT '' COMMENT 'Ex: Tủ lạnh, máy giặt,...',
  `category_logo` varchar(300) DEFAULT '',
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `banner_locations` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(512) NULL,
  PRIMARY KEY (`location_id`));

CREATE TABLE `banners` (
  `banner_id` INT NOT NULL AUTO_INCREMENT,
  `image_path` VARCHAR(512) NULL,
  `url` VARCHAR(512) NULL,
  `banner_name` VARCHAR(256) NULL,
  `location_id` INT NULL,
  `width` INT NULL,
  `height` INT NULL,
  `is_active` TINYINT(1) DEFAULT 1,
  PRIMARY KEY (`banner_id`),
  INDEX `banner_banner-locations_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `banner_banner-locations`
    FOREIGN KEY (`location_id`)
    REFERENCES `banner_locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE `featured_products` (
  `featured_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `featured_row` INT NULL,
  PRIMARY KEY (`featured_id`)
);

CREATE TABLE `featured_products_rows` (
  `row_id` INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  `row_name` VARCHAR(512) NULL,
  `row_description` VARCHAR(2048) NULL,
  `row_url` VARCHAR(512) NULL,
  `index` INT DEFAULT 100,
  `is_active` TINYINT(1) DEFAULT 1
);


CREATE TABLE `customers` (
  `customer_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `customer_fullname` varchar(100) NOT NULL DEFAULT 'Người dùng',
  `role_id` int(11) NOT NULL DEFAULT 5,
  `account_id` int(11) NOT NULL,
  `gender` tinyint(1) DEFAULT 0 COMMENT 'Male: 0, Female: 1',
  `address` varchar(200) DEFAULT '' COMMENT 'Địa chỉ của khách hàng',
  `date_of_birth` date,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `decentralizations` (
  `decentralization_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `exports` (
  `export_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `export_date` datetime DEFAULT (now()),
  `total_price` decimal(20,2) DEFAULT 0 COMMENT 'Không tự sinh đc như mysql',
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `export_details` (
  `export_detail_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `export_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `unit_price_export` decimal(20,2) DEFAULT 0,
  `quantity_export` int(50) DEFAULT 0
);

CREATE TABLE `imports` (
  `import_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `import_date` datetime DEFAULT (now()),
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `modules` (
  `module_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `module_name` varchar(200) DEFAULT '',
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `orders` (
  `order_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `receiver_name` varchar(100) DEFAULT '' COMMENT 'Có thể giấu tên',
  `email_of_receiver` varchar(100) NOT NULL,
  `phone_number_of_receiver` varchar(20) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT (now()),
  `status_of_order` ENUM ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
  `total_money` decimal(20,2) DEFAULT 0,
  `shipping_method` varchar(100) DEFAULT '',
  `shipping_address` varchar(200) NOT NULL,
  `shipping_date` datetime,
  `tracking_number` varchar(100) DEFAULT '',
  `payment_method` varchar(100) DEFAULT '',
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `order_details` (
  `order_detail_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `price` decimal(20,2) DEFAULT 0,
  `number_of_products` int(11) DEFAULT 1 COMMENT 'Phải > 0',
  `color_of_product` varchar(20) DEFAULT ''
);

CREATE TABLE `products` (
  `product_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_name` varchar(350) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(20,2) DEFAULT 0 COMMENT 'Phải >= 0',
  `guarantee` int(11) DEFAULT 0,
  `thumbnail` varchar(300) DEFAULT '' COMMENT 'Phải có ảnh mặc định',
  `description` longtext,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `average_rating` float DEFAULT 0,
  `total_reviews` float DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `product_details` (
  `serial_number` int(11) PRIMARY KEY NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `sold` tinyint(1) DEFAULT 0
);

CREATE TABLE `guarantees` (
  `guarantee_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `start_date` date DEFAULT (now()),
  `end_date` date
);

CREATE TABLE `options` (
  `option_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_name` varchar(128) NOT NULL,
  `option_value` longtext NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `likes` (
  `like_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `number` int,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
);

CREATE TABLE `reviews` (
  `review_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` float,
  `comment` longtext,
  `review_date` datetime DEFAULT (now()),
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `product_images` (
  `product_image_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(300) DEFAULT '' COMMENT 'Phải có ít nhất 1 ảnh mặc định'
);

CREATE TABLE `roles` (
  `role_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `shipments` (
  `shipment_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit_price_import` decimal(20,2) DEFAULT 0 COMMENT 'Phải > 0',
  `quantity` int(50) DEFAULT 0 COMMENT 'Phải > giá trị tối thiểu của 1 lô hàng',
  `remain` int(50) DEFAULT 0 COMMENT 'Phải bé 1 số lượng cụ thể thì mới nhập thêm lô',
  `sku_id` int(11) NOT NULL,
  -- `mfg` date,
  -- `exp` date,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `skus` (
  `sku_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sku_name` varchar(100),
  `sku_code` varchar(100) UNIQUE DEFAULT '' COMMENT 'Phải đủ số lượng ký tự của 1 sku code, nếu có enum về color thì sẽ dễ quản lý hơn',
  `product_id` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `staffs` (
  `staff_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `staff_fullname` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `gender` tinyint(1) DEFAULT 0 COMMENT 'Male: 0, Female: 1',
  `address` varchar(200),
  `entry_date` date DEFAULT (now()),
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `statistics` (
  `statistic_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `statistic_name` varchar(200) NOT NULL COMMENT 'Dùng các function, trigger, procedure, view,... Để tạo ra các dữ liệu muốn thống kê',
  `value` longtext NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `suppliers` (
  `supplier_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(200) NOT NULL,
  `phone_number_of_supplier` varchar(20) UNIQUE NOT NULL,
  `address_of_supplier` varchar(200) NOT NULL,
  `email_of_supplier` varchar(100) UNIQUE NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
);
CREATE TABLE `Removes` (
  `orderID` INT(11),
  `order_detail_id` INT(11),
  `shipment_id` INT(11),
  `number` INT(50),
  FOREIGN KEY (`orderID`) REFERENCES `orders`(`order_id`),
  FOREIGN KEY (`order_detail_id`) REFERENCES `order_details`(`order_detail_id`),
  FOREIGN KEY (`shipment_id`) REFERENCES `shipments`(`shipment_id`)
);

CREATE TABLE `contracts` (
  `contract_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `salary` decimal(20,2) NOT NULL
);

CREATE TABLE `timesheets` (
  `timesheet_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(2) NOT NULL,
  `days_worked` int(2) NOT NULL,
  `days_off` int(2) NOT NULL,
  `days_leave` int(2) NOT NULL,
  `days_late` int(2) NOT NULL
);

CREATE TABLE `timesheet_details` (
  `timesheet_detail_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `timesheet_id` int(11) NOT NULL,
  `total_salary` decimal(20,2) NOT NULL
);
CREATE TABLE `leave_application`(
  `leave_application_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 0
);

CREATE TABLE `attendance` (
  `attendance_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `timesheet_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` ENUM('Present', 'Absent', 'Leave', 'Late') NOT NULL,
  `leave_application_id` int(11) NOT NULL
);
CREATE UNIQUE INDEX `decentralizations_index_0` ON `decentralizations` (`role_id`, `module_id`);

CREATE UNIQUE INDEX `likes_index_1` ON `likes` (`product_id`, `customer_id`);

ALTER TABLE `brands` ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

ALTER TABLE `customers` ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `decentralizations` ADD CONSTRAINT `decentralizations_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `decentralizations` ADD CONSTRAINT `decentralizations_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`);

ALTER TABLE `exports` ADD CONSTRAINT `exports_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

ALTER TABLE `imports` ADD CONSTRAINT `imports_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

ALTER TABLE `product_images` ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `shipments` ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

ALTER TABLE `skus` ADD CONSTRAINT `skus_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `staffs` ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `shipments` ADD FOREIGN KEY (`import_id`) REFERENCES `imports` (`import_id`);

ALTER TABLE `customers` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

ALTER TABLE `staffs` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

ALTER TABLE `shipments` ADD FOREIGN KEY (`sku_id`) REFERENCES `skus` (`sku_id`);

ALTER TABLE `export_details` ADD FOREIGN KEY (`export_id`) REFERENCES `exports` (`export_id`);

-- ALTER TABLE `export_details` ADD FOREIGN KEY (`export_detail_id`) REFERENCES `shipments` (`shipment_id`);

ALTER TABLE `export_details` ADD FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`shipment_id`);

ALTER TABLE `likes` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `likes` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `exports` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

ALTER TABLE `timesheets` ADD FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`contract_id`);

ALTER TABLE `contracts` ADD FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

ALTER TABLE `timesheet_details` ADD FOREIGN KEY (`timesheet_id`) REFERENCES `timesheets` (`timesheet_id`);

ALTER TABLE `options` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `guarantees` ADD FOREIGN KEY (`serial_number`) REFERENCES `product_details` (`serial_number`);

ALTER TABLE `guarantees` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`sku_id`) REFERENCES `skus` (`sku_id`);

ALTER TABLE `product_details` ADD FOREIGN KEY (`sku_id`) REFERENCES `skus` (`sku_id`);

ALTER TABLE `product_details` ADD FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`shipment_id`);

ALTER TABLE `noti` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

ALTER TABLE `export_details` ADD FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`shipment_id`);

ALTER TABLE `featured_products` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
ALTER TABLE `featured_products` ADD FOREIGN KEY (`featured_row`) REFERENCES `featured_products_rows` (`row_id`);


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
-- ALTER TABLE `staffs`
-- ADD CONSTRAINT check_phone_number_staffs CHECK (`staffs`.staff_phone_number REGEXP '^0[0-9]{9}$');
-- 3.Kiểm tra định dạng email
-- ALTER TABLE `staffs`
-- ADD CONSTRAINT check_email_format_staffs CHECK (`staffs`.`staff_email` REGEXP '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$');
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
-- ALTER TABLE `contracts`
-- ADD CONSTRAINT check_staff_id_contracts CHECK (`contracts`.staff_id IN (2,3,4));
-- 6.Kiểm tra month là 12 tháng
ALTER TABLE `timesheets`
ADD CONSTRAINT check_month_timesheets CHECK (`timesheets`.month IN (1,2,3,4,5,6,7,8,9,10,11,12));
-- -- 7.Kiểm tra year từ 2000 - 3000 (tạm)
-- ALTER TABLE `timesheets`
-- ADD CONSTRAINT check_year_timesheets CHECK (`timesheets`.year >= 2000 AND `timesheets`.year <= 3000);
-- 8.Kiểm tra days_worked <= 26
-- ALTER TABLE `timesheets`
-- ADD CONSTRAINT check_days_worked_timesheets CHECK (`timesheets`.days_worked >= 0 AND `timesheets`.days_worked <= 26);
-- -- 9.Kiểm tra days_off <= 26
-- ALTER TABLE `timesheets`
-- ADD CONSTRAINT check_days_off_timesheets CHECK (`timesheets`.days_off >= 0 AND `timesheets`.days_off <= 26);
-- -- 10.Kiểm tra days_late <= 26
-- ALTER TABLE `timesheets`
-- ADD CONSTRAINT check_days_late_timesheets CHECK (`timesheets`.days_late >= 0 AND `timesheets`.days_late <= 26);
-- 11.Kiểm tra days_worked = 26 - days_off
-- ALTER TABLE `timesheets`
-- ADD CONSTRAINT check_days_worked_late_timesheets CHECK (`timesheets`.days_worked + `timesheets`.days_off = 26);
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
DELIMITER //
CREATE TRIGGER `reviews_BEFORE_INSERT` BEFORE INSERT ON `reviews` FOR EACH ROW BEGIN
	if(exists(select * from reviews where reviews.customer_id = new.customer_id and reviews.product_id = new.product_id))
    then
    begin
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: role_id of staff must be 1, 2, or 3';
    end;
    end if;
END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `reviews_AFTER_INSERT` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
	update products set products.average_rating = (products.average_rating * products.total_reviews + new.rating)/ (products.total_reviews + 1), products.total_reviews = products.total_reviews + 1 where products.product_id = new.product_id;
END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `reviews_AFTER_DELETE` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
	update products set products.average_rating = (products.average_rating * products.total_reviews - old.rating)/ (products.total_reviews - 1 ), products.total_reviews = products.total_reviews - 1 where products.product_id = old.product_id;
END
//
DELIMITER ;

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


-- DELIMITER //
-- CREATE TRIGGER update_total_salary_timesheets_insert
-- AFTER INSERT ON timesheets
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_days_worked INT;
--     DECLARE total_days_late INT;
--     DECLARE total_salary DECIMAL(10, 2);
--     SET total_days_worked = NEW.days_worked;
--     SET total_days_late = NEW.days_late;
--     SET total_salary = (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_worked
--                       - (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_late * 0.3;
--     INSERT INTO timesheet_details(timesheet_id, total_salary) VALUES (NEW.timesheet_id, total_salary);
--     UPDATE timesheet_details SET timesheet_details.total_salary = total_salary WHERE timesheet_details.timesheet_id = NEW.timesheet_id;
-- END;
-- //
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER update_total_salary_timesheets_update
-- AFTER UPDATE ON timesheets
-- FOR EACH ROW
-- BEGIN
--     DECLARE total_days_worked INT;
--     DECLARE total_days_late INT;
--     DECLARE total_salary DECIMAL(10, 2);
--     SET total_days_worked = NEW.days_worked;
--     SET total_days_late = NEW.days_late;
--     SET total_salary = (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_worked
--                       - (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / 26 * total_days_late * 0.3;
--     UPDATE timesheet_details SET timesheet_details.total_salary = total_salary WHERE timesheet_details.timesheet_id = NEW.timesheet_id;
-- END;
-- //
-- DELIMITER ;

INSERT INTO `roles` (`role_id`, `role_name`, `is_active`) VALUES 
('1', 'Admin', '1'), 
('2', 'Nhân viên quản lý', '1'),
('3', 'Nhân viên bán hàng', '1'),
('4', 'Nhân viên kho', '1'),
('5', 'Khách hàng', '1');

INSERT INTO `accounts` (`account_id`, `phone_number`, `email`, `password`, `created_at`, `updated_at`, `is_active`) VALUES
(1, '0988722521', 'hien@gmail.com', 'thien123', current_timestamp(), current_timestamp(), 1),
(2, '0988722522', 'huy@gmail.com', 'qhuy123', current_timestamp(), current_timestamp(), 1),
(3, '0988722523', 'loc@gmail.com', 'mloc123', current_timestamp(), current_timestamp(), 1),
(4, '0988722524', 'phong@gmail.com', 'hphong123',current_timestamp(), current_timestamp(), 1),
(5, '0988722525', 'lan@gmail.com', 'tlan123', current_timestamp(), current_timestamp(), 1),
(6, '0988722526', 'lieu@gmail.com', 'tlieu123', current_timestamp(), current_timestamp(), 1),
(7, '0988722527', 'lai@gmail.com', 'tlai123', current_timestamp(), current_timestamp(), 1),
(8, '0988722528', 'camhuong@gmail.com', 'chuong123', current_timestamp(), current_timestamp(), 1);

INSERT INTO `customers` (`customer_id`, `customer_fullname`, `role_id`, `account_id`, `gender`, `address`, `date_of_birth`, `is_active`) VALUES 
('1', 'Nguyễn Thị Lan', '5', '5', '1', 'Quận 1, Thành Phố Hồ Chí Minh', '2003-06-12', '1'),
('2', 'Nguyễn Thị Liễu', '5', '6', '1', 'Quận 2, Thành Phố Hồ Chí Minh', '2003-04-12', '1'),
('3', 'Nguyễn Thị Lài', '5', '7', '1', 'Quận 3, Thành Phố Hồ Chí Minh', '2004-02-11', '1'),
('4', 'Nguyễn Thị Cẩm Hường', '5', '8', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1');

INSERT INTO `staffs` (`staff_id`, `account_id`, `staff_fullname`, `role_id`, `gender`, `address`,`entry_date`, `is_active`) VALUES 
('1', '1', 'Lê Nguyễn Thế Hiển', '1', '0', 'Tây Ninh', current_timestamp(), '1'),
('2', '2', 'Võ Quốc Huy', '2', '0', 'Cần Thơ',current_timestamp(), '1'),
('3', '3', 'Khổng Minh Lộc','3', '0', 'Nha Trang',current_timestamp(), '1'),
('4', '4', 'Lâm Hồng Phong', '4', '0', 'Vũng Tàu', current_timestamp(), '1');

INSERT INTO `categories` (`category_id`, `category_name`, `category_logo`, `is_active`) VALUES 
('1', 'Điện thoại','', '1'),
('2', 'Laptop','', '1'),
('3', 'Smartwatch','', '1'),
('4', 'Sạc dự phòng','', '1'),
('5', 'Tai nghe Bluetooth','', '1'),
('6', 'Loa','', '1'),
('7', 'Chuột máy tính','', '1'),
('8', 'Bàn phím','', '1');

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `phone_number_of_supplier`, `address_of_supplier`, `email_of_supplier`, `is_active`) VALUES 
('1', 'Apple Store Việt Nam', '0918001192', '268 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh', 'applestorevn@gmail.com', '1'),
('2', 'Galaxy Store Việt Nam', '0918001193', '280 Đ. An Dương Vương, Phường 4, Quận 5, Thành phố Hồ Chí Minh', 'galaxystorevn@gmail.com', '1'),
('3', 'Xiaomi Store Việt Nam', '0918001194', '217 Đ. Hồng Bàng, Phường 11, Quận 5, Thành phố Hồ Chí Minh', 'mistorevn@gmail.com', '1'),
('4', 'OPPO Store Việt Nam', '0918001195', '01 Võ Văn Ngân, Linh Chiểu, Thủ Đức, Thành phố Hồ Chí Minh', 'oppostorevn@gmail.com', '1'),
('5', 'Acer Store Việt Nam', '0918001196', '704-05/37 Đ. Tôn Đức Thắng, Ward, Quận 1, Thành phố Hồ Chí Minh', 'acerstorevn@gmail.com', '1'),
('6', 'HP Store Việt Nam', '0918001197', '475A Đ. Điện Biên Phủ, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh', 'hpstorevn@gmail.com', '1'),
('7', 'ASUS Store Việt Nam', '0918001198', '196 Pasteur, Phường 6, Quận 3, Thành phố Hồ Chí Minh', 'asusstorevn@gmail.com', '1'),
('8', 'Lenovo Store Việt Nam', '0918001199', '55 Giải Phóng, Đồng Tâm, Hai Bà Trưng, Hà Nội', 'lenovostorevn@gmail.com', '1'),
('9', 'AVA+ Store Việt Nam', '0918001200', '136 Xuân Thủy, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 'avaplusstorevn@gmail.com', '1'),
('10', 'Xmobile Store Việt Nam', '0918001201', 'Khu phố 6, TP Thủ Đức, Thành phố Hồ Chí Minh', 'xmobilestorevn@gmail.com', '1'),
('11', 'Baseus Store Việt Nam', '0918001202', '227 Đ. Nguyễn Văn Cừ, Phường 4, Quận 5, Thành phố Hồ Chí Minh', 'baseusstorevn@gmail.com', '1'),
('12', 'JBL Store Việt Nam', '0918001203', '12 Nguyễn Văn Bảo, Phường 4, Gò Vấp, Thành phố Hồ Chí Minh', 'jblstorevn@gmail.com', '1'),
('13', 'Sony Store Việt Nam', '0918001204', '97 Võ Văn Tần, Phường 6, Quận 3, Thành phố Hồ Chí Minh', 'sonystorevn@gmail.com', '1'),
('14', 'Logitech Store Việt Nam', '0918001205', '10-12 Đ. Đinh Tiên Hoàng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 'logitechstorevn@gmail.com', '1'),
('15', 'Genius Store Việt Nam', '0918001206', '19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', 'geniusstorevn@gmail.com', '1'),
('16', 'Corsair Store Việt Nam', '0918001207', '665-667-669 Đ. Điện Biên Phủ, Phường 1, Quận 3, Thành phố Hồ Chí Minh', 'corsairstorevn@gmail.com', '1'),
('17', 'Dareu Store Việt Nam', '0918001208', '180 Đ. Cao Lỗ, Phường 4, Quận 8, Thành phố Hồ Chí Minh', 'dareustorevn@gmail.com', '1'),
('18', 'Rapoo Store Việt Nam', '0918001209', '104 Đ. Nguyễn Văn Trỗi, Phường 8, Phú Nhuận, Thành phố Hồ Chí Minh', 'rapoostorevn@gmail.com', '1');

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_logo`, `supplier_id`, `is_active`) VALUES 
('1', 'Apple', 'apple.jpg', '1', '1'),
('2', 'Samsung', 'samsung.png', '2', '1'),
('3', 'Xiaomi', 'xiaomi.png', '3', '1'),
('4', 'OPPO', 'oppo.jpg', '4', '1'),
('5', 'Acer', 'acer.png', '5', '1'),
('6', 'HP', 'hp.png', '6', '1'),
('7', 'ASUS', 'asus.png', '7', '1'),
('8', 'Lenovo', 'lenovo.png', '8', '1'),
('9', 'AVA+', 'ava.jpg', '9', '1'),
('10', 'Xmobile', 'xmobile.jpg', '10', '1'),
('11', 'Baseus', 'baseus.jpg', '11', '1'),
('12', 'JBL', 'jbl.jpg', '12', '1'),
('13', 'Sony', 'sony.jpg', '13', '1'),
('14', 'Logitech', 'logitech.jpeg', '14', '1'),
('15', 'Genius', 'genius.jpg', '15', '1'),
('16', 'Corsair', 'corsair.jpg', '16', '1'),
('17', 'Dareu', 'dareu.png', '17', '1'),
('18', 'Rapoo', 'rapoo.png', '18', '1');

INSERT INTO `modules` (`module_id`, `module_name`, `is_active`) VALUES 
('1', 'Tài khoản', '1'),
('2', 'Nhân viên', '1'),
('3', 'Khách hàng', '1'),
('4', 'Sản phẩm', '1'),
('5', 'Nhà cung cấp', '1'),
('6', 'Kho hàng', '1'),
('7', 'Nhập hàng', '1'),
('8', 'Xuất hàng', '1'),
('9', 'Hóa đơn', '1'),
('10', 'Lương', '1'),
('11', 'Thống kê', '1'),
('12', 'Phân quyền', '1'),
('13', 'Quảng cáo', '1');

INSERT INTO `decentralizations` (`decentralization_id`, `role_id`, `module_id`, `is_active`) VALUES 
('1', '1', '1', '1'),-- admin
('2', '1', '12', '1'),
('3', '2', '1', '1'),-- nhan vien quan ly
('4', '2', '2', '1'),
('5', '2', '3', '1'),
('6', '2', '4', '1'),
('7', '2', '5', '1'),
('8', '2', '6', '1'),
('9', '2', '7', '1'),
('10', '2', '8', '1'),
('11', '2', '9', '1'),
('12', '2', '10', '1'),
('13', '2', '11', '1'),
('14', '2', '12', '1'),
('15', '2', '13', '1'),
('16', '3', '1', '1'),-- nhan vien ban hang
('17', '3', '3', '1'),
('18', '3', '4', '1'),
('19', '3', '9', '1'),
('20', '4', '4', '1'),-- nhan vien kho
('21', '4', '5', '1'),
('22', '4', '6', '1'),
('23', '4', '7', '1'),
('24', '4', '8', '1');

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `category_id`, `price`, `guarantee`, `thumbnail`, `description`, `created_at`, `updated_at`, `is_active`) VALUES 
('1', 'iPhone 15 Pro Max RAM 8GB/ROM 256GB', '1', '1', '34990000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('2', 'Samsung Galaxy S23 FE 5G RAM 8GB/ROM 128GB', '2', '1', '14890000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('3', 'Xiaomi Redmi Note 13 RAM 6GB/ROM 128GB', '3', '1', '4890000', '18', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('4', 'OPPO A57 RAM 4GB/ROM 128GB', '4', '1', '4990000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('5', 'Acer Aspire 5 A514 54 5127 i5 1135G7 (NX.A28SV.007) RAM 8GB/SSD 512GB', '5', '2', '15490000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('6', 'HP Pavilion 15 eg2062TX i5 1235U (7C0W7PA) RAM 8GB/SSD 512GB', '6', '2', '20590000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('7', 'Asus TUF Gaming F15 FX507ZC4 i5 12500H (HN074W) RAM 8GB/SSD 512GB', '7', '2', '23990000', '24', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('8', 'Lenovo Gaming Legion 5 16IRH8 i5 13500H (82YA00BSVN) RAM 16GB/SSD 512', '8', '2', '36990000', '36', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('9', 'AVA+ 15W JP399', '9', '4', '500000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('10', 'Xmobile 20W DS223B', '10', '4', '890000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('11', 'Baseus Comet 22.5W PPMD10 kèm cáp Lightning và Type C', '11', '4', '1100000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('12', 'Apple Watch SE 2023 GPS 40mm viền nhôm dây thể thao', '1', '3', '6390000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('13', 'Samsung Galaxy Watch5 Pro LTE 45mm dây silicone', '2', '3', '12990000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('14', 'Xiaomi Redmi Watch 4 47.5mm dây silicone', '3', '3', '2690000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('15', 'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3', '1', '5', '6200000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('16', 'Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 5 Pro', '3', '5', '1990000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('17', 'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20', '9', '5', '290000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('18', 'Loa Bluetooth JBL Pulse 5', '12', '6', '6690000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('19', 'Loa Bluetooth Sony SRS-XB13', '13', '6', '1290000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('20', 'Loa Bluetooth AVA+ FreeGo F13', '9', '6', '450000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('21', 'Chuột Không Dây Silent Rapoo B2S', '18', '7', '200000', '24', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('22', 'Chuột Không dây DareU LM106G', '17', '7', '150000', '24', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('23', 'Chuột Có dây Gaming Corsair M55 RGB Pro', '16', '7', '890000', '24', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('24', 'Chuột Có dây Gaming Genius Scorpion M700', '15', '7', '490000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('25', 'Bàn phím Bluetooth Logitech K380', '14', '8', '750000', '12', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1'),
('26', 'Bàn Phím Có Dây DareU EK87', '17', '8', '650000', '24', '', 'Đây là mô tả sản phẩm', current_timestamp(), current_timestamp(), '1');

-- INSERT INTO `orders` (`order_id`, `staff_id`, `account_id`, `receiver_name`, `email_of_receiver`, `phone_number_of_receiver`, `note`, `order_date`, `status_of_order`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `is_active`) VALUES 
-- ('1', '3', '5', 'Anh Hiển', 'thehien@gmail.com', '0786705877', 'Tặng anh Hiển', current_timestamp(), 'Pending', '35990000', 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '70L1-13579', 'COD', '1');

-- INSERT INTO `order_details` (`order_detail_id`, `order_id`, `sku_id`, `price`, `number_of_products`, `color_of_product`) VALUES 
-- ('1', '1', '1', '34990000', '1', 'Đen'),
-- ('2', '1', '9', '500000', '2', 'Đen');

INSERT INTO `leave_application` (`leave_application_id`, `staff_id`, `start_date`, `end_date`, `reason`, `status`) VALUES 
('1', '1', '2024-04-15', '2024-04-15', 'Lý do cá nhân', '0'),
('2', '2', '2024-04-15', '2024-04-15', 'Ốm đau, thai sản', '0'),
('3', '3', '2024-04-15', '2024-04-15', 'Ốm đau, thai sản', '0'),
('4', '2', '2024-04-16', '2024-04-16', 'Lý do cá nhân', '0'),
('5', '1', '2024-04-16', '2024-04-16', 'Ốm đau, thai sản', '0'),
('6', '3', '2024-04-16', '2024-04-16', 'Ốm đau, thai sản', '0');

INSERT INTO `contracts` (`contract_id`, `staff_id`, `start_date`, `end_date`, `salary`) VALUES 
('1', '1', '2024-04-01', '2025-04-01', '20000000'), 
('2', '2', '2024-04-01', '2025-04-01', '18000000'),
('3', '3', '2024-04-01', '2025-04-01', '13000000'),
('4', '4', '2024-04-01', '2025-04-01', '15000000');

INSERT INTO `timesheets` (`timesheet_id`, `contract_id`, `month`, `year`, `days_worked`, `days_off`, `days_leave`, `days_late`) VALUES ('1', '1', '4', '2025', '22', '1', '1', '2'),
('2', '2', '4', '2025', '26', '0', '0', '0'),
('3', '3', '4', '2025', '23', '0', '1', '2'),
('4', '4', '4', '2025', '25', '0', '1', '0');

INSERT INTO `attendance` (`attendance_id`, `timesheet_id`, `date`, `status`, `leave_application_id`) VALUES 
('1', '1', '2024-04-16', 'Present', '1'),
('2', '2', '2024-04-16', 'Present', '2'),
('3', '3', '2024-04-16', 'Present', '3');

-- INSERT INTO `attendance` (`attendance_id`, `timesheet_id`, `date`, `status`) VALUES 
-- ('1', '1', '2024-04-01', 'Present'),
-- ('2', '1', '2024-04-02', 'Present'),
-- ('3', '1', '2024-04-03', 'Present'),
-- ('4', '1', '2024-04-04', 'Present'),
-- ('5', '1', '2024-04-05', 'Present'),
-- ('6', '1', '2024-04-06', 'Present'),
-- ('7', '1', '2024-04-07', 'Present'),
-- ('8', '1', '2024-04-08', 'Present'),
-- ('9', '1', '2024-04-09', 'Present'),
-- ('10', '1', '2024-04-10', 'Present'),
-- ('11', '1', '2024-04-11', 'Present'),
-- ('12', '1', '2024-04-12', 'Present'),
-- ('13', '1', '2024-04-13', 'Present'),
-- ('14', '1', '2024-04-14', 'Present'),
-- ('15', '1', '2024-04-15', 'Present'),
-- ('16', '1', '2024-04-16', 'Present'),
-- ('17', '1', '2024-04-17', 'Present'),
-- ('18', '1', '2024-04-18', 'Present'),
-- ('19', '1', '2024-04-19', 'Present'),
-- ('20', '1', '2024-04-20', 'Present'),
-- ('21', '1', '2024-04-21', 'Present'),
-- ('22', '1', '2024-04-22', 'Present'),
-- ('23', '1', '2024-04-23', 'Present'),
-- ('24', '1', '2024-04-24', 'Present'),
-- ('25', '1', '2024-04-25', 'Present'),
-- ('26', '1', '2024-04-26', 'Present'),
-- ('27', '1', '2024-04-27', 'Present'),
-- ('28', '1', '2024-04-28', 'Present'),
-- ('29', '1', '2024-04-29', 'Present'),
-- ('30', '1', '2024-04-30', 'Present');

-- 12.Kiểm tra total_salary = salary/26 * days_worked - (salary/26 * days_late * 30%)

INSERT INTO suppliers (supplier_id, supplier_name, phone_number_of_supplier, address_of_supplier, email_of_supplier) VALUES ('19', 'Dell Store Việt Nam', '0923020320', '1230123902103', 'dellstorevn@gamil.com');
INSERT INTO brands (brand_id, brand_name, brand_logo,supplier_id,is_active) VALUES ('19', 'Dell', 'dell.png','19','1');

INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('27', 'Laptop Dell Inspiron 15 3520 i5 1235U/16GB/512GB/120Hz/OfficeHS/KYHD/Win11', '19', '2', '154900', '24', 'laptop/dell_inspiron.png', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('28', 'Laptop Dell Vostro 14 3430 i5 1335U/8GB/512GB/2GB MX550/OfficeHS/Win11', '19', '2', '119900', '24', 'laptop/dell_vostro.png', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('29', 'Laptop Dell Precision 14 3480 i7 12800H/32GB/1TB/4GB RTXA500/Win11 Pro', '19', '2', '507900', '24', 'laptop/dell_precision.png', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('30', 'Laptop Lenovo IdeaPad 1 15AMN7 R5 7520U/8GB/256GB/Win11', '8', '2', '98900', '24', 'laptop/lenovo-ideapad-1-15amn7-r5-82vg0061vn-glr-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('31', 'Laptop Lenovo V14 G3 ABA R5 5625U/8GB/512GB/Win11', '8', '2', '98900', '24', 'laptop/lenovo-v14-g3-aba-r5-82tu006svn-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('32', 'Laptop Lenovo Yoga 7 14IRL8 i5 1340P/16GB/512GB/Touch/Pen/OfficeHS/Win11', '8', '2', '98900', '24', 'laptop/vi-vn-lenovo-yoga-7-14irl8-i5-82yl006avn-slider-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('33', 'Laptop Acer Aspire 3 A315 510P 32EF i3 N305/8GB/256GB/Win11', '5', '2', '89900', '24', 'laptop/acer-aspire-3-a315-510p-32ef-i3-nxkdhsv001-glr-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('34', 'Laptop Acer Gaming Aspire 7 A715 43G R8GA R5 5625U/8GB/512GB/4GB RTX3050/144Hz/Win11', '5', '2', '159900', '24', 'laptop/acer-aspire-7-gaming-a715-43g-r8ga-r5-nhqhdsv002-2-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('35', 'Laptop Acer Aspire Lite 15 51M 55NB i5 1155G7/8GB/512GB/Win11', '5', '2', '119900', '24', 'laptop/acer-aspire-lite-15-51m-55nb-i5-nxkrssv001-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('36', 'Laptop HP 245 G10 R5 7520U/8GB/512GB/Win11', '6', '2', '114900', '24', 'laptop/hp-245-g10-r5-8f155pa-glr-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('37', 'Laptop HP 15s fq5229TU i3 1215U/8GB/512GB/Win11', '6', '2', '104900', '24', 'laptop/hp-15s-fq5229tu-i3-8u237pa-glr-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('38', 'Laptop HP Pavilion 14 dv2073TU i5 1235U/16GB/512GB/Win11 ', '6', '2', '175900', '24', 'laptop/hp-pavilion-14-dv2073tu-i5-7c0p2pa-2-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('39', 'Laptop ASUS Zenbook 14 OLED UM3402YA-KM405W', '7', '2', '204900', '24', 'laptop/text_ng_n_16__3_10.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('40', 'Laptop Asus TUF Gaming FX507ZC4-HN095W i5 12500H/16GB/512GB/15.6"/Nvidia RTX 3050 4GB/Win11', '7', '2', '209900', '24', 'laptop/638249405783488795_Asus TUF Gaming FX507ZC4-HN095W 1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('41', 'Laptop Asus TUF Gaming FX506HC-HN144W i5 11400H/8GB/512GB/15.6"FHD/GeForce RTX 3050 4GB/Win 11', '7', '2', '174900', '24', 'laptop/ASUS-TUF-Gaming-F15-2021-black-fpt-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('42', 'Điện thoại iPhone 15 Pro Max 256GB', '1', '2', '299900', '24', 'smartphone/iphone-15-pro-max-blue-1-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('43', 'Điện thoại iPhone 14 Pro Max 128GB', '1', '2', '273900', '24', 'smartphone/iphone-14-pro-max-purple-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('44', 'Điện thoại iPhone 12 64GB', '1', '2', '120900', '24', 'smartphone/iphone-12-trang-1-1-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('45', 'Điện thoại Samsung Galaxy S24 5G 256GB', '2', '2', '170900', '24', 'smartphone/samsung-galaxy-s24-sliderr-11-1020x570.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('46', 'Điện thoại Samsung Galaxy S23 FE 5G 128GB - Màu Đặc Quyền', '2', '2', '123900', '24', 'smartphone/samsung-galaxy-s23-fe-sld-1-1020x570.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('47', 'Điện thoại Samsung Galaxy Z Flip5 5G 256GB', '2', '2', '216900', '24', 'smartphone/samsung-galaxy-z-flip5-5g-sld-1021x570.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('48', 'Điện thoại Xiaomi 14 5G 512GB', '3', '2', '224900', '24', 'smartphone/vi-vn-xiaomi-14-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('49', 'Điện thoại Xiaomi Redmi Note 13 Pro 5G', '3', '2', '89900', '24', 'smartphone/xiaomi-redmi-note-13-pro-sliderr-99-2048x1144.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('50', 'Điện thoại Xiaomi Redmi Note 13 Pro 256GB', '3', '2', '74900', '24', 'smartphone/xiaomi-redmi-note-13-pro-8-256638441930939443824.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('51', 'Điện thoại OPPO Reno11 5G', '4', '2', '299900', '24', 'smartphone/oppo-reno11-f-5g638453188556795907.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('52', 'Điện thoại OPPO A18 64GB ', '4', '2', '32900', '24', 'smartphone/oppo-a18-12-1020x570.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('53', 'Điện thoại OPPO A57 128GB ', '4', '2', '36900', '24', 'smartphone/oppo-a57-4g637916782091781459-1020x570.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('54', 'Loa Bluetooth JBL Flip 6', '12', '6', '28400', '24', 'speaker/bluetooth-jbl-flip-6-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('55', 'Loa Bluetooth JBL Pulse 5', '12', '6', '63500', '24', 'speaker/loa-bluetooth-jbl-pulse-5-1-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('56', 'Loa Bluetooth JBL Partybox On The Go', '12', '6', '54900', '24', 'speaker/bluetooth-jbl-partybox-on-the-go-600x600-1-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('57', 'Loa Bluetooth JBL Authentics AUTH500 ', '12', '6', '160000', '24', 'speaker/loa-bluetooth-jbl-authentics-auth500-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('58', 'Loa Bluetooth JBL Authentics 300', '12', '6', '112900', '24', 'speaker/loa-bluetooth-jbl-authentics-a300-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('59', 'Loa Bluetooth JBL Partybox Encore 2Mic', '12', '6', '103900', '24', 'speaker/loa-bluetooth-jbl-partybox-encore-2mic-5.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('60', 'Loa Bluetooth JBL Xtreme 3', '12', '6', '62600', '24', 'speaker/loa-bluetooth-jbl-xtreme-3-den-7.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('61', 'Loa Bluetooth JBL Boombox 3 ', '12', '6', '113900', '24', 'speaker/loa-bluetooth-jbl-boombox-3-01.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('62', 'Loa Bluetooth JBL Partybox 310 ', '12', '6', '149000', '24', 'speaker/loa-bluetooth-jbl-partybox-310-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('63', 'Loa Bluetooth JBL Partybox 110 ', '12', '6', '109000', '24', 'speaker/loa-bluetooth-jbl-partybox-110-imei-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('64', 'Tai nghe Bluetooth True Wireless Sony WF-C700N ', '13', '5', '21900', '24', 'bluetooth_headphone/tai-nghe-bluetooth-true-wireless-sony-wf-c700n-den-2.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('65', 'Tai nghe Bluetooth True Wireless Sony WF-C500  ', '13', '5', '15200', '24', 'bluetooth_headphone/bluetooth-true-wireless-sony-wf-c500-den-1-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('66', 'Tai nghe Bluetooth chụp tai Sony WH-1000XM4 ', '13', '5', '51900', '24', 'bluetooth_headphone/group_17333.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('67', 'Tai nghe Bluetooth chụp tai Sony WH-1000XM5 ', '13', '5', '65900', '24', 'bluetooth_headphone/tai-nghe-chup-tai-sony-wh-1000xm5-4.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('68', 'Tai nghe Gaming chụp tai không dây Sony INZONE H5 ', '13', '5', '29900', '24', 'bluetooth_headphone/tai-nghe-chup-tai-sony-inzone-h5_5_.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('69', 'Chuột Bluetooth Silent Logitech M240 ', '14', '7', '3400', '24', 'mouse/chuot-bluetooth-silent-logitech-m240-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('70', 'Chuột Không dây Logitech M190 ', '14', '7', '2900', '24', 'mouse/chuot-khong-day-logitech-m190-xanh-den-1-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('71', 'Chuột Có dây Gaming Logitech G102 Gen2 Lightsync  ', '14', '7', '4050', '24', 'mouse/chuot-gaming-logitech-g102-gen2-lightsync-den-1-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('72', 'Chuột Không dây Logitech M185 ', '14', '7', '2350', '24', 'mouse/chuot-khong-day-logitech-m185-xanh-1-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('73', 'Chuột Không dây Bluetooth Silent Logitech Signature M650 ', '14', '7', '6900', '24', 'mouse/chuot-khong-day-logitech-signature-m650-den-size-m-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('74', 'Chuột Không Dây Logitech M171  ', '14', '7', '3000', '24', 'mouse/chuot-khong-day-logitech-m171-hong-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('75', 'Chuột Không dây Silent Logitech M331  ', '14', '7', '3400', '24', 'mouse/chuot-khong-day-silent-logitech-m331-den-1-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('76', 'Chuột Không dây Bluetooth Logitech MX Anywhere 2S Đen ', '14', '7', '11900', '24', 'mouse/chuot-khong-day-logitech-mx-anywhere-2s-den-2-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('77', 'Chuột Không dây Logitech Silent M220 ', '14', '7', '3000', '24', 'mouse/chuot-khong-day-logitech-silent-m220-den-2-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('78', 'Chuột Không dây Logitech M170  ', '14', '7', '2650', '24', 'mouse/chuot-khong-day-logitech-m170-den-2-org.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('79', 'Bàn phím Bluetooth Logitech K380s  ', '14', '8', '7900', '24', 'keyboard/ban-phim-bluetooth-logitech-k380s-hong-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('80', 'Bộ Bàn Phím Chuột Không Dây Logitech MK240  ', '14', '8', '4900', '24', 'keyboard/bo-ban-phim-chuot-khong-day-logitech-mk240-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('81', 'Bàn Phím Có Dây Logitech K120 ', '14', '8', '2000', '24', 'keyboard/ban-phim-co-day-logitech-k120-1.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('82', 'Bàn phím Logitech G715 TKL Off White Tactile ', '14', '8', '43390', '24', 'keyboard/ry-2_7af4effd78704121b18c73e248e8c837_dc5da1862ff54f40b5a3ca4c1588b460_424c03d1e5b6411fa4f795ec1153ace7_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('83', 'Bàn phím Logitech G512 GX RGB Tactile ', '14', '8', '19900', '24', 'keyboard/thumbphim_849d9bd31e594549b4cdce2e5fb3e375_f6b2f16edca047db8ae41f652391e5e8_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('84', 'Bàn phím Logitech G Pro X TKL Light Speed Tactile Switch Black ', '14', '8', '39900', '24', 'keyboard/1_5b2f7891bf434a7aab9f1abdba56c17e_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('85', 'Bàn phím Logitech G Pro X Gaming - Đen ', '14', '8', '22900', '24', 'keyboard/thumbphim_9fb12e4f19d94b31aeb8cc81546d86df_b2aa143d682b4850a8f2abe30706a659_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('86', 'Bàn phím cơ Logitech MX Mechanical Graphite Tactile Silent 920-010760 ', '14', '8', '39900', '24', 'keyboard/hanical-keyboard-top-view-graphite-us_602a1fb095904851880b1da99a10fb6a_c609e86185f249e78554c198895da48f_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('87', 'Bàn phím Logitech Pebble Keys 2 K380S White ', '14', '8', '7200', '24', 'keyboard/2_32cbb3f99f4e460cb0dbb41ac19450d0_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');
INSERT INTO products (product_id, product_name, brand_id, category_id, price, guarantee, thumbnail, created_at, updated_at) VALUES ('88', 'Bàn Phím Bluetooth Logitech K380 Black ', '14', '8', '6090', '24', 'keyboard/hinh-1_8c2dd4e8724c4e6b80d6709e92a9f6e1_5f112479df724affa1ce4f649a40ad43_grande.jpg', '2024-03-24 10:28:44', '2024-03-24 10:28:44');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TX', 'Titan xanh', '42');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TD', 'Titan den', '42');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TN', 'Titan tu nhien', '42');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TW', 'Titan trang', '42');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-W', 'Trang', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-XL', 'Xanh lá', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-D', 'Đen', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-T', 'Tím', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-XD', 'Xanh dương', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-R', 'Đỏ', '44');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-V', 'Vàng', '45');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-X', 'Xám', '45');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-D', 'Đen', '45');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-T', 'Tím', '45');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('46-W', 'Trang', '46');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('46-X', 'Xanh mint', '46');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-X', 'Xanh mint', '47');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-T', 'Tím', '47');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-G', 'Xám', '47');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-K', 'Kem', '47');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('48-W', 'Trang', '48');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('48-XL', 'Xanh lá', '48');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('48-D', 'Đen', '48');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('49-X', 'Xanh', '49');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('49-D', 'Đen', '49');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('49-T', 'Tím', '49');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('50-XL', 'Xanh lá', '50');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('50-D', 'Đen', '50');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('50-T', 'Tím', '50');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('52-D', 'Đen', '52');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('52-XD', 'Xanh dương', '52');

INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('1-128G-Y', '128GB - Vàng', '1');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('1-256G-Y', '256GB - Vàng', '1');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('1-128G-S', '128GB - Bạc', '1');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('1-256G-S', '256GB - Bạc', '1');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('1-128G-P', '128GB - Hồng', '1');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('1-256G-P', '256GB - Hồng', '1');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('2-128G-B', '128GB - Đen', '2');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('2-256G-B', '256GB - Đen', '2');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('2-128G-S', '128GB - Bạc', '2');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('2-256G-S', '256GB - Bạc', '2');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('2-128G-R', '128GB - Đỏ', '2');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('2-256G-R', '256GB - Đỏ', '2');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('3-128G-Y', '128GB - Vàng', '3');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('3-256G-Y', '256GB - Vàng', '3');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('3-128G-P', '128GB - Hồng', '3');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('3-256G-P', '256GB - Hồng', '3');

INSERT INTO `skus` (`sku_code`, `product_id`) VALUES ('5-D', '5');
INSERT INTO `skus` (`sku_code`, `product_id`) VALUES ('6-D', '6');
INSERT INTO `skus` (`sku_code`, `product_id`) VALUES ('7-D', '7');
INSERT INTO `skus` (`sku_code`, `product_id`) VALUES ('8-D', '8');

INSERT INTO `banner_locations` (`location_id`, `location_name`) VALUES ('1', 'home-header');

INSERT INTO `banners` (`image_path`, `url`, `banner_name`, `location_id`, `width`, `height`) VALUES ('banners/banner1.png', '../Catalog/Category?context=laptop?context-value=1', 'banner_header1', '1', '800', '600');
INSERT INTO `banners` (`image_path`, `url`, `banner_name`, `location_id`, `width`, `height`) VALUES ('banners/banner2.png', '../Catalog/Category?context=laptop?context-value=2', 'banner_header2', '1', '800', '600');

INSERT INTO `featured_products_rows` (`row_name`, `row_description`,`index`) VALUES ('Sản phẩm nổi bật', 'Các sản phẩm mới và nổi bật trong tháng 4',1);
INSERT INTO `featured_products_rows` (`row_name`, `row_description`,`index`) VALUES ('Sản phẩm mới', 'Sản phẩm mới vừa xuất hiện trên thị trường',2);

INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES ('1', '1', '1');
INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES ('2', '2', '1');
INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES ('3', '3', '1');