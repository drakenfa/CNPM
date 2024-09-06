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

CREATE TABLE `customers` (
  `customer_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `customer_fullname` varchar(100) NOT NULL DEFAULT '',
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
  `total_price` decimal(10,2) DEFAULT 0 COMMENT 'Không tự sinh đc như mysql',
  `is_active` tinyint(1) DEFAULT 1
);

CREATE TABLE `export_details` (
  `export_detail_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `export_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `unit_price_export` decimal(10,2) DEFAULT 0,
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
  `staff_id` int(11)  NULL,
  `account_id` int(11) NOT NULL,
  `receiver_name` varchar(100) DEFAULT '' COMMENT 'Có thể giấu tên',
  `email_of_receiver` varchar(100) NOT NULL,
  `phone_number_of_receiver` varchar(20) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT (now()),
  `status_of_order` ENUM ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
  `total_money` decimal(10,2) DEFAULT 0,
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
  `price` decimal(10,2) DEFAULT 0,
  `number_of_products` int(11) DEFAULT 1 COMMENT 'Phải > 0',
  `color_of_product` varchar(20) DEFAULT ''
);

CREATE TABLE `products` (
  `product_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_name` varchar(350) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT 0 COMMENT 'Phải >= 0',
  `guarantee` int(11) DEFAULT 0,
  `thumbnail` varchar(300) DEFAULT '' COMMENT 'Phải có ảnh mặc định',
  `description` longtext DEFAULT 'Đây là mô tả sản phẩm',
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `average_rating` float,
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
  `unit_price_import` decimal(10,2) DEFAULT 0 COMMENT 'Phải > 0',
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

CREATE TABLE `contracts` (
  `contract_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `salary` decimal(10,2) NOT NULL
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
  `total_salary` decimal(10,2) NOT NULL
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
