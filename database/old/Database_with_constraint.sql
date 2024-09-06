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
  `mfg` date,
  `exp` date,
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
