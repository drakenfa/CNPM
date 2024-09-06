-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: electronic_supermarket
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'0988722521','hien@gmail.com','thien123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(2,'0988722522','huy@gmail.com','123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(3,'0988722523','loc@gmail.com','mloc123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(4,'0988722524','phong@gmail.com','hphong123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(5,'0988722525','lan@gmail.com','tlan123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(6,'0988722526','lieu@gmail.com','tlieu123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(7,'0988722527','lai@gmail.com','tlai123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(8,'0988722528','camhuong@gmail.com','chuong123',NULL,'2024-04-19 11:01:52','2024-04-19 11:01:52',1),(9,'0220232031c','customer1@gmail.com','123',NULL,'2024-04-19 12:05:28','2024-04-19 12:05:28',1),(10,'1320202300c','customer2@gmail.com','123',NULL,'2024-04-19 12:05:28','2024-04-19 12:05:28',1),(11,'2320323999s','staff1@gmail.com','123',NULL,'2024-04-19 12:05:56','2024-04-19 12:05:56',1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Apple','apple.jpg',1,1),(2,'Samsung','samsung.png',2,1),(3,'Xiaomi','xiaomi.png',3,1),(4,'OPPO','oppo.jpg',4,1),(5,'Acer','acer.png',5,1),(6,'HP','hp.png',6,1),(7,'ASUS','asus.png',7,1),(8,'Lenovo','lenovo.png',8,1),(9,'AVA+','ava.jpg',9,1),(10,'Xmobile','xmobile.jpg',10,1),(11,'Baseus','baseus.jpg',11,1),(12,'JBL','jbl.jpg',12,1),(13,'Sony','sony.jpg',13,1),(14,'Logitech','logitech.jpeg',14,1),(15,'Genius','genius.jpg',15,1),(16,'Corsair','corsair.jpg',16,1),(17,'Dareu','dareu.png',17,1),(18,'Rapoo','rapoo.png',18,1),(19,'Dell','dell_inspiron.png',19,1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Điện thoại','logo/category_logo/smartphone.png',1),(2,'Laptop','logo/category_logo/laptop.png',1),(3,'Smartwatch','logo/category_logo/smartwatch.png',1),(4,'Sạc dự phòng','logo/category_logo/backup_charger.png',1),(5,'Tai nghe Bluetooth','logo/category_logo/headphone.png',1),(6,'Loa','logo/category_logo/speaker.png',1),(7,'Chuột máy tính','logo/category_logo/',1),(8,'Bàn phím','',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nguyễn Thị Lan',5,5,1,'Quận 1, Thành Phố Hồ Chí Minh','2003-06-12',1),(2,'Nguyễn Thị Liễu',5,6,1,'Quận 2, Thành Phố Hồ Chí Minh','2003-04-12',1),(3,'Nguyễn Thị Lài',5,7,1,'Quận 3, Thành Phố Hồ Chí Minh','2004-02-11',1),(4,'Nguyễn Thị Cẩm Hường',5,8,1,'Quận 4, Thành Phố Hồ Chí Minh','2001-05-11',1),(5,'customer1',5,9,1,'273 ADV','2001-02-01',1),(6,'customer2',5,10,1,'290 THD','2003-04-12',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `decentralizations`
--

LOCK TABLES `decentralizations` WRITE;
/*!40000 ALTER TABLE `decentralizations` DISABLE KEYS */;
INSERT INTO `decentralizations` VALUES (1,1,1,1),(2,1,12,1),(3,2,1,1),(4,2,2,1),(5,2,3,1),(6,2,4,1),(7,2,5,1),(8,2,6,1),(9,2,7,1),(10,2,8,1),(11,2,9,1),(12,2,10,1),(13,2,11,1),(14,3,1,1),(15,3,3,1),(16,3,4,1),(17,3,9,1),(18,4,4,1),(19,4,5,1),(20,4,6,1),(21,4,7,1),(22,4,8,1);
/*!40000 ALTER TABLE `decentralizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `export_details`
--

LOCK TABLES `export_details` WRITE;
/*!40000 ALTER TABLE `export_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exports`
--

LOCK TABLES `exports` WRITE;
/*!40000 ALTER TABLE `exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `guarantees`
--

LOCK TABLES `guarantees` WRITE;
/*!40000 ALTER TABLE `guarantees` DISABLE KEYS */;
/*!40000 ALTER TABLE `guarantees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
INSERT INTO `imports` VALUES (1,1,'2024-04-20 14:45:51',1);
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Tài khoản',1),(2,'Nhân viên',1),(3,'Khách hàng',1),(4,'Sản phẩm',1),(5,'Nhà cung cấp',1),(6,'Kho hàng',1),(7,'Nhập hàng',1),(8,'Xuất hàng',1),(9,'Hóa đơn',1),(10,'Lương',1),(11,'Thống kê',1),(12,'Phân quyền',1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `noti`
--

LOCK TABLES `noti` WRITE;
/*!40000 ALTER TABLE `noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (3,1,'Kích thước','159,9 mm x 76,7 mm x 8,25 mm',1),(4,1,'Trọng lượng','221 g',1),(5,1,'Màn hình','2796x1290 Super Retina XDR OLED 6,7 inch',1),(6,1,'Chip','A17 Pro 6 Core 2P 4E 16x Neural Engine',1),(7,1,'Camera','3 Camera Main 48MP, Ultra Wide 12MP, Telephoto 5x 12MP',1),(8,2,'Chip xử lý','Samsung 10 Core 6 P-Core 4 E-Core 5.00GHz',1),(9,2,'asd','123',0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,52,250000.00,1,''),(2,1,60,2400000.00,1,'');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,9,'Cu1','customer1@gmail.com','0239902200','','2024-04-20 21:12:59','Delivered',2650000.00,'','395 THN',NULL,'','',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (7,89,'1/89/1.jfif'),(8,89,'1/89/cat-d.png'),(9,89,'1/89/bob_avatar.png'),(10,89,'1/89/the-wok.png'),(11,1,'1/1/iphone15-2.jpg'),(12,1,'1/1/iphone15-4.png'),(13,1,'1/1/iphone15-3.jpg'),(14,1,'1/1/iphone15-1.jpg');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 15 Pro Max RAM 8GB/ROM 256GB',1,1,34990000.00,12,'1/iphone_15_pro_max.jpg','iPhone 15 là sự lựa chọn hoàn hảo cho những người sành điện thoại','2024-04-19 11:01:52','2024-04-19 11:01:52',3.25,4,1),(2,'Samsung Galaxy S23 FE 5G RAM 8GB/ROM 128GB',2,1,14890000.00,12,'1/samsung_galaxy_s23_fe_5g.jpeg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(3,'Xiaomi Redmi Note 13 RAM 6GB/ROM 128GB',3,1,4890000.00,18,'1/xiaomi_redmi_note_13.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(4,'OPPO A57 RAM 4GB/ROM 128GB',4,1,4990000.00,12,'1/oppo_a57.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(5,'Acer Aspire 5 A514 54 5127 i5 1135G7 (NX.A28SV.007) RAM 8GB/SSD 512GB',5,2,15490000.00,12,'2/acer_aspire_a514_54_5127_i5.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(6,'HP Pavilion 15 eg2062TX i5 1235U (7C0W7PA) RAM 8GB/SSD 512GB',6,2,20590000.00,12,'2/hp_pavilion_15_eg2062tx_i5.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(7,'Asus TUF Gaming F15 FX507ZC4 i5 12500H (HN074W) RAM 8GB/SSD 512GB',7,2,23990000.00,24,'2/asus_tuf_gaming_f15_fx507zc4_i5.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(8,'Lenovo Gaming Legion 5 16IRH8 i5 13500H (82YA00BSVN) RAM 16GB/SSD 512',8,2,36990000.00,36,'2/lenovo_legion_5_16irh8_i5.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(9,'AVA+ 15W JP399',9,4,500000.00,12,'4/pin_sac_du_phong_polymer_10000mah_type_c_15w_ava.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(10,'Xmobile 20W DS223B',10,4,890000.00,12,'4/sac_du_phong_polymer_10000mah_khong_day_magnetic_type_c_pd_20w_xmobile.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(11,'Baseus Comet 22.5W PPMD10 kèm cáp Lightning và Type C',11,4,1100000.00,12,'4/sac-du-phong-10000mah_typecpd_22_5w_baseus_ppmd10_cap_lightning_va_typec.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(12,'Apple Watch SE 2023 GPS 40mm viền nhôm dây thể thao',1,3,6390000.00,12,'3/apple_watch_se_2023_40mm_vien_nhom_day_silicone_xanh_duong.jpg','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(13,'Samsung Galaxy Watch5 Pro LTE 45mm dây silicone',2,3,12990000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(14,'Xiaomi Redmi Watch 4 47.5mm dây silicone',3,3,2690000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(15,'Tai nghe Bluetooth AirPods Pro Gen 2 MagSafe Charge (USB-C) Apple MTJV3',1,5,6200000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(16,'Tai nghe Bluetooth True Wireless Xiaomi Redmi Buds 5 Pro',3,5,1990000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(17,'Tai nghe Bluetooth True Wireless AVA+ FreeGo A20',9,5,290000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(18,'Loa Bluetooth JBL Pulse 5',12,6,6690000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(19,'Loa Bluetooth Sony SRS-XB13',13,6,1290000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(20,'Loa Bluetooth AVA+ FreeGo F13',9,6,450000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(21,'Chuột Không Dây Silent Rapoo B2S',18,7,200000.00,24,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(22,'Chuột Không dây DareU LM106G',17,7,150000.00,24,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(23,'Chuột Có dây Gaming Corsair M55 RGB Pro',16,7,890000.00,24,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(24,'Chuột Có dây Gaming Genius Scorpion M700',15,7,490000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(25,'Bàn phím Bluetooth Logitech K380',14,8,750000.00,12,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(26,'Bàn Phím Có Dây DareU EK87',17,8,650000.00,24,'','Đây là mô tả sản phẩm','2024-04-19 11:01:52','2024-04-19 11:01:52',0,0,1),(28,'Laptop Dell Vostro 14 3430 i5 1335U/8GB/512GB/2GB MX550/OfficeHS/Win11',19,2,119900.00,24,'laptop/dell_vostro.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(29,'Laptop Dell Precision 14 3480 i7 12800H/32GB/1TB/4GB RTXA500/Win11 Pro',19,2,507900.00,24,'laptop/dell_precision.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(31,'Laptop Lenovo V14 G3 ABA R5 5625U/8GB/512GB/Win11',8,2,98900.00,24,'laptop/lenovo-v14-g3-aba-r5-82tu006svn-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(32,'Laptop Lenovo Yoga 7 14IRL8 i5 1340P/16GB/512GB/Touch/Pen/OfficeHS/Win11',8,2,98900.00,24,'laptop/vi-vn-lenovo-yoga-7-14irl8-i5-82yl006avn-slider-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(34,'Laptop Acer Gaming Aspire 7 A715 43G R8GA R5 5625U/8GB/512GB/4GB RTX3050/144Hz/Win11',5,2,159900.00,24,'laptop/acer-aspire-7-gaming-a715-43g-r8ga-r5-nhqhdsv002-2-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(35,'Laptop Acer Aspire Lite 15 51M 55NB i5 1155G7/8GB/512GB/Win11',5,2,119900.00,24,'laptop/acer-aspire-lite-15-51m-55nb-i5-nxkrssv001-2.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(37,'Laptop HP 15s fq5229TU i3 1215U/8GB/512GB/Win11',6,2,104900.00,24,'laptop/hp-15s-fq5229tu-i3-8u237pa-glr-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(38,'Laptop HP Pavilion 14 dv2073TU i5 1235U/16GB/512GB/Win11 ',6,2,175900.00,24,'laptop/hp-pavilion-14-dv2073tu-i5-7c0p2pa-2-2.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(40,'Laptop Asus TUF Gaming FX507ZC4-HN095W i5 12500H/16GB/512GB/15.6\"/Nvidia RTX 3050 4GB/Win11',7,2,209900.00,24,'laptop/638249405783488795_Asus TUF Gaming FX507ZC4-HN095W 1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(41,'Laptop Asus TUF Gaming FX506HC-HN144W i5 11400H/8GB/512GB/15.6\"FHD/GeForce RTX 3050 4GB/Win 11',7,2,174900.00,24,'laptop/ASUS-TUF-Gaming-F15-2021-black-fpt-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(43,'Điện thoại iPhone 14 Pro Max 128GB',1,1,273900.00,24,'smartphone/iphone-14-pro-max-purple-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(44,'Điện thoại iPhone 12 64GB',1,1,120900.00,24,'smartphone/iphone-12-trang-1-1-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(46,'Điện thoại Samsung Galaxy S23 FE 5G 128GB - Màu Đặc Quyền',2,1,123900.00,24,'smartphone/samsung-galaxy-s23-fe-sld-1-1020x570.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(47,'Điện thoại Samsung Galaxy Z Flip5 5G 256GB',2,1,216900.00,24,'smartphone/samsung-galaxy-z-flip5-5g-sld-1021x570.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(49,'Điện thoại Xiaomi Redmi Note 13 Pro 5G',3,1,89900.00,24,'smartphone/xiaomi-redmi-note-13-pro-sliderr-99-2048x1144.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(50,'Điện thoại Xiaomi Redmi Note 13 Pro 256GB',3,1,74900.00,24,'smartphone/xiaomi-redmi-note-13-pro-8-256638441930939443824.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(52,'Điện thoại OPPO A18 64GB ',4,1,32900.00,24,'smartphone/oppo-a18-12-1020x570.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(53,'Điện thoại OPPO A57 128GB ',4,1,36900.00,24,'smartphone/oppo-a57-4g637916782091781459-1020x570.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(55,'Loa Bluetooth JBL Pulse 5',12,6,63500.00,24,'speaker/loa-bluetooth-jbl-pulse-5-1-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(56,'Loa Bluetooth JBL Partybox On The Go',12,6,54900.00,24,'speaker/bluetooth-jbl-partybox-on-the-go-600x600-1-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(57,'Loa Bluetooth JBL Authentics AUTH500 ',12,6,160000.00,24,'speaker/loa-bluetooth-jbl-authentics-auth500-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(58,'Loa Bluetooth JBL Authentics 300',12,6,112900.00,24,'speaker/loa-bluetooth-jbl-authentics-a300-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(59,'Loa Bluetooth JBL Partybox Encore 2Mic',12,6,103900.00,24,'speaker/loa-bluetooth-jbl-partybox-encore-2mic-5.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(60,'Loa Bluetooth JBL Xtreme 3',12,6,62600.00,24,'speaker/loa-bluetooth-jbl-xtreme-3-den-7.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(61,'Loa Bluetooth JBL Boombox 3 ',12,6,113900.00,24,'speaker/loa-bluetooth-jbl-boombox-3-01.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(62,'Loa Bluetooth JBL Partybox 310 ',12,6,149000.00,24,'speaker/loa-bluetooth-jbl-partybox-310-2.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(63,'Loa Bluetooth JBL Partybox 110 ',12,6,109000.00,24,'speaker/loa-bluetooth-jbl-partybox-110-imei-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(65,'Tai nghe Bluetooth True Wireless Sony WF-C500  ',13,5,15200.00,24,'bluetooth_headphone/bluetooth-true-wireless-sony-wf-c500-den-1-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(66,'Tai nghe Bluetooth chụp tai Sony WH-1000XM4 ',13,5,51900.00,24,'bluetooth_headphone/group_17333.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(67,'Tai nghe Bluetooth chụp tai Sony WH-1000XM5 ',13,5,65900.00,24,'bluetooth_headphone/tai-nghe-chup-tai-sony-wh-1000xm5-4.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(68,'Tai nghe Gaming chụp tai không dây Sony INZONE H5 ',13,5,29900.00,24,'bluetooth_headphone/tai-nghe-chup-tai-sony-inzone-h5_5_.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(70,'Chuột Không dây Logitech M190 ',14,7,2900.00,24,'mouse/chuot-khong-day-logitech-m190-xanh-den-1-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(71,'Chuột Có dây Gaming Logitech G102 Gen2 Lightsync  ',14,7,4050.00,24,'mouse/chuot-gaming-logitech-g102-gen2-lightsync-den-1-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(72,'Chuột Không dây Logitech M185 ',14,7,2350.00,24,'mouse/chuot-khong-day-logitech-m185-xanh-1-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(73,'Chuột Không dây Bluetooth Silent Logitech Signature M650 ',14,7,6900.00,24,'mouse/chuot-khong-day-logitech-signature-m650-den-size-m-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(74,'Chuột Không Dây Logitech M171  ',14,7,3000.00,24,'mouse/chuot-khong-day-logitech-m171-hong-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(75,'Chuột Không dây Silent Logitech M331  ',14,7,3400.00,24,'mouse/chuot-khong-day-silent-logitech-m331-den-1-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(76,'Chuột Không dây Bluetooth Logitech MX Anywhere 2S Đen ',14,7,11900.00,24,'mouse/chuot-khong-day-logitech-mx-anywhere-2s-den-2-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(77,'Chuột Không dây Logitech Silent M220 ',14,7,3000.00,24,'mouse/chuot-khong-day-logitech-silent-m220-den-2-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(78,'Chuột Không dây Logitech M170  ',14,7,2650.00,24,'mouse/chuot-khong-day-logitech-m170-den-2-org.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(80,'Bộ Bàn Phím Chuột Không Dây Logitech MK240  ',14,8,4900.00,24,'keyboard/bo-ban-phim-chuot-khong-day-logitech-mk240-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(81,'Bàn Phím Có Dây Logitech K120 ',14,8,2000.00,24,'keyboard/ban-phim-co-day-logitech-k120-1.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(82,'Bàn phím Logitech G715 TKL Off White Tactile ',14,8,43390.00,24,'keyboard/ry-2_7af4effd78704121b18c73e248e8c837_dc5da1862ff54f40b5a3ca4c1588b460_424c03d1e5b6411fa4f795ec1153ace7_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(83,'Bàn phím Logitech G512 GX RGB Tactile ',14,8,19900.00,24,'keyboard/thumbphim_849d9bd31e594549b4cdce2e5fb3e375_f6b2f16edca047db8ae41f652391e5e8_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(84,'Bàn phím Logitech G Pro X TKL Light Speed Tactile Switch Black ',14,8,39900.00,24,'keyboard/1_5b2f7891bf434a7aab9f1abdba56c17e_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(85,'Bàn phím Logitech G Pro X Gaming - Đen ',14,8,22900.00,24,'keyboard/thumbphim_9fb12e4f19d94b31aeb8cc81546d86df_b2aa143d682b4850a8f2abe30706a659_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(86,'Bàn phím cơ Logitech MX Mechanical Graphite Tactile Silent 920-010760 ',14,8,39900.00,24,'keyboard/hanical-keyboard-top-view-graphite-us_602a1fb095904851880b1da99a10fb6a_c609e86185f249e78554c198895da48f_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(87,'Bàn phím Logitech Pebble Keys 2 K380S White ',14,8,7200.00,24,'keyboard/2_32cbb3f99f4e460cb0dbb41ac19450d0_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(88,'Bàn Phím Bluetooth Logitech K380 Black ',14,8,6090.00,24,'keyboard/hinh-1_8c2dd4e8724c4e6b80d6709e92a9f6e1_5f112479df724affa1ce4f649a40ad43_grande.jpg',NULL,'2024-03-24 10:28:44','2024-03-24 10:28:44',0,0,1),(89,'Abc123',1,1,200000000.00,3,'1/0.png','1','2024-04-19 15:46:41','2024-04-19 15:46:41',0,0,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (4,1,1,5,'Sản phẩm này mắc nhưng hoàn hảo','2024-04-20 07:43:03',1),(7,1,2,3.5,'Mắc quá tôi mua hết tiền của tôi rồi','2024-04-20 18:55:19',1),(8,1,3,4.5,NULL,'2024-04-20 19:45:32',1),(12,1,5,0,'Điện thoại khá nặng nhưng cầm trên tay thì thấy mình sang hẳn lên','2024-04-20 21:44:39',1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',1),(2,'Nhân viên quản lý',1),(3,'Nhân viên bán hàng',1),(4,'Nhân viên kho',1),(5,'Khách hàng',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,1,1,200000000.00,10,10,52,'2023-04-04','2028-03-03',1),(2,1,1,200000000.00,10,8,55,'2023-04-04','2028-03-03',1),(3,1,1,200000000.00,10,6,57,'2023-04-04','2028-03-03',1);
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skus`
--

LOCK TABLES `skus` WRITE;
/*!40000 ALTER TABLE `skus` DISABLE KEYS */;
INSERT INTO `skus` VALUES (25,'Trang','44-W',44,1),(26,'Xanh lá','44-XL',44,1),(27,'Đen','44-D',44,1),(28,'Tím','44-T',44,1),(29,'Xanh dương','44-XD',44,1),(30,'Đỏ','44-R',44,1),(35,'Trang','46-W',46,1),(36,'Xanh mint','46-X',46,1),(37,'Xanh mint','47-X',47,1),(38,'Tím','47-T',47,1),(39,'Xám','47-G',47,1),(40,'Kem','47-K',47,1),(44,'Xanh','49-X',49,1),(45,'Đen','49-D',49,1),(46,'Tím','49-T',49,1),(47,'Xanh lá','50-XL',50,1),(48,'Đen','50-D',50,1),(49,'Tím','50-T',50,1),(50,'Đen','52-D',52,1),(51,'Xanh dương','52-XD',52,1),(52,'128GB - Vàng','1-128G-Y',1,1),(53,'256GB - Vàng','1-256G-Y',1,1),(54,'128GB - Bạc','1-128G-S',1,1),(55,'256GB - Bạc','1-256G-S',1,1),(56,'128GB - Hồng','1-128G-P',1,1),(57,'256GB - Hồng','1-256G-P',1,1),(58,'128GB - Đen','2-128G-B',2,1),(59,'256GB - Đen','2-256G-B',2,1),(60,'128GB - Bạc','2-128G-S',2,1),(61,'256GB - Bạc','2-256G-S',2,1),(62,'128GB - Đỏ','2-128G-R',2,1),(63,'256GB - Đỏ','2-256G-R',2,1),(64,'128GB - Vàng','3-128G-Y',3,1),(65,'256GB - Vàng','3-256G-Y',3,1),(66,'128GB - Hồng','3-128G-P',3,1),(67,'256GB - Hồng','3-256G-P',3,1),(68,NULL,'5-D',5,1),(69,NULL,'6-D',6,1),(70,NULL,'7-D',7,1),(71,NULL,'8-D',8,1),(72,'Xanh','AB-Xa',89,1);
/*!40000 ALTER TABLE `skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,1,'Lê Nguyễn Thế Hiển',1,0,'Tây Ninh','2024-04-19',1),(2,2,'Võ Quốc Huy',2,0,'Cần Thơ','2024-04-19',1),(3,3,'Khổng Minh Lộc',3,0,'Nha Trang','2024-04-19',1),(4,4,'Lâm Hồng Phong',4,0,'Vũng Tàu','2024-04-19',1),(5,11,'Bui Van Su',1,0,'Dak Lak','2024-04-19',1);
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Apple Store Việt Nam','0918001192','268 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh','applestorevn@gmail.com',1),(2,'Galaxy Store Việt Nam','0918001193','280 Đ. An Dương Vương, Phường 4, Quận 5, Thành phố Hồ Chí Minh','galaxystorevn@gmail.com',1),(3,'Xiaomi Store Việt Nam','0918001194','217 Đ. Hồng Bàng, Phường 11, Quận 5, Thành phố Hồ Chí Minh','mistorevn@gmail.com',1),(4,'OPPO Store Việt Nam','0918001195','01 Võ Văn Ngân, Linh Chiểu, Thủ Đức, Thành phố Hồ Chí Minh','oppostorevn@gmail.com',1),(5,'Acer Store Việt Nam','0918001196','704-05/37 Đ. Tôn Đức Thắng, Ward, Quận 1, Thành phố Hồ Chí Minh','acerstorevn@gmail.com',1),(6,'HP Store Việt Nam','0918001197','475A Đ. Điện Biên Phủ, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh','hpstorevn@gmail.com',1),(7,'ASUS Store Việt Nam','0918001198','196 Pasteur, Phường 6, Quận 3, Thành phố Hồ Chí Minh','asusstorevn@gmail.com',1),(8,'Lenovo Store Việt Nam','0918001199','55 Giải Phóng, Đồng Tâm, Hai Bà Trưng, Hà Nội','lenovostorevn@gmail.com',1),(9,'AVA+ Store Việt Nam','0918001200','136 Xuân Thủy, Dịch Vọng Hậu, Cầu Giấy, Hà Nội','avaplusstorevn@gmail.com',1),(10,'Xmobile Store Việt Nam','0918001201','Khu phố 6, TP Thủ Đức, Thành phố Hồ Chí Minh','xmobilestorevn@gmail.com',1),(11,'Baseus Store Việt Nam','0918001202','227 Đ. Nguyễn Văn Cừ, Phường 4, Quận 5, Thành phố Hồ Chí Minh','baseusstorevn@gmail.com',1),(12,'JBL Store Việt Nam','0918001203','12 Nguyễn Văn Bảo, Phường 4, Gò Vấp, Thành phố Hồ Chí Minh','jblstorevn@gmail.com',1),(13,'Sony Store Việt Nam','0918001204','97 Võ Văn Tần, Phường 6, Quận 3, Thành phố Hồ Chí Minh','sonystorevn@gmail.com',1),(14,'Logitech Store Việt Nam','0918001205','10-12 Đ. Đinh Tiên Hoàng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','logitechstorevn@gmail.com',1),(15,'Genius Store Việt Nam','0918001206','19 Đ. Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh','geniusstorevn@gmail.com',1),(16,'Corsair Store Việt Nam','0918001207','665-667-669 Đ. Điện Biên Phủ, Phường 1, Quận 3, Thành phố Hồ Chí Minh','corsairstorevn@gmail.com',1),(17,'Dareu Store Việt Nam','0918001208','180 Đ. Cao Lỗ, Phường 4, Quận 8, Thành phố Hồ Chí Minh','dareustorevn@gmail.com',1),(18,'Rapoo Store Việt Nam','0918001209','104 Đ. Nguyễn Văn Trỗi, Phường 8, Phú Nhuận, Thành phố Hồ Chí Minh','rapoostorevn@gmail.com',1),(19,'Dell Store Việt Nam','0923020320','1230123902103','dellstorevn@gamil.com',1);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `timesheet_details`
--

LOCK TABLES `timesheet_details` WRITE;
/*!40000 ALTER TABLE `timesheet_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheet_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22 10:47:10
