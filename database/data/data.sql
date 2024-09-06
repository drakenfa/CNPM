
INSERT INTO `accounts` (`account_id`, `phone_number`, `email`, `password`, `avatar`, `created_at`, `updated_at`, `is_active`) VALUES
(1, '0988722521', 'hien@gmail.com', 'Thien123', 'avatar_0988722521.jpg',current_timestamp(), current_timestamp(), 1),
(2, '0988722522', 'huy@gmail.com', 'qhuy123', 'avatar_0988722522.jpg', current_timestamp(), current_timestamp(), 1),
(3, '0988722523', 'loc@gmail.com', 'mloc123', 'avatar_0988722523.jpg', current_timestamp(), current_timestamp(), 1),
(4, '0988722524', 'phong@gmail.com', 'hphong123', 'avatar_0988722524.jpg',current_timestamp(), current_timestamp(), 1),
(5, '0988722525', 'lan@gmail.com', 'tlan123', 'avatar_0988722525.jpeg', current_timestamp(), current_timestamp(), 1),
(6, '0988722526', 'lieu@gmail.com', 'tlieu123', 'avatar_0988722526.jpeg',current_timestamp(), current_timestamp(), 1),
(7, '0988722527', 'lai@gmail.com', 'tlai123', 'avatar_0988722527.jpeg',current_timestamp(), current_timestamp(), 1),
(8, '0988722528', 'camhuong@gmail.com', 'chuong123','avatar_0988722528.jpg', current_timestamp(), current_timestamp(), 1);

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
('1', '1', '1', '1'),
('2', '1', '12', '1'),
('3', '2', '1', '1'),
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
('16', '3', '1', '1'),
('17', '3', '3', '1'),
('18', '3', '4', '1'),
('19', '3', '9', '1'),
('20', '4', '4', '1'),
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

INSERT INTO `orders` (`order_id`, `staff_id`, `account_id`, `receiver_name`, `email_of_receiver`, `phone_number_of_receiver`, `note`, `order_date`, `status_of_order`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `is_active`) VALUES 
('1', '3', '5', 'Anh Hiển', 'thehien@gmail.com', '0786705877', 'Tặng anh Hiển', current_timestamp(), 'Pending', '35990000', 'express', 'Nghĩa Địa Gia Đôi', '2024-03-07 19:34:36', '70L1-13579', 'COD', '1');

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `sku_id`, `price`, `number_of_products`, `color_of_product`) VALUES 
('1', '1', '1', '34990000', '1', 'Đen'),
('2', '1', '9', '500000', '2', 'Đen');




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


INSERT INTO `exports` (`export_id`, `staff_id`, `order_id`, `export_date`, `total_price`, `is_active`) VALUES 
('1', '1', '1', '2024-03-01', '15000000', '1'),
('2', '1', '1', '2024-02-01', '23000000', '1'),
('3', '1', '1', '2024-04-01', '17500000', '1'),
('4', '1', '1', '2024-05-01', '18000000', '1'),
('5', '1', '1', '2023-03-01', '15000000', '1'),
('6', '1', '1', '2023-02-01', '20000000', '1'),
('7', '1', '1', '2023-04-01', '25000000', '1'),
('8', '1', '1', '2023-05-01', '30000000', '1');

INSERT INTO `export_details` (`export_detail_id`, `export_id`, `shipment_id`, `unit_price_export`, `quantity_export`) VALUES 
('1', '1', '1', '10000000', '1'),
('2', '1', '2', '5000000', '1'),
('3', '2', '3', '15000000', '1'),
('4', '2', '4', '8000000', '1'),
('5', '3', '5', '10000000', '1'),
('6', '3', '6', '7500000', '1'),
('7', '4', '7', '5000000', '2'),
('8', '4', '8', '2000000', '4'),
('9', '5', '8', '5000000', '3'),
('10', '6', '8', '20000000', '1'),
('11', '7', '8', '5000000', '5'),
('12', '4', '8', '5000000', '6');

INSERT INTO `shipments` (`shipment_id`, `import_id`, `supplier_id`, `unit_price_import`, `quantity`, `remain`, `sku_id`, `is_active`) VALUES 
('1', '1', '1', '7000000', '50', '49', '1', '1'),
('2', '1', '2', '3000000', '50', '49', '1', '1'),
('3', '1', '3', '12000000', '50', '49', '1', '1'),
('4', '1', '4', '5000000', '50', '49', '1', '1'),
('5', '2', '5', '5000000', '50', '49', '1', '1'),
('6', '2', '6', '4000000', '50', '49', '1', '1'),
('7', '2', '7', '3000000', '50', '49', '1', '1'),
('8', '2', '8', '1500000', '50', '49', '1', '1'),
('9', '3', '8', '1000000', '50', '49', '1', '1'),
('10', '4', '8', '500000', '50', '49', '1', '1'),
('11', '5', '8', '1200000', '50', '49', '1', '1'),
('12', '6', '8', '500000', '50', '49', '1', '1'),
('13', '6', '8', '1300000', '50', '49', '1', '1'),
('14', '7', '8', '500000', '50', '49', '1', '1'),
('15', '7', '8', '1200000', '50', '49', '1', '1'),
('16', '8', '8', '500000', '50', '49', '1', '1'),
('17', '9', '8', '1300000', '50', '49', '1', '1'),
('18', '10', '8', '500000', '50', '49', '1', '1'),
('19', '11', '8', '1200000', '50', '49', '1', '1');;

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

INSERT INTO `roles` (`role_id`, `role_name`, `is_active`) VALUES 
('1', 'Admin', '1'),
('2', 'Nhân viên quản lý', '1'),
('3', 'Nhân viên bán hàng', '1'),
('4', 'Nhân viên kho', '1'),
('5', 'Khách hàng', '1');

INSERT INTO `contracts` (`contract_id`, `staff_id`, `start_date`, `end_date`, `salary`) VALUES 
('1', '1', '2024-03-01', '2025-03-01', '20000000'), 
('2', '2', '2024-03-01', '2025-03-01', '18000000'),
('3', '3', '2024-03-01', '2025-03-01', '13000000'),
('4', '4', '2024-03-01', '2025-03-01', '15000000');



INSERT INTO `leave_application` (`staff_id`, `start_date`, `end_date`, `reason`, `status`) VALUES
(1, '2024-05-01', '2024-05-01', 'Lý do cá nhân', 0),
(2, '2024-05-01', '2024-05-01', 'Ốm đau, thai sản', 0),
(3, '2024-05-01', '2024-05-01', 'Ốm đau, thai sản', 0),
(2, '2024-05-02', '2024-05-02', 'Lý do cá nhân', 0),
(1, '2024-05-02', '2024-05-02', 'Ốm đau, thai sản', 0),
(3, '2024-05-02', '2024-05-02', 'Ốm đau, thai sản', 0);


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

-- -- Lấy ngày hiện tại
-- SET @today = CURDATE();

-- -- Chèn các bản ghi attendance mới nếu chưa có bản ghi nào cho hôm nay
-- INSERT INTO attendance (timesheet_id, date, status)
-- SELECT timesheet_id, @today, 'Chưa điểm danh'
-- FROM timesheets
-- WHERE month = MONTH(@today) AND year = YEAR(@today)
-- AND NOT EXISTS (
--     SELECT 1 FROM attendance 
--     WHERE date = @today AND timesheet_id = timesheets.timesheet_id
-- );






-- DELIMITER //
-- CREATE TRIGGER insert_attendance_after_leave_insert
-- AFTER INSERT ON leave_application
-- FOR EACH ROW
-- BEGIN
--     DECLARE cur_date DATE;
--     DECLARE end_date DATE;

--     SET cur_date = NEW.start_date;
--     SET end_date = NEW.end_date;

--     -- Chèn các bản ghi attendance mới cho mỗi ngày từ start_date đến end_date
--     WHILE cur_date <= end_date AND NEW.reason <> 'Nghỉ việc' DO
--         INSERT INTO attendance (timesheet_id, date, status, leave_application_id)
--         SELECT timesheet_id, cur_date, 'Nghỉ phép', NEW.leave_application_id
--         FROM timesheets
--         INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
--         WHERE contracts.staff_id = NEW.staff_id
--         AND month = MONTH(cur_date) AND year = YEAR(cur_date)
--         AND NOT EXISTS (
--             SELECT 1 FROM attendance 
--             WHERE date = cur_date AND timesheet_id = timesheets.timesheet_id
--         );

--         SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
--     END WHILE;
-- END;
-- //
-- DELIMITER ;

-- insert vào đơn xin nghỉ và đc duyệt thì tự động insert điểm danh với status là nghỉ phép để ko điểm danh nữa
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
    WHILE cur_date <= end_date DO
        IF NEW.status = 1 AND NEW.reason <> 'Nghỉ việc' THEN
            INSERT INTO attendance (timesheet_id, date, status, leave_application_id)
            SELECT timesheet_id, cur_date, 'Nghỉ phép', NEW.leave_application_id
            FROM timesheets
            INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
            WHERE contracts.staff_id = NEW.staff_id
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




-- INSERT INTO `banner_locations` (`location_id`, `location_name`) VALUES ('1', 'home-header');

-- INSERT INTO `banners` (`image_path`, `url`, `banner_name`, `location_id`, `width`, `height`) VALUES ('banners/banner1.png', '../Catalog/Category?context=laptop?context-value=1', 'banner_header1', '1', '800', '600');
-- INSERT INTO `banners` (`image_path`, `url`, `banner_name`, `location_id`, `width`, `height`) VALUES ('banners/banner2.png', '../Catalog/Category?context=laptop?context-value=2', 'banner_header2', '1', '800', '600');

-- INSERT INTO `featured_products_rows` (`row_name`, `row_description`,`index`) VALUES ('Sản phẩm nổi bật', 'Các sản phẩm mới và nổi bật trong tháng 4',1);
-- INSERT INTO `featured_products_rows` (`row_name`, `row_description`,`index`) VALUES ('Sản phẩm mới', 'Sản phẩm mới vừa xuất hiện trên thị trường',2);

-- INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES ('1', '1', '1');
-- INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES ('2', '2', '1');
-- INSERT INTO `featured_products` (`featured_id`, `product_id`, `featured_row`) VALUES ('3', '3', '1');




-- Việc tạo tự động timesheet sẽ không còn được thực hiện nếu tháng hiện tại không nằm trong hợp đồng
-- INSERT INTO timesheets (`contract_id`, `month`, `year`, `days_worked`, `days_off`, `days_leave`, `days_late`)
--     SELECT contracts.contract_id, MONTH(CURDATE()), YEAR(CURDATE()), 0, 0, 0, 0
--     FROM contracts
--     WHERE NOT EXISTS (
--         SELECT 1 FROM timesheets 
--         WHERE month = MONTH(CURDATE()) AND year = YEAR(CURDATE()) AND contract_id = contracts.contract_id
--     )
--     AND CURDATE() BETWEEN contracts.start_date AND contracts.end_date;

-- Lấy ngày hiện tại

-- Chèn các bản ghi attendance mới nếu chưa có bản ghi nào cho hôm nay
-- SET @today = CURDATE();
-- INSERT INTO attendance (timesheet_id, date, status)
-- SELECT timesheet_id, @today, 'Chưa điểm danh'
-- FROM timesheets
-- INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
-- INNER JOIN staffs ON contracts.staff_id = staffs.staff_id
-- INNER JOIN accounts ON staffs.account_id = accounts.account_id
-- WHERE month = MONTH(@today) AND year = YEAR(@today)
-- AND accounts.is_active = 1
-- AND NOT EXISTS (
--     SELECT 1 FROM attendance 
--     WHERE date = @today AND timesheet_id = timesheets.timesheet_id
-- );
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
('3', '3', '2024', '23', '1', '0', '0'),
('4', '3', '2024', '23', '0', '1', '2');

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