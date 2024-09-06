CREATE TABLE `noti` (
  `noti_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `text` varchar(500) DEFAULT NULL,
  `date_noti` datetime DEFAULT current_timestamp()
) ;

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
  `location_id` INT PRIMARY KEY AUTO_INCREMENT,
  `location_name` VARCHAR(512) NULL
);

-- CREATE TABLE `banners` (
--   `banner_id` INT NOT NULL AUTO_INCREMENT,
--   `image_path` VARCHAR(512) NULL,
--   `url` VARCHAR(512) NULL,
--   `banner_name` VARCHAR(256) NULL,
--   `location_id` INT NULL,
--   `width` INT NULL,
--   `height` INT NULL,
--   `is_active` TINYINT(1) DEFAULT 1,
--   PRIMARY KEY (`banner_id`),
--   INDEX `banner_banner-locations_idx` (`location_id` ASC) VISIBLE,
--   CONSTRAINT `banner_banner-locations`
--     FOREIGN KEY (`location_id`)
--     REFERENCES `banner_locations` (`location_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION);
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
  INDEX `banner_banner-locations_idx` (`location_id` ASC),
  CONSTRAINT `banner_banner-locations`
    FOREIGN KEY (`location_id`)
    REFERENCES `banner_locations` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);




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
  `order_id` int(11) NULL,
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
  `staff_id` int(11) NULL,
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
  `shipping_date` datetime NULL,
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
CREATE TABLE `removes` (
  `orderID` INT(11),
  `order_detail_id` INT(11),
  `shipment_id` INT(11),
  `number` INT(50),
  `price_remove` DECIMAL(20, 2), -- Đã thêm cột giá vào bảng Removes
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
  `status` ENUM('Chưa điểm danh','Có mặt', 'Vắng mặt', 'Nghỉ phép', 'Trễ') NOT NULL,
  `leave_application_id` int(11) 
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

-- ALTER TABLE `featured_products` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
-- ALTER TABLE `featured_products` ADD FOREIGN KEY (`featured_row`) REFERENCES `featured_products_rows` (`row_id`);


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
-- 2. Kiểm tra quantity_export > 0
-- ALTER TABLE `export_details`
-- ADD CONSTRAINT check_export_quantity_export_details CHECK (`export_details`.quantity_export > 0);
-- -- 3. Kiểm tra xem total_price = unit_price_export*quantity_export không
-- DELIMITER //
-- CREATE TRIGGER calculate_total_price_export_insert
-- AFTER INSERT ON export_details
-- FOR EACH ROW
-- BEGIN
--     UPDATE `exports`
--     SET `exports`.total_price = (
--         SELECT SUM(unit_price_export * quantity_export)
--         FROM export_details
--         WHERE export_id = NEW.export_id
--     )
--     WHERE export_id = NEW.export_id;
-- END; //
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER calculate_total_price_export_update
-- AFTER UPDATE ON export_details
-- FOR EACH ROW
-- BEGIN
--     UPDATE `exports`
--     SET `exports`.total_price = (
--         SELECT SUM(unit_price_export * quantity_export)
--         FROM export_details
--         WHERE export_id = NEW.export_id
--     )
--     WHERE export_id = NEW.export_id;
-- END; //
-- DELIMITER ;

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
-- 5.Kiểm tra nếu thời gian hiện tại mà sau exp thì is_active = 0
-- ALTER TABLE `shipments`
-- ADD CONSTRAINT check_exp_shipments CHECK (`shipments`.exp < CURDATE())

-- ORDERS ----------------------------------------
-- 2.Kiểm tra account_id phải có role_là 5(nếu không có customer nào có account_id đó thì không được tạo order)
-- DELIMITER //
-- CREATE TRIGGER calculate_total_money_export_insert
-- AFTER INSERT ON export_details
-- FOR EACH ROW
-- BEGIN
--     UPDATE `exports`
--     SET `exports`.total_price = (
--         SELECT SUM(unit_price_export * quantity_export)
--         FROM export_details
--         WHERE export_id = NEW.export_id
--     )
--     WHERE export_id = NEW.export_id;
-- END; //
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER calculate_total_money_order_update
-- AFTER UPDATE ON export_details
-- FOR EACH ROW
-- BEGIN
--     UPDATE `exports`
--     SET `exports`.total_price = (
--         SELECT SUM(unit_price_export * quantity_export)
--         FROM export_details
--         WHERE export_id = NEW.export_id
--     )
--     WHERE export_id = NEW.export_id;
-- END; //
-- DELIMITER ;
-- -- 7.Kiểm tra shipping_date > ngày hiện tại
-- DELIMITER //
-- CREATE TRIGGER check_shipping_date_order_insert
-- BEFORE INSERT ON `orders`
-- FOR EACH ROW
-- BEGIN
--     IF (NEW.shipping_date <= CURDATE()) THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Error: Shipping_date must bigger current date';
--     END IF;
-- END; //
-- DELIMITER ;
-- DELIMITER //
-- CREATE TRIGGER check_shipping_date_order_update
-- BEFORE UPDATE ON `orders`
-- FOR EACH ROW
-- BEGIN
--     IF (NEW.shipping_date IS NOT NULL AND NEW.shipping_date <= CURDATE()) THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Error: Shipping_date must be greater than the current date';
--     END IF;
-- END; //
-- DELIMITER ;
-- 8.Kiểm tra staff_id phải có role_là 1,2,3
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




DELIMITER $$
CREATE TRIGGER `create_export_trigger` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    -- Check if the status_of_order has been changed to 'Shipped'
    IF OLD.status_of_order <> NEW.status_of_order AND NEW.status_of_order = 'Shipped' THEN
        -- Insert a new row into exports table
        INSERT INTO exports (staff_id, order_id, export_date, total_price)
        SELECT NEW.staff_id, NEW.order_id, NOW(), NEW.total_money;
    END IF;
END
$$
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
    DECLARE productPrice DECIMAL(20, 2);

    -- Get the price of the product
    SELECT price INTO productPrice
    FROM order_details
    WHERE order_detail_id = NEW.order_detail_id;

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

        -- Insert into Removes with the calculated number and price
        INSERT INTO Removes (orderID, order_detail_id, shipment_id, number, price_remove)
        VALUES (NEW.order_id, NEW.order_detail_id, shipmentID, productsToAdd, productPrice);

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
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reduce_shipment_remain` (IN `shipment_id_param` INT, IN `quantity_of_export_param` INT)   BEGIN
    UPDATE shipments
    SET remain = remain - quantity_of_export_param
    WHERE shipment_id = shipment_id_param;
END$$

DELIMITER ;



INSERT INTO `roles` (`role_id`, `role_name`, `is_active`) VALUES 
('1', 'Admin', '1'), 
('2', 'Nhân viên quản lý', '1'),
('3', 'Nhân viên bán hàng', '1'),
('4', 'Nhân viên kho', '1'),
('5', 'Khách hàng', '1');

INSERT INTO `accounts` (`account_id`,`avatar`, `phone_number`, `email`, `password`, `created_at`, `updated_at`, `is_active`) VALUES
(1,'avatar_0988722521.jpg', '0988722521', 'hien@gmail.com', 'thien123', current_timestamp(), current_timestamp(), 1),
(2,'avatar_0988722522.jpg', '0988722522', 'huy@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(3,'avatar_0988722523.jpg', '0988722523', 'loc@gmail.com', 'mloc123', current_timestamp(), current_timestamp(), 1),
(4,'avatar_0988722524.jpg', '0988722524', 'phong@gmail.com', 'hphong123',current_timestamp(), current_timestamp(), 1),
(5,'avatar_0988722525.jpeg', '0988722525', 'lan@gmail.com', 'tlan123', current_timestamp(), current_timestamp(), 1),
(6,'avatar_0988722526.jpeg', '0988722526', 'lieu@gmail.com', 'tlieu123', current_timestamp(), current_timestamp(), 1),
(7,'avatar_0988722527.jpeg', '0988722527', 'lai@gmail.com', 'tlai123', current_timestamp(), current_timestamp(), 1),
(8,'avatar_0988722528.jpg', '0988722528', 'camhuong@gmail.com', 'chuong123', current_timestamp(), current_timestamp(), 1),
(9,'customerAvatar/cat-d.png', '0988722532', 'customer1@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(10,'customerAvatar/the-wok.png', '0988722544', 'customer2@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(11,'customerAvatar/1.jpg', '0988722533', 'customer3@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(12,'customerAvatar/1.jpg', '0988722534', 'customer4@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(13,'customerAvatar/1.jpg', '0988722535', 'customer5@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(14,'customerAvatar/1.jpg', '0988722536', 'customer6@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(15,'customerAvatar/1.jpg', '0988722537', 'customer7@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(16,'customerAvatar/1.jpg', '0988722538', 'customer8@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(17,'customerAvatar/1.jpg', '0988722539', 'customer9@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(18,'customerAvatar/1.jpg', '0988722540', 'customer10@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(19,'customerAvatar/1.jpg', '0988722541', 'customer11@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(20,'customerAvatar/1.jpg', '0988722542', 'customer12@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(21,'customerAvatar/1.jpg', '0988722543', 'customer13@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(22,'customerAvatar/1.jpg', '0988722545', 'customer14@gmail.com', '123', current_timestamp(), current_timestamp(), 1),
(23,'customerAvatar/1.jpg', '0988722546', 'customer15@gmail.com', '123', current_timestamp(),  current_timestamp(), 1);

INSERT INTO `customers` (`customer_id`, `customer_fullname`, `role_id`, `account_id`, `gender`, `address`, `date_of_birth`, `is_active`) VALUES 
('1', 'Nguyễn Thị Lan', '5', '5', '1', 'Quận 1, Thành Phố Hồ Chí Minh', '2003-06-12', '1'),
('2', 'Nguyễn Thị Liễu', '5', '6', '1', 'Quận 2, Thành Phố Hồ Chí Minh', '2003-04-12', '1'),
('3', 'Nguyễn Thị Lài', '5', '7', '1', 'Quận 3, Thành Phố Hồ Chí Minh', '2004-02-11', '1'),
('4', 'Nguyễn Thị Cẩm Hường', '5', '8', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('5', 'Tôi là khách hàng', '5', '9', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('6', 'Mai Thị Sặc', '5', '10', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('7', 'Wok man', '5', '11', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('8', 'Lý Thị Tình', '5', '12', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('9', 'Lê Đình Bùn', '5', '13', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('10', 'Mai Thị Huệ', '5', '14', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('11', 'Bùi Văn Rức', '5', '15', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('12', 'Lý Thị Hạnh', '5', '16', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('13', 'Đặng Văn Thành', '5', '17', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('14', 'Hoàng Thị Lan', '5', '18', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('15', 'Lê Văn Ngã', '5', '19', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('16', 'Nguyễn Văn Quảng', '5', '20', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('17', 'Đặng Văn Hùng', '5', '21', '1', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('18', 'Lý Thị Thanh', '5', '22', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1'),
('19', 'Mai Thị Lan', '5', '23', '0', 'Quận 4, Thành Phố Hồ Chí Minh', '2001-05-11', '1');

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
('1', 'iPhone 15 Pro Max RAM 8GB/ROM 256GB', '1', '1', '34990000.00', '12', '1/iphone_15_pro_max.jpg', 'iPhone 15 là sự lựa chọn hoàn hảo cho những người sành điện thoại', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('2', 'Samsung Galaxy S23 FE 5G RAM 8GB/ROM 128GB', '2', '1', '14890000.00', '12', '1/samsung_galaxy_s23_fe_5g.jpeg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('3', 'Xiaomi Redmi Note 13 RAM 6GB/ROM 128GB', '3', '1', '4890000.00', '18', '1/xiaomi_redmi_note_13.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('4', 'OPPO A57 RAM 4GB/ROM 128GB', '4', '1', '4990000.00', '12', '1/oppo_a57.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('5', 'Acer Aspire 5 A514 54 5127 i5 1135G7 (NX.A28SV.007) RAM 8GB/SSD 512GB', '5', '2', '15490000.00', '12', '2/acer_aspire_a514_54_5127_i5.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('6', 'HP Pavilion 15 eg2062TX i5 1235U (7C0W7PA) RAM 8GB/SSD 512GB', '6', '2', '20590000.00', '12', '2/hp_pavilion_15_eg2062tx_i5.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('7', 'Asus TUF Gaming F15 FX507ZC4 i5 12500H (HN074W) RAM 8GB/SSD 512GB', '7', '2', '23990000.00', '24', '2/asus_tuf_gaming_f15_fx507zc4_i5.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('8', 'Lenovo Gaming Legion 5 16IRH8 i5 13500H (82YA00BSVN) RAM 16GB/SSD 512', '8', '2', '36990000.00', '36', '2/lenovo_legion_5_16irh8_i5.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('9', 'AVA+ 15W JP399', '9', '4', '500000.00', '12', '4/pin_sac_du_phong_polymer_10000mah_type_c_15w_ava.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('10', 'Xmobile 20W DS223B', '10', '4', '890000.00', '12', '4/sac_du_phong_polymer_10000mah_khong_day_magnetic_type_c_pd_20w_xmobile.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('11', 'Baseus Comet 22.5W PPMD10 kèm cáp Lightning và Type C', '11', '4', '1100000.00', '12', '4/sac-du-phong-10000mah_typecpd_22_5w_baseus_ppmd10_cap_lightning_va_typec.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('12', 'Apple Watch SE 2023 GPS 40mm viền nhôm dây thể thao', '1', '3', '6390000.00', '12', '3/apple_watch_se_2023_40mm_vien_nhom_day_silicone_xanh_duong.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('13', 'Samsung Galaxy Watch5 Pro LTE 45mm dây silicone', '2', '3', '12990000.00', '12', '3/samsung_galaxy_watch5_pro.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('14', 'Xiaomi Redmi Watch 4 47.5mm dây silicone', '3', '3', '2690000.00', '12', '3/dong_ho_thong_minh_xiaomi_redmi_watch_4_47_5mm.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('15', 'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3', '1', '5', '6200000.00', '12', '5/tai_nghe_bluetooth_airpods_pro_2nd_gen_usb_c_charge_apple.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('16', 'Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 5 Pro', '3', '5', '1990000.00', '12', '5/tai_nghe_bluetooth_true_wireless_xiaomi_redmi_buds_5_pro.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('17', 'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20', '9', '5', '290000.00', '12', '5/tai_nghe_bluetooth_true_wireless_ava_freego_a20.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('18', 'Loa Bluetooth JBL Pulse 5', '12', '6', '6690000.00', '12', '6/loa_bluetooth_jbl_pulse_5.jpeg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('19', 'Loa Bluetooth Sony SRS-XB13', '13', '6', '1290000.00', '12', '6/sony_srs_xb13.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('20', 'Loa Bluetooth AVA+ FreeGo F13', '9', '6', '450000.00', '12', '6/loa_bluetooth_ava_plus_freego_f13.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('21', 'Chuột Không Dây Silent Rapoo B2S', '18', '7', '200000.00', '24', '7/chuot_khong_day_silent_rapoo_b2s.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('22', 'Chuột Không dây DareU LM106G', '17', '7', '150000.00', '24', '', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('23', 'Chuột Có dây Gaming Corsair M55 RGB Pro', '16', '7', '890000.00', '24', '7/chuot_gaming_corsair_m55_rgb_pro.jpeg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('24', 'Chuột Có dây Gaming Genius Scorpion M700', '15', '7', '490000.00', '12', '7/chuot_co_day_gaming_genius_scorpion_m700.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('25', 'Bàn phím Bluetooth Logitech K380', '14', '8', '750000.00', '12', '8/ban_phim_bluetooth_logitechk380.jpg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1'),
('26', 'Bàn Phím Có Dây DareU EK87', '17', '8', '650000.00', '24', '8/ban_phim_co_day_dareu_ek87.jpeg', 'Đây là mô tả sản phẩm', '2024-04-19 11:01:52', '2024-04-19 11:01:52', '1');



INSERT INTO `leave_application` (`staff_id`, `start_date`, `end_date`, `reason`, `status`) VALUES
(1, '2024-05-01', '2024-05-01', 'Lý do cá nhân', 1),
(2, '2024-05-01', '2024-05-01', 'Ốm đau, thai sản', 1),
(3, '2024-05-01', '2024-05-01', 'Ốm đau, thai sản', 1),
(2, '2024-05-02', '2024-05-02', 'Lý do cá nhân', 1),
(1, '2024-05-02', '2024-05-02', 'Ốm đau, thai sản', 1),
(3, '2024-05-02', '2024-05-02', 'Ốm đau, thai sản', 1);


INSERT INTO `contracts` (`contract_id`, `staff_id`, `start_date`, `end_date`, `salary`) VALUES 
('1', '1', '2023-03-01', '2025-03-01', '20000000'), 
('2', '2', '2023-03-01', '2025-03-01', '18000000'),
('3', '3', '2023-03-01', '2025-03-01', '13000000'),
('4', '4', '2023-03-01', '2025-03-01', '15000000');



INSERT INTO `attendance` (`timesheet_id`, `date`, `status`, `leave_application_id`) VALUES
(4, '2024-05-03', 'Có mặt', NULL),
(1, '2024-05-03', 'Có mặt', NULL),
(2, '2024-05-03', 'Trễ', NULL),
(3, '2024-05-03', 'Vắng mặt', NULL),
(1, '2024-05-04', 'Có mặt', NULL),
(2, '2024-05-04', 'Có mặt', NULL),
(3, '2024-05-04', 'Có mặt', NULL),
(4, '2024-05-04', 'Có mặt', NULL),
(1, '2024-05-05', 'Có mặt', NULL),
(2, '2024-05-05', 'Có mặt', NULL),
(3, '2024-05-05', 'Có mặt', NULL),
(4, '2024-05-05', 'Có mặt', NULL),
(1, '2024-05-01', 'Nghỉ phép', '1'),
(2, '2024-05-01', 'Nghỉ phép', '2'),
(3, '2024-05-01', 'Nghỉ phép', '3'),
(4, '2024-05-01', 'Có mặt', NULL),
(1, '2024-05-02', 'Nghỉ phép', '4'),
(2, '2024-05-02', 'Nghỉ phép', '5'),
(3, '2024-05-02', 'Nghỉ phép', '6'),
(4, '2024-05-02', 'Có mặt', NULL);

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
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('4-128G-Y', '128GB - Trắng', '4');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('4-256G-Y', '256GB - Trắng', '4');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('4-128G-P', '128GB - Đen', '4');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('4-256G-P', '256GB - Đen', '4');

INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('5-D','Mặc định', '5');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('6-D','Mặc định', '6');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('7-D','Mặc định', '7');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('8-D','Mặc định', '8');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('9-D','Mặc định', '9');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('10-D','Mặc định', '10');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('11-D','Mặc định', '11');

INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('12-W','Trắng', '12');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('12-B','Đen', '12');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('12-P','Hồng', '12');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('13-W','Trắng', '13');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('13-B','Đen', '13');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('14-B','Đen', '14');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('14-RB','Đỏ đen', '14');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`) VALUES ('14-WP','Trắng hồng', '14');


INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('15-D','Mặc định', '15');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('16-D','Mặc định', '16');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('17-D','Mặc định', '17');

INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('18-D','Mặc định', '18');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('19-D','Mặc định', '19');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('20-D','Mặc định', '20');


INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('21-D','Mặc định', '21');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('22-D','Mặc định', '22');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('23-D','Mặc định', '23');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('24-D','Mặc định', '24');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('25-TKL','TKL - 78 phím', '25');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('25-FZ','Fullsize - 105 phím', '25');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('26-TKL','TKL - 78 phím', '26');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('26-FZ','Fullsize - 105 phím', '26');

INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('27-D','Mặc định', '27');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('28-D','Mặc định', '28');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('29-D','Mặc định', '29');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('30-D','Mặc định', '30');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('31-D','Mặc định', '31');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('32-D','Mặc định', '32');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('33-D','Mặc định', '33');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('34-D','Mặc định', '34');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('35-D','Mặc định', '35');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('36-D','Mặc định', '36');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('37-D','Mặc định', '37');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('38-D','Mặc định', '38');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('39-D','Mặc định', '39');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('40-D','Mặc định', '40');
INSERT INTO `skus` (`sku_code`, `sku_name`, `product_id`)  VALUES ('41-D','Mặc định', '41');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TX', 'Titan xanh', '42');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TD', 'Titan đen', '42');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TN', 'Titan tự nhiên', '42');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('42-TW', 'Titan trắng', '42');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('43-TX', 'Titan xanh', '43');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('43-TD', 'Titan đen', '43');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('43-TN', 'Titan tự nhiên', '43');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('43-TW', 'Titan trắng', '43');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-W', 'Trắng', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-XL', 'Xanh lá', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-D', 'Đen', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-T', 'Tím', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-XD', 'Xanh dương', '44');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('44-R', 'Đỏ', '44');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-V', 'Vàng', '45');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-X', 'Xám', '45');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-D', 'Đen', '45');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('45-T', 'Tím', '45');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('46-W', 'Trắng', '46');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('46-X', 'Xanh mint', '46');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-X', 'Xanh mint', '47');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-T', 'Tím', '47');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-G', 'Xám', '47');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('47-K', 'Kem', '47');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('48-W', 'Trắng', '48');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('48-XL', 'Xanh lá', '48');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('48-D', 'Đen', '48');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('49-X', 'Xanh', '49');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('49-D', 'Đen', '49');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('49-T', 'Tím', '49');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('50-XL', 'Xanh lá', '50');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('50-D', 'Đen', '50');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('50-T', 'Tím', '50');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('51-TX', 'Titan xanh', '51');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('51-TD', 'Titan den', '51');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('52-D', 'Đen', '52');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('52-XD', 'Xanh dương', '52');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('53-TX', 'Titan xanh', '53');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('53-TD', 'Titan den', '53');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('54-D', 'Đen', '54');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('54-XD', 'Xanh dương', '54');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('55-TX', 'Titan xanh', '55');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('55-TD', 'Titan den', '55');

INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('56-D', 'Đen', '56');
INSERT INTO skus (sku_code, sku_name, product_id) VALUES ('56-XD', 'Xanh dương', '56');

insert into `skus` (`sku_name`,`sku_code`,`product_id`) VALUES
('Mặc định','57-D',57),
('Màu xanh','57-A',57),
('Màu đỏ','58-Q',58),
('Màu đen','58-W',58),
('Màu trắng','59-E',59),
('Màu xám','59-R',59),
('Màu trăng','60-T',60),
('Màu đỏ','60-Y',60),
('Màu xanh dương','61-U',61),
('Màu đen đỏ','61-I',61),
('Màu xám trắng','62-O',62),
('Màu trắng','62-P',62),
('Màu đen','63-A',63),
('Màu đỏ','63-S',63),
('Màu hồng','64-D',64),
('Màu trắng','64-F',64),
('Màu đen','65-G',65),
('Màu trắng','65-H',65),
('Màu hồng đậm','66-J',66),
('Màu đen','66-K',66),
('Màu trắng','67-L',67),
('Màu đen','67-Z',67),
('Màu hồng','68-X',68),
('Màu hồng','69-C',68),
('Màu đen','69-V',69),
('Màu đỏ','70-Q',70),
('Màu đen','70-W',70),
('Màu trắng','71-E',71),
('Màu xám','71-R',71),
('Màu trăng','72-T',72),
('Màu đỏ','72-Y',72),
('Màu xanh dương','73-U',73),
('Màu đen đỏ','73-I',73),
('Màu xám trắng','74-O',74),
('Màu trắng','74-P',74),
('Màu đen','75-A',75),
('Màu đỏ','75-S',75),
('Màu hồng','76-D',76),
('Màu trắng','76-F',76),
('Màu đen','77-G',77),
('Màu trắng','77-H',77),
('Màu hồng đậm','78-J',78),
('Màu đen','78-K',78),
('Màu trắng','79-L',79),
('Màu đen','79-Z',79),
('Màu hồng','80-X',80),
('Màu hồng','80-C',80),
('Màu đen','81-V',81),
('Màu trắng','81-B',81),
('Màu đen','82-N',82),
('Màu trắng','83-M',83),
('Màu hồng đậm','84-Q',84),
('Màu đen','84-W',84),
('Màu trắng','85-E',85),
('Màu đen','85-R',85),
('Màu hồng xám','86-T',86),
('Màu hồng','86-Y',86),
('Màu đen','87-U',87),
('Màu hồng','87-I',87),
('Màu hồng','88-O',88),
('Màu đen','88-P',88);

INSERT INTO `banner_locations` (`location_id`, `location_name`) VALUES ('1', 'home-header');

INSERT INTO `banners` (`image_path`, `url`, `banner_name`, `location_id`, `width`, `height`) VALUES ('banners/banner1.png', '../Catalog/Category?context=laptop?context-value=1', 'banner_header1', '1', '800', '600');
INSERT INTO `banners` (`image_path`, `url`, `banner_name`, `location_id`, `width`, `height`) VALUES ('banners/banner2.png', '../Catalog/Category?context=laptop?context-value=2', 'banner_header2', '1', '800', '600');

INSERT INTO `featured_products_rows` (`row_name`, `row_description`,`index`) VALUES ('Sản phẩm nổi bật', 'Các sản phẩm mới và nổi bật trong tháng 4',1);
INSERT INTO `featured_products_rows` (`row_name`, `row_description`,`index`) VALUES ('Sản phẩm mới', 'Sản phẩm mới vừa xuất hiện trên thị trường',2);

INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES 
('35', '1', '1'),
('40', '2', '1'),
('41', '4', '1'),
('42', '3', '1'),
('43', '47', '1'),
('44', '46', '1'),
('45', '50', '1'),
('46', '52', '1'),
('47', '53', '1'),
('48', '6', '2'),
('49', '5', '2'),
('50', '8', '2'),
('51', '7', '2'),
('52', '40', '2'),
('53', '41', '2'),
('54', '32', '2'),
('55', '31', '2');

INSERT INTO `options` (`option_id`, `product_id`, `option_name`, `option_value`, `is_active`) VALUES
('3', '1', 'Kích thước', '159,9 mm x 76,7 mm x 8,25 mm', '1'),
('4', '1', 'Trọng lượng', '221 g', '1'),
('5', '1', 'Màn hình', '2796x1290 Super Retina XDR OLED 6,7 inch', '1'),
('6', '1', 'Chip', 'A17 Pro 6 Core 2P 4E 16x Neural Engine', '1'),
('7', '1', 'Camera', '3 Camera Main 48MP, Ultra Wide 12MP, Telephoto 5x 12MP', '1'),
('8', '2', 'Chip xử lý', 'Samsung 10 Core 6 P-Core 4 E-Core 5.00GHz', '1'),
('9', '2', 'asd', '123', '0'),
('10', '2', 'asd', 'asd', '0'),
('11', '5', 'CPU', 'I5 1135G7 6 Nhân 12 Luồng 3.5Ghz', '1'),
('12', '5', 'RAM', '8GB DDR4 - Còn trống 1 slot DDR4', '1'),
('13', '5', 'Card Màn Hình', 'Intel Graphics Iris X gen 11', '1'),
('14', '5', 'Dung lượng', 'SSD 256GB - Dư 1 slot HDD SATA 3 tối đa 1TB', '1');

insert into `options` (`product_id`,`option_name`,`option_value`) VALUES
(3,'Màn hình','IPS Anti-Glare chóng chói'),
(5,'Công nghệ CPU:','Intel Core i5 Tiger Lake - 1135G7'),
(5,'Số nhân:','4'),
(5,'Số luồng:','8'),
(5,'RAM:','8GB'),
(5,'Màn hình:','14 inch'),
(5,'Độ phân giải:','Full HD (1920 x 1080)'),
(5,'Tần số quét:','60 Hz'),
(5,'Công nghệ màn hình:','Tấm nền IPS Acer ComfyView'),
(5,'Kích thước, khối lượng:','Dài 328 mm - Rộng 223 mm - Dày 17.95 mm - Nặng 1.46 kg'),
(5,'Chất liệu:','Vỏ nhựa - nắp lưng bằng kim loại'),
(5,'Thông tin Pin:','"Li-ion, 48 Wh"'),
(5,'Hệ điều hành:','Windows 11 Home SL'),
(7,'Chip xử lý','Intel Core i7-11800H'),
(7,'Chip xử lý','Intel Core i5-12500H'),
(8,'RAM','16GB'),
(8,'Loại card đồ họa','NVIDIA GeForce RTX 4050 6GB GDDR6, Boost Clock 2370MHz, TGP 100W'),
(8,'Ổ cứng','512GB SSD M.2 2280 PCIe 4.0x4 NVMe (1 khe SSD M.2 trống nâng cấp tối đa đến 1TB)'),
(8,'Màn hình','Tấm nền IPS'),
(8,'Kích thước màn hình','16 inches'),
(8,'Kích thước','359.7 x 260.3 x 19.9 - 21.9 mm (W x D x H)'),
(8,'Trọng lượng','2.4 kg'),
(2,'Kích thước màn hình','6.4 inches'),
(2,'Độ phân giải màn hình','1080 x 2340 pixels (FullHD+)'),
(2,'Kiểu màn hình','Đục lỗ (Nốt ruồi)'),
(2,'Camera sau','"50 MP & Phụ 12 MP, 8 MP"'),
(2,'Camera trước','10 MP'),
(2,'Chipset','Exynos 2200 8 nhân'),
(2,'Loại CPU','"1 nhân 2.8 GHz, 3 nhân 2.5 GHz & 4 nhân 1.8 GHz"'),
(2,'Dung lượng RAM','8 GB'),
(2,'Bộ nhớ trong','128 GB'),
(2,'Pin','4500 mAh'),
(2,'Kích thước','158 x 76.5 x 8.2 mm'),
(2,'Trọng lượng','209 g'),
(3,'Công nghệ màn hình:','AMOLED'),
(3,'Độ phân giải:','Full HD+ (1080 x 2400 Pixels)'),
(3,'Màn hình rộng:','"6.67 - Tần số quét 120 Hz"'),
(3,'Camera sau','"Chính 50 MP & Phụ 8 MP, 2 MP"'),
(3,'Camera trước','13 MP'),
(3,'Hệ điều hành:','Android 13'),
(3,'Chip xử lý (CPU):','Snapdragon 685 8 nhân'),
(3,'RAM:','8 GB'),
(3,'Thẻ nhớ:','"MicroSD, hỗ trợ tối đa 1 TB"'),
(3,'Dung lượng pin:','5000 mAh'),
(4,'Công nghệ màn hình:','IPS LCD'),
(4,'Độ phân giải:','HD+ (720 x 1612 Pixels)'),
(4,'Màn hình rộng:','"6.56 - Tần số quét 60 Hz"'),
(4,'Camera sau','Chính 13 MP & Phụ 2 MP'),
(4,'Camera trước','8 MP'),
(4,'Hệ điều hành:','Android 12'),
(4,'Chip xử lý (CPU):','MediaTek Helio G35 8 nhân'),
(4,'RAM:','4 GB'),
(4,'Dung lượng lưu trữ:','128 GB'),
(4,'Dung lượng pin:','5000 mAh'),
(6,'Công nghệ CPU:','Intel Core i5 Tiger Lake'),
(6,'Loại CPU:','1135G7'),
(6,'Số nhân:','4'),
(6,'Số luồng','8'),
(6,'RAM:','8 GB'),
(6,'Loại RAM:','DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB)'),
(6,'Màn hình:','15.6 inch'),
(6,'Độ phân giải','Full HD (1920 x 1080)'),
(6,'Tần số quét:','60 Hz'),
(6,'Card màn hình:','Card tích hợp - Intel Iris Xe Graphics'),
(6,'Kích thước, khối lượng:','Dài 360.2 mm - Rộng 234 mm - Dày 17.9 mm - Nặng 1.682 kg'),
(6,'Chất liệu:','Nắp lưng và chiếu nghỉ tay bằng kim loại'),
(6,'Thông tin Pin:','3-cell Li-ion, 41 Wh'),
(6,'Hệ điều hành:','Windows 10 Home SL'),
(9,'Dung lượng pin:','10000 mAh'),
(9,'Hiệu suất sạc:','64%'),
(9,'Lõi pin:','Polymer'),
(9,'Công nghệ/Tiện ích:','Đèn LED báo hiệu'),
(9,'Thời gian sạc đầy pin:','5 - 6 giờ (dùng Adapter 2A)'),
(9,'Nguồn ra:','Type-C: 5V - 3AUSB: 5V - 2.4A'),
(9,'Nguồn vào:','Type C: 5V - 3AMicro USB: 5V - 2A'),
(9,'Kích thước:','Dài 9.2 cm - Rộng 6.3 cm - Dày 1.9 cm'),
(9,'Khối lượng:','190 g'),
(10,'Dung lượng pin:','20000 mAh'),
(10,'Hiệu suất sạc:','60%'),
(10,'Lõi pin:','Polymer'),
(10,'Công nghệ/Tiện ích:','Đèn LED báo hiệu'),
(10,'Thời gian sạc đầy pin:','5 - 6 giờ (dùng Adapter 2A)'),
(10,'Nguồn ra:','USB: 5V - 3A, 9V - 2A, 12V - 1.5AType C: 5V - 3A, 9V - 2.22A, 12V - 1.67A (Max 20 W)'),
(10,'Nguồn vào:','Type C: 5V - 3A, 9V - 2.2A, 12V - 1.6A'),
(10,'Kích thước:','Dài 9 cm - Rộng 6.3 cm - Dày 3.2 cm'),
(10,'Khối lượng:','320 g');

INSERT INTO `product_images` (`product_image_id`, `product_id`, `image_url`) VALUES
('11', '1', '1/1/iphone15-2.jpg'),
('12', '1', '1/1/iphone15-4.png'),
('13', '1', '1/1/iphone15-3.jpg'),
('14', '1', '1/1/iphone15-1.jpg'),
('16', '3', '1/3/image_2024-04-26_222411440.png'),
('17', '5', '2/5/image_2024-04-26_222420467.png'),
('18', '5', '2/5/image_2024-04-26_222515881.png');

insert into `product_images` (`product_image_id`,`product_id`,`image_url`) VALUES
('19','2','1/2/samsung-galaxy-s23-den-1-1.jpg'),
('20','3','1/3/redmi-note-13-den-1.jpg'),
('21','3','1/3/xiaomi-redmi-note-13-vang-1-1.jpg'),
('22','4','1/4/oppo-a57-4g-glr-xanh-1.jpg'),
('23','4','1/4/oppo-a57-vang-glr-1.jpg'),
('24','6','2/6/hp-pavilion-15-eg0507tu-i5-46m06pa-2-org.jpg'),
('25','6','2/6/hp-pavilion-15-eg0507tu-i5-46m06pa-1-org.jpg'),
('26','7','2/7/asus-tuf-gaming-f15-fx507vu-i7-lp167w-2.jpg'),
('27','7','2/7/asus-tuf-gaming-f15-fx507vu-i7-lp167w-1.jpg'),
('28','8','2/8/lenovo_legion_5_16irh8_i5.jpg'),
('29','8','2/8/lenovo-gaming-legion-5-15ach6-r7-82jw00kmvn-2-1.jpg'),
('30','9','4/9/pin-sac-du-phong-polymer-10000mah-type-c-15w-ava-jp399-xanh-1-1.jpg'),
('31','9','4/9/pin-sac-du-phong-polymer-10000mah-type-c-15w-ava-jp399-hong-1.jpg'),
('32','10','4/10/pin-sac-du-phong-polymer-20000mah-type-c-pd-qc3-0-20w-xmobile-ds223b-mint-2.jpg'),
('33','10','4/10/pin-sac-du-phong-polymer-20000mah-type-c-pd-qc3-0-20w-xmobile-ds223b-den-1.jpg'),
('34','11','4/11/sac-du-phong-20000mah-typecpd-22-5w-baseus-ppmd20-cap-lightning-va-typec-trang-4-750x500.jpg'),
('35','12','3/12/apple_watch_se_2023_40mm_vien_nhom_day_silicone_xanh_duong.jpg'),
('36','12','3/12/2apple-watch-se-2023-40mm-vien-nhom-day-silicone-xanh-den-2.jpg'),
('37','13','3/13/sam-sung-galaxy-watch-5-pro-lte-1.jpg'),
('38','13','3/13/sam-sung-galaxy-watch-5-pro-lte-2.jpg'),
('39','14','3/14/dong_ho_thong_minh_xiaomi_redmi_watch_4_47_5mm.jpg'),
('40','14','3/14/xiaomi-redmi-watch-4-den-1-1.jpg'),
('41','15','5/15/tai-nghe-bluetooth-airpods-pro-2nd-gen-usb-c-charge-apple-1.jpg'),
('42','15','5/15/tai-nghe-bluetooth-airpods-pro-2nd-gen-usb-c-charge-apple-2.jpg'),
('43','16','5/16/tai_nghe_bluetooth_true_wireless_xiaomi_redmi_buds_5_pro.jpg'),
('44','16','5/16/tai_nghe_bluetooth_true_wireless_ava_freego_a20.jpg'),
('45','17','5/17/tai-nghe-bluetooth-true-wireless-ava-buds-life-air-3-1.jpg'),
('46','17','5/17/tai-nghe-bluetooth-true-wireless-ava-buds-life-air-3-3.jpg'),
('47','18','6/18/loa-bluetooth-jbl-pulse-5-1-1.jpg'),
('48','18','6/18/loa-bluetooth-jbl-pulse-5-4-1.jpg'),
('49','19','6/19/bluetooth-sony-srs-xb13-1-1-org.jpg'),
('50','19','6/19/bluetooth-sony-srs-xb13-2-1-org.jpg'),
('51','20','6/20/1loa-bluetooth-ava-plus-freego-f13-xanh-3.jpg'),
('52','20','6/20/1loa-bluetooth-ava-plus-freego-f13-xanh-4.jpg'),
('53','21','7/21/chuot-khong-day-silent-rapoo-b2s-1.jpg'),
('54','21','7/21/chuot-khong-day-silent-rapoo-b2s-2.jpg'),
('55','22','7/22/chuot-khong-day-dareu-lm106g-1.jpg'),
('56','22','7/22/chuot-khong-day-dareu-lm106g-2.jpg'),
('57','2','1/2/samsung-galaxy-s23-tim-glr-1.jpg');

INSERT INTO `imports` (`import_id`, `staff_id`, `import_date`, `is_active`) VALUES 
('1', '2', '2024-01-01', '1'),
('2', '3', '2024-01-15', '1'),
('3', '3', '2024-02-01', '1'),
('4', '3', '2024-03-01', '1'),
('5', '2', '2024-04-01', '1'),
('6', '2', '2023-10-01', '1'),
('7', '2', '2023-11-01', '1'),
('8', '2', '2023-09-01', '1'),
('9', '2', '2023-08-01', '1'),
('10', '2', '2022-10-01', '1'),
('11', '2', '2022-11-01', '1');

INSERT INTO `shipments` (`shipment_id`, `import_id`, `supplier_id`, `unit_price_import`, `quantity`, `remain`, `sku_id`, `is_active`) VALUES 
('1', '1', '1', '10000000', '50', '50', '1', '1'),
('2', '1', '2', '10000000', '50', '50', '2', '1'),
('3', '1', '3', '10000000', '50', '50', '3', '1'),
('4', '1', '4', '10000000', '50', '50', '4', '1'),
('5', '2', '5', '10000000', '50', '50', '1', '1'),
('6', '2', '6', '10000000', '50', '50', '5', '1'),
('7', '2', '7', '10000000', '50', '50', '6', '1'),
('8', '2', '8', '9000000', '50', '50', '7', '1'),
('9', '3', '8', '10000000', '50', '50', '2', '1'),
('10', '4', '8', '10000000', '50', '50', '3', '1'),
('11', '5', '8', '10000000', '50', '50', '4', '1'),
('12', '6', '8', '9000000', '50', '50', '8', '1'),
('13', '6', '8', '9000000', '50', '50', '13', '1'),
('14', '7', '8', '9000000', '50', '50', '14', '1'),
('16', '8', '8', '100000', '50', '50', '21', '1'),
('17', '9', '8', '100000', '50', '50', '22', '1'),
('18', '10', '8', '100000', '50', '50', '23', '1'),
('19', '11', '8', '100000', '50', '50', '24', '1');

-- INSERT INTO `orders` (`order_id`, `staff_id`, `account_id`, `receiver_name`, `email_of_receiver`, `phone_number_of_receiver`, `note`, `order_date`, `status_of_order`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `is_active`) VALUES 
-- ('1', '4', '5', 'Anh Hiển', 'thehien@gmail.com', '0786705877', 'Tặng anh Hiển', current_timestamp(), 'Pending', '2000000', 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '70L1-13579', 'COD', '1'),
-- ('2', '4', '6', 'Anh Huy', 'huy@gmail.com', '0903379371', 'Tặng anh Lộc ', current_timestamp(), 'Pending', '1500000', 'express', 'Đại học sài gòn', '2024-03-07 19:34:36', '50S1-89710', 'COD', '1'),
-- ('3', '4', '7', 'Anh Lộc', 'loc@gmail.com', '0909832697', 'Tặng anh Huy gà', current_timestamp(), 'Pending', '19999999', 'express', 'Đại học nha trang', '2024-03-07 19:34:36', '49L2-36713', 'COD', '1'),
-- ('4', '4', '5', 'Anh Phong', 'phong@gmail.com', '010284697', 'Tặng anh Phong', current_timestamp(), 'Pending', '6500000', 'express', 'Bệnh viện ', '2024-03-07 19:34:36', '20S2-44489', 'COD', '1'),
-- ('5', '4', '8', 'Anh Hiển Cha', 'thehien@gmail.com', '0203678910', 'Tặng ba anh huy', current_timestamp(), 'Pending', '123000', 'express', 'Trạm xá', '2024-03-07 19:34:36', '30D9-89765', 'COD', '1'),
-- ('6', '4', '23', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89766', 'COD', '1'),
-- ('7', '4', '11', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89767', 'COD', '1'),
-- ('8', '4', '12', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89768', 'COD', '1'),
-- ('9', '4', '13', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89769', 'COD', '1'),
-- ('10', '4', '14', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89770', 'COD', '1'),
-- ('11', '4', '15', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89771', 'COD', '1'),
-- ('12', '4', '16', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89772', 'COD', '1'),
-- ('13', '4', '17', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89773', 'COD', '1'),
-- ('14', '4', '18', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89774', 'COD', '1'),
-- ('15', '4', '19', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89775', 'COD', '1'),
-- ('16', '4', '20', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89776', 'COD', '1'),
-- ('17', '4', '21', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89777', 'COD', '1'),
-- ('18', '4', '22', 'ABC', 'thehien@gmail.com', '0203678910', 'ABC', current_timestamp(), 'Delivered', '123000', 'express', 'ABC', '2024-03-07 19:34:36', '30D9-89778', 'COD', '1');

-- INSERT INTO `order_details` (`order_detail_id`, `order_id`, `sku_id`, `price`, `number_of_products`, `color_of_product`) VALUES 
-- ('1', '1', '1', '299000', '2', 'Đen'),
-- ('2', '1', '2', '299000','3' ,'Trắng'),
-- ('3', '2', '1', '299000', '2', 'Tự nhiên'),
-- ('4', '2', '3', '299000', '5', 'Xanh'),
-- ('5', '2', '4', '299000', '6', 'Đen'),
-- ('6', '3', '1', '299000', '4', 'Trắng'),
-- ('7', '3', '2', '299000', '2', 'Tự nhiên'),
-- ('8', '4', '1', '299000', '2', 'Xanh'),
-- ('9', '4', '2', '299000', '2', 'Đen'),
-- ('10', '4', '3', '299000', '5', 'Trắng'),
-- ('11', '5', '1', '299000', '5', 'Tự nhiên'),
-- ('12', '5', '2', '299000', '5', 'Xanh'),
-- ('13', '6', '1', '30000000', '1', 'ABC'),
-- ('14', '6', '5', '30000000', '1', 'ABC'),
-- ('15', '6', '13', '30000000', '1', 'ABC'),
-- ('16', '6', '17', '30000000', '1', 'ABC'),
-- ('17', '6', '18', '30000000', '1', 'ABC'),
-- ('18', '6', '19', '30000000', '1', 'ABC'),
-- ('19', '7', '1', '30000000', '1', 'ABC'),
-- ('20', '7', '5', '30000000', '1', 'ABC'),
-- ('21', '7', '13', '30000000', '1', 'ABC'),
-- ('22', '7', '17', '30000000', '1', 'ABC'),
-- ('23', '7', '18', '30000000', '1', 'ABC'),
-- ('24', '7', '19', '30000000', '1', 'ABC'),
-- ('25', '8', '1', '30000000', '1', 'ABC'),
-- ('26', '8', '5', '30000000', '1', 'ABC'),
-- ('27', '8', '13', '30000000', '1', 'ABC'),
-- ('28', '8', '17', '30000000', '1', 'ABC'),
-- ('29', '8', '18', '30000000', '1', 'ABC'),
-- ('30', '8', '19', '30000000', '1', 'ABC'),
-- ('31', '9', '1', '30000000', '1', 'ABC'),
-- ('32', '9', '5', '30000000', '1', 'ABC'),
-- ('33', '9', '13', '30000000', '1', 'ABC'),
-- ('34', '9', '17', '30000000', '1', 'ABC'),
-- ('35', '9', '18', '30000000', '1', 'ABC'),
-- ('36', '9', '19', '30000000', '1', 'ABC'),
-- ('37', '10', '1', '30000000', '1', 'ABC'),
-- ('38', '10', '5', '30000000', '1', 'ABC'),
-- ('39', '10', '13', '30000000', '1', 'ABC'),
-- ('40', '10', '17', '30000000', '1', 'ABC'),
-- ('41', '10', '18', '30000000', '1', 'ABC'),
-- ('42', '10', '19', '30000000', '1', 'ABC'),
-- ('43', '11', '1', '30000000', '1', 'ABC'),
-- ('44', '11', '5', '30000000', '1', 'ABC'),
-- ('45', '11', '13', '30000000', '1', 'ABC'),
-- ('46', '11', '17', '30000000', '1', 'ABC'),
-- ('47', '11', '18', '30000000', '1', 'ABC'),
-- ('48', '11', '19', '30000000', '1', 'ABC');

INSERT INTO `orders` (`order_id`, `staff_id`, `account_id`, `receiver_name`, `email_of_receiver`, `phone_number_of_receiver`, `note`, `order_date`, `status_of_order`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `is_active`) VALUES
(1, 2, 5, 'Anh Hiển', 'thehien@gmail.com', '0786705877', 'Tặng ny', '2024-02-03 23:03:52', 'Shipped', 174950000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '70S1-16679', 'COD', 1),
(2, 2, 6, 'Anh Huy', 'huy@gmail.com', '0903379371', 'Hàng dễ vỡ', '2024-01-03 23:03:52', 'Shipped', 314170000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '95H7-55639', 'COD', 1),
(3, 1, 7, 'Anh Lộc', 'loc@gmail.com', '0909832697', 'Tặng ba má', '2024-01-03 23:03:52', 'Shipped', 129540000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '85P6-17980', 'COD', 1),
(4, 1, 8, 'Anh Long', 'huy@gmail.com', '0909832697', 'Tặng phụ huynh', '2024-04-11 23:03:52', 'Shipped', 141455000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '01O7-30354', 'COD', 1),
(5, 2, 6, 'Anh Huy', 'huy@gmail.com', '0909832697', 'Không giao lúc sáng', '2024-04-11 23:03:52', 'Shipped', 4485000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '49C8-45275', 'COD', 1),
(6, 2, 6, 'Anh Phong', 'thehien@gmail.com', '0909832697', 'Không cần gọi điện', '2024-02-12 23:03:52', 'Shipped', 489120000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '23P2-84774', 'COD', 1),
(7, 1, 6, 'Anh Huy', 'huy@gmail.com', '0909832697', 'Tặng anh Hiển', '2024-01-13 23:03:52', 'Shipped', 129540000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '13N8-81383', 'COD', 1),
(8, 1, 6, 'Anh Huy', 'loc@gmail.com', '0909832697', 'Tặng anh Hiển', '2024-01-14 23:03:52', 'Shipped', 214425000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '49R4-58398', 'COD', 1),
(9, 1, 8, 'Anh Long', 'loc@gmail.com', '0909832697', 'Tặng anh Hiển', '2024-03-15 23:03:52', 'Shipped', 419140000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '46I5-13688', 'COD', 1),
(10, 4, 5, 'Anh Hiển', 'thehien@gmail.com', '0786705877', 'Tặng anh Hiển', '2024-05-08 07:57:22', 'Pending', 129540000.00, 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '70L1-13579', 'COD', 1),
(11, 4, 6, 'Anh Huy', 'huy@gmail.com', '0903379371', 'Tặng anh Lộc ', '2024-05-08 07:57:22', 'Pending', 214425000.00, 'express', 'Đại học sài gòn', '2024-03-07 19:34:36', '50S1-89710', 'COD', 1),
(12, 4, 7, 'Anh Lộc', 'loc@gmail.com', '0909832697', 'Tặng anh Huy gà', '2024-05-08 07:57:22', 'Pending', 419140000.00, 'express', 'Đại học nha trang', '2024-03-07 19:34:36', '49L2-36713', 'COD', 1),
(13, 4, 5, 'Anh Phong', 'phong@gmail.com', '010284697', 'Tặng anh Phong', '2024-05-08 07:57:22', 'Pending', 129540000.00, 'express', 'Bệnh viện ', '2024-03-07 19:34:36', '20S2-44489', 'COD', 1),
(14, 4, 8, 'Anh Long', 'thehien@gmail.com', '0203678910', 'Tặng ba ', '2024-05-08 07:57:22', 'Pending', 214425000.00, 'express', 'Trạm xá', '2024-03-07 19:34:36', '30D9-89765', 'COD', 1);

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `sku_id`, `price`, `number_of_products`, `color_of_product`) VALUES 
('1', '1', '1', '34990000', '2', 'Vàng'),
('2', '1', '2', '34990000','3' ,'Vàng'),
('3', '2', '7', '14890000', '2', 'Đen'),
('4', '2', '8', '14890000', '5', 'Đen'),
('5', '2', '4', '34990000', '6', 'Bạc'),
('6', '3', '8', '14890000', '4', 'Đen'),
('7', '3', '3', '34990000', '2', 'Bạc'),
('8', '4', '3', '34990000', '2', 'Bạc'),
('9', '4', '2', '34990000', '2', 'Vàng'),
('10', '4', '21', '299000', '5', 'Xanh'),
('11', '5', '22', '299000', '5', 'Đen'),
('12', '5', '23', '299000', '5', 'Tự nhiên'),
('13', '5', '24', '299000', '5', 'Trắng'),
('14', '6', '1', '34990000', '2', 'Vàng'),
('15', '6','2', '34990000','3' ,'Vàng'),
('16', '6', '7', '14890000', '2', 'Đen'),
('17', '6', '8', '14890000', '5', 'Đen'),
('18', '6', '4', '34990000', '6', 'Bạc'),
('19', '7', '8', '14890000', '4', 'Đen'),
('20', '7', '3', '34990000', '2', 'Bạc'),
('21', '8', '3', '34990000', '2', 'Bạc'),
('22', '8', '2', '34990000', '2', 'Vàng'),
('23', '8', '21', '299000', '5', 'Xanh'),
('24', '8', '22', '299000', '5', 'Đen'),
('25', '8', '23', '299000', '5', 'Tự nhiên'),
('26', '8', '1', '34990000', '2', 'Vàng'),
('27', '9', '2', '34990000','3' ,'Vàng'),
('28', '9', '7', '14890000', '2', 'Đen'),
('29', '9', '8', '14890000', '5', 'Đen'),
('30', '9', '4', '34990000', '6', 'Bạc'),
('31', '10', '8', '14890000', '4', 'Đen'),
('32', '10', '3', '34990000', '2', 'Bạc'),
('33', '11', '3', '34990000', '2', 'Bạc'),
('34', '11', '2', '34990000', '2', 'Vàng'),
('35', '11', '21', '299000', '5', 'Xanh'),
('36', '11', '22', '299000', '5', 'Đen'),
('37', '11', '23', '299000', '5', 'Tự nhiên'),
('38', '11', '1', '34990000', '2', 'Vàng'),
('39', '12', '2', '34990000','3' ,'Vàng'),
('40', '12', '7', '14890000', '2', 'Đen'),
('41', '12', '8', '14890000', '5', 'Đen'),
('42', '12', '4', '34990000', '6', 'Bạc'),
('43', '13', '8', '14890000', '4', 'Đen'),
('44', '13', '3', '34990000', '2', 'Bạc'),
('45', '14', '3', '34990000', '2', 'Bạc'),
('46', '14', '2', '34990000', '2', 'Vàng'),
('47', '14', '21', '299000', '5', 'Xanh'),
('48', '14', '22', '299000', '5', 'Đen'),
('49', '14', '23', '299000', '5', 'Tự nhiên'),
('50', '14', '1', '34990000', '2', 'Vàng');


-- insert into `reviews` (`product_id`,`customer_id`,`rating`,`comment`,`review_date`)
-- (1,1,5,'Sản phẩm rất tốt','2024-05-15 10:34:10'),
-- (1,2,5,'Sản phẩm rất đẹp','2024-05-15 10:34:10'),
-- (1,3,5,'dịch vụ tốt','2024-05-15 10:34:10'),
-- (1,4,5,'rất đẹp','2024-05-15 10:34:10'),
-- (1,5,5,'tốt','2024-05-15 10:34:10'),
-- (1,6,5,'vừa tay','2024-05-15 10:34:10'),
-- (1,7,5,'màu đẹp','2024-05-15 10:34:10'),
-- (1,8,5,'cầm rất sướng','2024-05-15 10:34:10'),
-- (1,20,5,'đúng như hình','2024-05-15 10:34:10'),
-- (2,1,5,'Sản phẩm rất đẹp','2024-05-15 10:34:10'),
-- (2,11,'4.5','Sản phẩm rất tốt','2024-05-15 10:34:10'),
-- (2,12,4,'màu đẹp','2024-05-15 10:34:10'),
-- (2,13,5,'cầm rất sướng','2024-05-15 10:34:10'),
-- (2,14,1,'giao hàng trễ','2024-05-15 10:34:10'),
-- (2,15,3,'giao trễ','2024-05-15 10:34:10'),
-- (2,16,2,'không được đẹp lắm','2024-05-15 10:34:10'),
-- (2,17,1,'rất tệ','2024-05-15 10:34:10'),
-- (2,18,5,'tuyệt vời','2024-05-15 10:34:10'),
-- (2,19,5,'màu rất đẹp','2024-05-15 10:34:10'),
-- (2,20,5,'rất oke','2024-05-15 10:34:10'),
-- (3,1,5,'Sản phẩm rất đẹp','2024-05-15 10:34:10'),
-- (3,2,5,'dịch vụ tốt','2024-05-15 10:34:10'),
-- (3,3,5,'rất đẹp','2024-05-15 10:34:10'),
-- (3,4,5,'tốt','2024-05-15 10:34:11'),
-- (3,5,5,'vừa tay','2024-05-15 10:34:12'),
-- (3,6,5,'màu đẹp','2024-05-15 10:34:13'),
-- (3,7,5,'cầm rất sướng','2024-05-15 10:34:14'),
-- (4,7,5,'đúng như hình','2024-05-15 10:34:15'),
-- (4,8,5,'Sản phẩm rất đẹp','2024-05-15 10:34:16'),
-- (4,20,'4.5','Sản phẩm rất tốt','2024-05-15 10:34:17'),
-- (4,18,4,'màu đẹp','2024-05-15 10:34:18'),
-- (4,11,5,'cầm rất sướng','2024-05-15 10:34:19'),
-- (4,12,1,'giao hàng trễ','2024-05-15 10:34:20'),
-- (4,13,3,'giao trễ','2024-05-15 10:34:21'),
-- (5,17,1,'rất tệ','2024-05-15 10:34:22'),
-- (5,18,5,'tuyệt vời','2024-05-15 10:34:23'),
-- (5,19,5,'màu rất đẹp','2024-05-15 10:34:24'),
-- (5,20,5,'rất oke','2024-05-15 10:34:25'),
-- (5,1,5,'Sản phẩm rất đẹp','2024-05-15 10:34:26'),
-- (5,2,5,'dịch vụ tốt','2024-05-15 10:34:27'),
-- (5,3,5,'rất đẹp','2024-05-15 10:34:28'),
-- (6,4,5,'tốt','2024-05-15 10:34:29'),
-- (6,18,5,'tuyệt vời','2024-05-15 10:34:30'),
-- (6,19,5,'màu rất đẹp','2024-05-15 10:34:31'),
-- (6,20,5,'rất oke','2024-05-15 10:34:32'),
-- (6,1,5,'Sản phẩm rất đẹp','2024-05-15 10:34:33'),
-- (6,2,5,'dịch vụ tốt','2024-05-15 10:34:34'),
-- (7,7,5,'đúng như hình','2024-05-15 10:34:35'),
-- (7,8,5,'Sản phẩm rất đẹp','2024-05-15 10:34:36'),
-- (7,15,'4.5','Sản phẩm rất tốt','2024-05-15 10:34:37'),
-- (7,20,4,'màu đẹp','2024-05-15 10:34:38'),
-- (7,11,5,'cầm rất sướng','2024-05-15 10:34:39'),
-- (7,12,1,'giao hàng trễ','2024-05-15 10:34:40'),
-- (7,13,3,'giao trễ','2024-05-15 10:34:41'),
-- (7,17,1,'rất tệ','2024-05-15 10:34:42'),
-- (8,1,'4.5','Sản phẩm rất tốt','2024-05-15 10:34:43'),
-- (8,2,4,'màu đẹp','2024-05-15 10:34:44'),
-- (8,11,5,'cầm rất sướng','2024-05-15 10:34:45'),
-- (8,12,1,'giao hàng trễ','2024-05-15 10:34:46'),
-- (8,13,3,'giao trễ','2024-05-15 10:34:47'),
-- (8,17,1,'rất tệ','2024-05-15 10:34:48'),
-- (8,18,5,'tuyệt vời','2024-05-15 10:34:49'),
-- (8,19,5,'màu rất đẹp','2024-05-15 10:34:50'),
-- (9,15,3,'giao trễ','2024-05-15 10:34:51'),
-- (9,16,2,'không được đẹp lắm','2024-05-15 10:34:52'),
-- (9,17,1,'rất tệ','2024-05-15 10:34:53'),
-- (9,18,5,'tuyệt vời','2024-05-15 10:34:54'),
-- (9,19,5,'màu rất đẹp','2024-05-15 10:34:55'),
-- (9,20,5,'rất oke','2024-05-15 10:34:56'),
-- (9,1,5,'Sản phẩm rất đẹp','2024-05-15 10:34:57'),
-- (9,2,5,'dịch vụ tốt','2024-05-15 10:34:58'),
-- (9,3,5,'rất đẹp','2024-05-15 10:34:59'),
-- (9,4,5,'tốt','2024-05-15 10:34:60'),
-- (10,5,5,'vừa tay','2024-05-15 10:34:61'),
-- (10,6,5,'màu đẹp','2024-05-15 10:34:62'),
-- (10,7,5,'cầm rất sướng','2024-05-15 10:34:63'),
-- (10,7,5,'đúng như hình','2024-05-15 10:34:64'),
-- (10,8,5,'Sản phẩm rất đẹp','2024-05-15 10:34:65');

DELIMITER //
CREATE TRIGGER insert_attendance_after_leave_insert_check
AFTER INSERT ON leave_application
FOR EACH ROW
BEGIN
    DECLARE cur_date DATE;
    DECLARE end_date DATE;
    SET cur_date = NEW.start_date;
    SET end_date = NEW.end_date;

    -- Chèn các bản ghi attendance mới cho mỗi ngày từ start_date đến end_date
    -- WHILE cur_date <= end_date DO
    --     IF NEW.status = 1 AND NEW.reason <> 'Nghỉ việc' THEN
    --         INSERT INTO attendance (timesheet_id, date, status, leave_application_id)
    --         SELECT timesheet_id, cur_date, 'Nghỉ phép', NEW.leave_application_id
    --         FROM timesheets
    --         INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
    --         WHERE contracts.staff_id = NEW.staff_id
    --         AND NOT EXISTS (
    --             SELECT 1 FROM attendance 
    --             WHERE date = cur_date AND timesheet_id = timesheets.timesheet_id
    --         );
    --     ELSEIF NEW.status = 0 THEN
    --         INSERT INTO attendance (timesheet_id, date, status)
    --         SELECT timesheet_id, cur_date, 'Chưa điểm danh'
    --         FROM timesheets
    --         INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
    --         WHERE contracts.staff_id = NEW.staff_id
    --         AND NOT EXISTS (
    --             SELECT 1 FROM attendance 
    --             WHERE date = cur_date AND timesheet_id = timesheets.timesheet_id
    --         );
    --     END IF;

    --     SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
    -- END WHILE;
    WHILE cur_date <= end_date DO
    IF NEW.status = 1 AND NEW.reason <> 'Nghỉ việc' THEN
        INSERT INTO attendance (timesheet_id, date, status, leave_application_id)
        SELECT timesheet_id, cur_date, 'Nghỉ phép', NEW.leave_application_id
        FROM timesheets
        INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
        WHERE contracts.staff_id = NEW.staff_id
        AND MONTH(cur_date) = timesheets.month
        AND YEAR(cur_date) = timesheets.year
        AND NOT EXISTS (
            SELECT 1 FROM attendance 
            WHERE date = cur_date AND timesheet_id = timesheets.timesheet_id
        );
    ELSEIF NEW.status = 0 THEN
        INSERT INTO attendance (timesheet_id, date, status)
        SELECT timesheet_id, cur_date, 'Chưa điểm danh'
        FROM timesheets
        INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
        WHERE contracts.staff_id = NEW.staff_id
        AND MONTH(cur_date) = timesheets.month
        AND YEAR(cur_date) = timesheets.year
        AND NOT EXISTS (
            SELECT 1 FROM attendance 
            WHERE date = cur_date AND timesheet_id = timesheets.timesheet_id
        );
    END IF;

    SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
END WHILE;

END;
//
DELIMITER ;



DELIMITER //
CREATE TRIGGER update_attendance_after_leave_update
AFTER UPDATE ON leave_application
FOR EACH ROW
BEGIN
    DECLARE cur_date DATE;
    DECLARE end_date DATE;

    IF NEW.status = 1 THEN
        SET cur_date = NEW.start_date;
        SET end_date = NEW.end_date;

        -- Cập nhật các bản ghi attendance cho mỗi ngày từ start_date đến end_date
        WHILE cur_date <= end_date AND NEW.reason <> 'Nghỉ việc' DO
            UPDATE attendance
            SET status = 'Nghỉ phép', leave_application_id = NEW.leave_application_id
            WHERE date = cur_date
            AND timesheet_id IN (
                SELECT timesheet_id FROM timesheets
                INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
                WHERE contracts.staff_id = NEW.staff_id
            );

            SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
        END WHILE;
    END IF;
END;
//
DELIMITER ;




--
DELIMITER //
CREATE TRIGGER insert_attendance_after_leave_insert
AFTER INSERT ON leave_application
FOR EACH ROW
BEGIN
    DECLARE cur_date DATE;
    DECLARE end_date DATE;

    IF NEW.status = 1 THEN
        SET cur_date = NEW.start_date;
        SET end_date = NEW.end_date;

        -- Chèn các bản ghi attendance mới cho mỗi ngày từ start_date đến end_date
        WHILE cur_date <= end_date DO
            IF NEW.reason = 'Lý do cá nhân' THEN
                UPDATE timesheets
                SET days_off = IF(days_leave = 1, days_off + 1, days_off),
                    days_leave = IF(days_leave = 0, days_leave + 1, days_leave)
                WHERE contract_id IN (
                    SELECT contract_id FROM contracts
                    WHERE staff_id = NEW.staff_id
                );
            ELSEIF NEW.reason = 'Ốm đau, thai sản' THEN
                UPDATE timesheets
                SET days_worked = days_worked + 1
                WHERE contract_id IN (
                    SELECT contract_id FROM contracts
                    WHERE staff_id = NEW.staff_id
                );
            ELSEIF NEW.reason = 'Nghỉ việc' THEN
                UPDATE accounts
                SET is_active = 0
                WHERE account_id IN (
                    SELECT account_id FROM staffs
                    WHERE staff_id = NEW.staff_id
                );
            END IF;

            SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
        END WHILE;
    END IF;
END;
//
DELIMITER ;

-- duyệt đơn thì cập nhật ngày nghỉ, nếu duyệt đơn xin nghỉ việc thì khóa tài khoản, ngừng điểm danh, chấm công, tính lương
DELIMITER //
CREATE TRIGGER update_timesheets_and_accounts_after_leave_update
AFTER UPDATE ON leave_application
FOR EACH ROW
BEGIN
    DECLARE cur_date DATE;
    DECLARE end_date DATE;

    IF NEW.status = 1 AND OLD.status = 0 THEN
        SET cur_date = NEW.start_date;
        SET end_date = NEW.end_date;

        -- Cập nhật các bản ghi timesheets và accounts tương ứng khi một leave_application được cập nhật từ status = 0 sang status = 1
        WHILE cur_date <= end_date DO
            IF NEW.reason = 'Lý do cá nhân' THEN
                UPDATE timesheets
                SET days_off = IF(days_leave = 1, days_off + 1, days_off),
                    days_leave = IF(days_leave = 0, days_leave + 1, days_leave)
                    
                WHERE contract_id IN (
                    SELECT contract_id FROM contracts
                    WHERE staff_id = NEW.staff_id
                );
            ELSEIF NEW.reason = 'Ốm đau, thai sản' THEN
                UPDATE timesheets
                SET days_worked = days_worked + 1
                WHERE contract_id IN (
                    SELECT contract_id FROM contracts
                    WHERE staff_id = NEW.staff_id
                );
            ELSEIF NEW.reason = 'Nghỉ việc' THEN
                UPDATE accounts
                SET is_active = 0
                WHERE account_id IN (
                    SELECT account_id FROM staffs
                    WHERE staff_id = NEW.staff_id
                );
            END IF;

            SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
        END WHILE;
    END IF;
END;
//
DELIMITER ;

-- đi trễ
-- DELIMITER //
-- CREATE TRIGGER update_days_late_after_attendance_update
-- AFTER UPDATE ON attendance
-- FOR EACH ROW
-- BEGIN
--     IF NEW.status = 'Trễ' THEN
--         UPDATE timesheets
--         SET days_late = days_late + 1
--         WHERE timesheet_id = NEW.timesheet_id;
--     END IF;
-- END;
-- //
-- DELIMITER ;

-- Sau khi cập nhật bảng điểm danh thì cập nhật số ngày làm, nghỉ, trễ trong bảng chấm công
DELIMITER //
CREATE TRIGGER update_timesheets_after_attendance_update
AFTER UPDATE ON attendance
FOR EACH ROW
BEGIN
    IF NEW.status = 'Có mặt' THEN
        UPDATE timesheets
        SET days_worked = days_worked + 1
        WHERE timesheet_id = NEW.timesheet_id;
    ELSEIF NEW.status = 'Vắng mặt' THEN
        UPDATE timesheets
        SET days_off = days_off + 1
        WHERE timesheet_id = NEW.timesheet_id;
    ELSEIF NEW.status = 'Trễ' THEN
        UPDATE timesheets
        SET days_late = days_late + 1
        WHERE timesheet_id = NEW.timesheet_id;
    END IF;
END;
//
DELIMITER ;

-- Thêm hợp đồng thì tự động thêm trường chấm công vào bảng với tháng, năm tương ứng và chỉ nằm trong khoảng thời gian trong hợp đồng
DELIMITER //
CREATE TRIGGER add_timesheet
AFTER INSERT ON contracts
FOR EACH ROW
BEGIN
  DECLARE current_month INT;
  DECLARE current_year INT;
  SET current_month = MONTH(CURDATE());
  SET current_year = YEAR(CURDATE());

  IF NOT EXISTS (SELECT 1 FROM timesheets WHERE contract_id = NEW.contract_id AND month = current_month AND year = current_year) 
  AND (CURDATE() BETWEEN NEW.start_date AND NEW.end_date) THEN
    INSERT INTO timesheets (`timesheet_id`, `contract_id`, `month`, `year`, `days_worked`, `days_off`, `days_leave`, `days_late`) 
    VALUES (UUID(), NEW.contract_id, current_month, current_year, 0, 0, 0, 0);
  END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_total_salary_timesheets_insert
AFTER INSERT ON timesheets
FOR EACH ROW
BEGIN
    DECLARE total_days_worked INT;
    DECLARE total_days_late INT;
    DECLARE total_days_off INT;
    DECLARE total_days_leave INT;
    DECLARE total_day INT;
    DECLARE total_salary DECIMAL(10, 2);
    SET total_days_worked = NEW.days_worked;
    SET total_days_late = NEW.days_late;
    SET total_days_leave = NEW.days_leave;
    SET total_days_off = NEW.days_off;
    SET total_day = total_days_worked+total_days_late+total_days_leave+total_days_off;
    IF total_days_leave <= 1 THEN
        SET total_days_worked = total_days_worked+total_days_leave;
    END IF;
    IF total_day < 26 THEN
        SET total_day = 26;
    END IF;
    SET total_salary = (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / total_day * (total_days_worked+total_days_late)
                      - (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / total_day * total_days_late * 0.3;
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
    DECLARE total_days_off INT;
    DECLARE total_days_leave INT;
    DECLARE total_salary DECIMAL(10, 2);
    DECLARE total_day INT;
    SET total_days_worked = NEW.days_worked;
    SET total_days_late = NEW.days_late;
    SET total_days_leave = NEW.days_leave;
    SET total_days_off = NEW.days_off;
    SET total_day = total_days_worked+total_days_late+total_days_leave+total_days_off;
    IF total_days_leave <= 1 THEN
        SET total_days_worked = total_days_worked+total_days_leave;
    END IF;
    IF total_day < 26 THEN
        SET total_day = 26;
    END IF;
    SET total_salary = (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / total_day * (total_days_worked+total_days_late)
                      - (SELECT salary FROM contracts WHERE contract_id = NEW.contract_id) / total_day * total_days_late * 0.3;
    UPDATE timesheet_details SET timesheet_details.total_salary = total_salary WHERE timesheet_details.timesheet_id = NEW.timesheet_id;
END;
//
DELIMITER ;

-- DELIMITER $$
-- CREATE TRIGGER `before_export_detail_insert1` BEFORE INSERT ON `export_details` FOR EACH ROW BEGIN
--     -- Get the unit price import of the corresponding shipment
--     DECLARE shipment_unit_price_import DECIMAL(20, 2);
--     SELECT unit_price_import INTO shipment_unit_price_import
--     FROM shipments
--     WHERE shipment_id = NEW.shipment_id;

--     -- Calculate the unit price export (50% higher than unit price import)
--     SET NEW.unit_price_export = shipment_unit_price_import * 1.5;
-- END
-- $$
-- DELIMITER ;
-- DELIMITER $$
-- CREATE TRIGGER `orders_status_change_trigger` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
--     DECLARE notification_text VARCHAR(500);
    
--     -- Construct notification text based on the new status_of_order
--     CASE NEW.status_of_order
--         WHEN 'Pending' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã được tạo');
--         WHEN 'Processing' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đang xử lý');
--         WHEN 'Shipped' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đã giao');
--         WHEN 'Delivered' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đã nhận');
--         WHEN 'Cancelled' THEN SET notification_text = CONCAT('Hóa đơn ', NEW.tracking_number, ' của bạn đã thay đổi trạng thái sang: Đã hủy');
--     END CASE;
    
--     -- Insert the new notification into the noti table
--     INSERT INTO noti (account_id, text, date_noti) VALUES (NEW.account_id, notification_text, NOW());
-- END
-- $$
-- DELIMITER ;


INSERT INTO `timesheets` (`contract_id`, `month`, `year`, `days_worked`, `days_off`, `days_leave`, `days_late`) VALUES 
('1', '5', '2024', '4', '0', '1', '0'),
('2', '5', '2024', '3', '0', '1', '1'),
('3', '5', '2024', '4', '1', '0', '0'),
('4', '5', '2024', '5', '0', '0', '0'),
('1', '4', '2024', '26', '0', '1', '0'),
('2', '4', '2024', '26', '0', '0', '1'),
('3', '4', '2024', '25', '1', '0', '0'),
('4', '4', '2024', '20', '0', '0', '6'),
('1', '3', '2024', '23', '2', '1', '0'),
('2', '3', '2024', '26', '0', '1', '1'),
('3', '3', '2024', '21', '1', '0', '4'),
('4', '3', '2024', '23', '0', '1', '2'),
('1', '2', '2024', '23', '2', '1', '0'),
('2', '2', '2024', '22', '0', '1', '5'),
('3', '2', '2024', '23', '1', '0', '0'),
('4', '2', '2024', '21', '0', '1', '4'),
('1', '1', '2024', '23', '2', '1', '0'),
('2', '1', '2024', '26', '0', '1', '1'),
('3', '1', '2024', '23', '1', '0', '0'),
('4', '1', '2024', '23', '0', '1', '2'),
('1', '11', '2023', '23', '2', '1', '0'),
('2', '11', '2023', '26', '0', '1', '1'),
('3', '11', '2023', '23', '1', '0', '0'),
('4', '11', '2023', '23', '0', '1', '2'),
('1', '12', '2023', '23', '2', '1', '0'),
('2', '12', '2023', '15', '10', '1', '1'),
('3', '12', '2023', '23', '1', '0', '0'),
('4', '12', '2023', '20', '0', '1', '6'),
('1', '10', '2023', '23', '2', '1', '0'),
('2', '10', '2023', '10', '12', '1', '1'),
('3', '10', '2023', '23', '1', '0', '0'),
('4', '10', '2023', '10', '13', '1', '2'),
('1', '9', '2023', '23', '2', '1', '0'),
('2', '9', '2023', '15', '12', '1', '1'),
('3', '9', '2023', '20', '5', '0', '0'),
('4', '9', '2023', '15', '10', '1', '2');

INSERT INTO `exports` (`export_id`, `staff_id`, `order_id`, `export_date`, `total_price`, `is_active`) VALUES
(1, 2, 1, '2024-02-03 07:58:11', 174950000.00, 1),
(2, 2, 2, '2024-03-02 07:58:19', 314170000.00, 1),
(3, 1, 3, '2024-02-21 07:58:27', 129540000.00, 1),
(4, 1, 4, '2024-04-09 07:58:37', 141455000.00, 1),
(5, 2, 5, '2024-04-17 07:58:50', 4485000.00, 1),
(6, 2, 6, '2024-04-08 07:59:00', 489120000.00, 1),
(7, 1, 7, '2024-04-09 07:59:15', 129540000.00, 1),
(8, 1, 8, '2024-03-12 07:59:29', 214425000.00, 1),
(9, 1, 9, '2024-04-30 07:59:40', 419140000.00, 1);

INSERT INTO `export_details` (`export_detail_id`, `export_id`, `shipment_id`, `unit_price_export`, `quantity_export`) VALUES
(1, 1, 1, 34990000.00, 2),
(2, 1, 2, 34990000.00, 3),
(4, 2, 8, 14890000.00, 2),
(5, 2, 12, 14890000.00, 5),
(6, 2, 4, 34990000.00, 6),
(7, 3, 12, 14890000.00, 4),
(8, 3, 3, 34990000.00, 2),
(10, 4, 3, 34990000.00, 2),
(11, 4, 2, 34990000.00, 2),
(12, 4, 16, 299000.00, 5),
(13, 5, 17, 299000.00, 5),
(14, 5, 18, 299000.00, 5),
(15, 5, 19, 299000.00, 5),
(16, 6, 1, 34990000.00, 2),
(17, 6, 2, 34990000.00, 3),
(18, 6, 8, 14890000.00, 2),
(19, 6, 12, 14890000.00, 5),
(20, 6, 4, 34990000.00, 6),
(23, 7, 12, 14890000.00, 4),
(24, 7, 3, 34990000.00, 2),
(26, 8, 3, 34990000.00, 2),
(27, 8, 2, 34990000.00, 2),
(28, 8, 16, 299000.00, 5),
(29, 8, 17, 299000.00, 5),
(30, 8, 18, 299000.00, 5),
(31, 8, 1, 34990000.00, 2),
(33, 9, 2, 34990000.00, 3),
(34, 9, 8, 14890000.00, 2),
(35, 9, 12, 14890000.00, 5),
(36, 9, 4, 34990000.00, 6);

DELIMITER $$
CREATE TRIGGER `create_export_details_trigger` AFTER INSERT ON `exports` FOR EACH ROW BEGIN
    DECLARE export_id INT;
    SET export_id = NEW.export_id;

    INSERT INTO export_details (export_id, shipment_id, unit_price_export, quantity_export)
    SELECT export_id, shipment_id, price, number
    FROM Removes
    JOIN order_details ON Removes.order_detail_id = order_details.order_detail_id
    WHERE order_details.order_id = NEW.order_id;
END
$$
DELIMITER ;