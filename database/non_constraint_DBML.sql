Enum "orders_status_of_order_enum" {
  "Pending"
  "Processing"
  "Shipped"
  "Delivered"
  "Cancelled"
}
Enum "attendence_status" {
  "Present"
  "Absent"
  "Leave"
  "Late"
}

Table "noti" {
  "noti_id" int(11) [not null]
  "account_id" int(11) [not null]
  "status" tinyint(1) [default: 0]
}

Table "accounts" {
  "account_id" int(11) [pk, not null, increment]
  "phone_number" varchar(20) [unique, not null]
  "email" varchar(200) [unique, not null]
  "password" varchar(300) [not null]
  "avatar" varchar(300)
  "created_at" datetime [default: `now()`]
  "updated_at" datetime [default: `now()`]
  "is_active" tinyint(1) [default: 1]
}

Table "brands" {
  "brand_id" int(11) [pk, not null, increment]
  "brand_name" varchar(100) [unique, default: "", note: "Ex: SANYO, TOSHIBA,..."]
  "brand_logo" varchar(300) [default: ""]
  "supplier_id" int(11) [not null]
  "is_active" tinyint(1) [default: 1]
}

Table "categories" {
  "category_id" int(11) [pk, not null, increment]
  "category_name" varchar(100) [default: "", note: "Ex: Tủ lạnh, máy giặt,..."]
  "category_logo" varchar(300) [default: ""]
  "is_active" tinyint(1) [default: 1]
}

Table "customers" {
  "customer_id" int(11) [pk, not null, increment]
  "customer_fullname" varchar(100) [not null, default: ""]
  "role_id" int(11) [not null, default: 5]
  "account_id" int(11) [not null]
  "gender" tinyint(1) [default: 0, note: "Male: 0, Female: 1"]
  "address" varchar(200) [default: "", note: "Địa chỉ của khách hàng"]
  "date_of_birth" date
  "is_active" tinyint(1) [default: 1]
}

Table "decentralizations" {
  "decentralization_id" int(11) [pk, not null, increment]
  "role_id" int(11) [not null]
  "module_id" int(11) [not null]
  "is_active" tinyint(1) [default: 1]
  Indexes {
    (role_id, module_id) [unique]
  }
}

Table "exports" {
  "export_id" int(11) [pk, not null, increment]
  "staff_id" int(11) [not null]
  "order_id" int(11) [not null]
  "export_date" datetime [default: `now()`]
  "total_price" decimal(10,2) [default: 0, note: "Không tự sinh đc như mysql"]
  "is_active" tinyint(1) [default: 1]
}

Table "export_details" {
  "export_detail_id" int(11) [pk, not null, increment]
  "export_id" int(11) [not null]
  "shipment_id" int(11) [not null]
  "unit_price_export" decimal(10,2) [default: 0]
  "quantity_export" int(50) [default: 0]
}

Table "imports" {
  "import_id" int(11) [pk, not null, increment]
  "staff_id" int(11) [not null]
  "import_date" datetime [default: `now()`]
  "is_active" tinyint(1) [default: 1]
}

Table "modules" {
  "module_id" int(11) [pk, not null, increment]
  "module_name" varchar(200) [default: ""]
  "is_active" tinyint(1) [default: 1]
}

Table "orders" {
  "order_id" int(11) [pk, not null, increment]
  "staff_id" int(11) [not null]
  "account_id" int(11) [not null]
  "receiver_name" varchar(100) [default: "", note: "Có thể giấu tên"]
  "email_of_receiver" varchar(100) [not null]
  "phone_number_of_receiver" varchar(20) [not null]
  "note" varchar(100) [default: ""]
  "order_date" datetime [default: `now()`]
  "status_of_order" orders_status_of_order_enum [default: "Pending"]
  "total_money" decimal(10,2) [default: 0]
  "shipping_method" varchar(100) [default: ""]
  "shipping_address" varchar(200) [not null]
  "shipping_date" datetime
  "tracking_number" varchar(100) [default: ""]
  "payment_method" varchar(100) [default: ""]
  "is_active" tinyint(1) [default: 1]
}

Table "order_details" {
  "order_detail_id" int(11) [pk, not null, increment]
  "order_id" int(11) [not null]
  "sku_id" int(11) [not null]
  "price" decimal(10,2) [default: 0]
  "number_of_products" int(11) [default: 1, note: "Phải > 0"]
  "color_of_product" varchar(20) [default: ""]
}

Table "products" {
  "product_id" int(11) [pk, not null, increment]
  "product_name" varchar(350) [not null]
  "brand_id" int(11) [not null]
  "category_id" int(11) [not null]
  "price" decimal(10,2) [default: 0, note: "Phải >= 0"]
  "guarantee" int(11) [default: 0]
  "thumbnail" varchar(300) [default: "", note: "Phải có ảnh mặc định"]
  "description" longtext [default: "Đây là mô tả sản phẩm"]
  "created_at" datetime [default: `now()`]
  "updated_at" datetime [default: `now()`]
  "average_rating" float
  "is_active" tinyint(1) [default: 1]
}

Table "product_details" {
  "serial_number" int(11) [pk, not null]
  "shipment_id" int(11) [not null]
  "sku_id" int(11) [not null]
  "sold" tinyint(1) [default: 0]
}

Table "guarantees" {
  "guarantee_id" int(11) [pk, not null, increment]
  "serial_number" int(11) [not null]
  "order_id" int(11) [not null]
  "start_date" date [default: `now()`]
  "end_date" date
}


Table "options" {
  "option_id" int(11) [pk, not null, increment]
  "product_id" int(11) [not null]
  "option_name" varchar(128) [not null]
  "option_value" longtext [not null]
  "is_active" tinyint(1) [default: 1]
}

Table "likes" {
  "like_id" int(11) [pk, not null, increment]
  "product_id" int(11) [not null]
  "customer_id" int(11) [not null]
  Indexes {
    (product_id, customer_id) [unique]
  }
}

Table "reviews" {
  "review_id" int(11) [pk, not null, increment]
  "product_id" int(11) [not null]
  "customer_id" int(11) [not null]
  "rating" float 
  "comment" longtext
  "review_date" datetime [default: `now()`]
  "is_active" tinyint(1) [default: 1]
}

Table "product_images" {
  "product_image_id" int(11) [pk, not null, increment]
  "product_id" int(11) [not null]
  "image_url" varchar(300) [default: "", note: "Phải có ít nhất 1 ảnh mặc định"]
}

// Table "reasons" {
//   "reason_id" int(11) [unique, pk, not null, increment]
//   "reason_name" varchar(200) [default: "", note: "Nhập, Bán, Trả, Khách trả"]
//   "is_active" tinyint(1) [default: 1]
// }

Table "roles" {
  "role_id" int(11) [pk, not null, increment]
  "role_name" varchar(20) [not null]
  "is_active" tinyint(1) [default: 1]
}

Table "shipments" {
  "shipment_id" int(11) [pk, not null, increment]
  "import_id" int(11) [not null]
  "product_id" int(11) [not null]
  "unit_price_import" decimal(10,2) [default: 0, note: "Phải > 0"]
  "quantity" int(50) [default: 0, note: "Phải > giá trị tối thiểu của 1 lô hàng"]
  "remain" int(50) [default: 0, note: "Phải bé 1 số lượng cụ thể thì mới nhập thêm lô"]
  "sku_id" int(11) [not null]
  "mfg" date 
  "exp" date
  "is_active" tinyint(1) [default: 1]
}

Table "skus" {
  "sku_id" int(11) [pk, not null, increment]
  "sku_name" varchar(100)
  "sku_code" varchar(100) [unique, default: "", note: "Phải đủ số lượng ký tự của 1 sku code, nếu có enum về color thì sẽ dễ quản lý hơn"]
  "product_id" int(11) [not null]
  "is_active" tinyint(1) [default: 1]
}

Table "staffs" {
  "staff_id" int(11) [pk, not null, increment]
  "account_id" int(11) [not null]
  "staff_fullname" varchar(100) [not null]
  "role_id" int(11) [not null]
  "gender" tinyint(1) [default: 0, note: "Male: 0, Female: 1"]
  "address" varchar(200)
  "entry_date" date [default: `now()`]
  "is_active" tinyint(1) [default: 1]
}

// -- Table "import_returns" {
// --   "import_return_id" int(11) [pk, not null, increment]
// --   "staff_id" int(11) [not null]
// --   "customer_supplier_id" varchar(20) [not null]
// --   "reason" varchar(100) [not null, note: "Nhập từ khách hàng, Trả về nhà cung cấp"]
// --   "is_active" tinyint(1) [default: 1]
// -- }

// -- Table "import_return_details" {
// --   "import_return_detail_id" int(11) [pk, not null, increment]
// --   "import_return_id" int(11) [not null]
// --   "product_id" int(11) [not null]
// --   "quantity" int(11) [default: 1, not null]
// -- }

Table "statistics" {
  "statistic_id" int(11) [pk, not null, increment]
  "statistic_name" varchar(200) [not null, note: "Dùng các function, trigger, procedure, view,... Để tạo ra các dữ liệu muốn thống kê"]
  "value" longtext [not null]
  "is_active" tinyint(1) [default: 1]
}

Table "suppliers" {
  "supplier_id" int(11) [pk, not null, increment]
  "supplier_name" varchar(200) [not null]
  "phone_number_of_supplier" varchar(20) [unique, not null]
  "address_of_supplier" varchar(200) [not null]
  "email_of_supplier" varchar(100) [unique, not null]
  "is_active" tinyint(1) [default: 1]
}

// Table "salaries" {
//   "salary_id" int(11) [pk, not null, increment]
//   // "work_time" float [default: 0]
//   "base_salary" decimal(10,2) [default: 0]
//   // "allowance" decimal(10,2) [default: 0]
//   // "start_date" date
//   // "end_date" date
//   "is_active" tinyint(1) [default: 1]
// }

// Table "salary_details" {
//   "salary_detail_id" int(11) [pk, not null, increment]
//   "salary_id" int(11) [not null]
//   "staff_id" int(11) [not null]
//   "total_wage" decimal(10,2) [default: 0]
//   "multiplier_salary" float [not null, note: "Dựa vào role của staff sẽ gắn hệ số lương riêng"]
//   "number_of_days_off" int(11) [default: 0]
//   "payment_date" date [default: `now()`]
//   // "is_active" tinyint(1) [default: 1]
// }

Table "contracts" {
  "contract_id" int(11) [pk, not null, increment]
  "staff_id" int(11) [not null]
  "start_date" date [not null]
  "end_date" date [not null]
  "salary" decimal(10,2) [not null]
}

Table "timesheets" {
  "timesheet_id" int(11) [pk, not null, increment]
  "contract_id" int(11) [not null]
  "month" int(2) [not null]
  "year" int(2) [not null]
  "days_worked" int(2) [not null]
  "days_off" int(2) [not null]
  "days_leave" int(2) [not null]
  "days_late" int(2) [not null]
}

Table "timesheet_details" {
  "timesheet_detail_id" int(11) [pk, not null, increment]
  "timesheet_id" int(11) [not null]
  "total_salary" decimal(10,2) [not null]
}
Table "leave_application"{
  "leave_application_id" int(11) [pk, not null, increment]
  "staff_id" int(11) [not null]
  "start_date" date [not null]
  "end_date" date [not null]
  "reason" varchar(100) [not null]
  "status" tinyint(1) [default: 0]
}
Table "attendance" {
  "attendance_id" int(11) [pk, not null, increment]
  "timesheet_id" int(11) [not null]
  "date" date [not null]
  "status" attendence_status [default: "Absent", not null]
  "leave_application_id" int(11) [not null]
}