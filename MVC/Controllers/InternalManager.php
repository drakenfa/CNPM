<?php
    class InternalManager extends Controller{
        public $internalManagerService;
        public $exportService;
        public $brandService;
        public $skuService;
        public $importService;
        public $exportDetailService;
        public $productService;
        public $customerService;
        public $orderService;
        public $staffService;
        public $roleService;
        public $supplierService;
        public $shipmentService;
        public $accountService;
        public $decentralizationService;
        public $orderDetailService;
        public $attendanceService;
        public $leaveApplicationService;
        public $categoryService;
        public $timesheetDetailService;
        public $contractService;
        public function __construct(){
            $this->internalManagerService = $this->service("InternalManagerService");
            $this->productService = $this->service("ProductService");
            $this->customerService = $this->service("CustomerService");
            $this->orderService = $this->service("OrderService");
            $this->staffService = $this->service("StaffService");
            $this->brandService = $this->service("BrandService");
            $this->roleService = $this->service("RoleService");
            $this->skuService = $this->service("SkuService");
            $this->categoryService = $this->service("CategoryService");
            $this->supplierService = $this->service("SupplierService");
            $this->shipmentService = $this->service("ShipmentService");
            $this->accountService = $this->service("AccountService");
            $this->exportService = $this->service("ExportService");
            $this->importService = $this->service("ImportService");
            $this->exportDetailService = $this->service("ExportDetailService");
            $this->decentralizationService = $this->service("DecentralizationService");
            $this->orderDetailService = $this->service("OrderDetailService");
            $this->attendanceService = $this->service("AttendanceService");
            $this->leaveApplicationService = $this->service("LeaveApplicationService");
            $this->timesheetDetailService = $this->service("TimesheetDetailService");
            $this->contractService = $this->service("ContractService");
        }
        public function HomeManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "HomeManager",
                    "Title" => "Trang chủ"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function AccountManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "AccountManager",
                    "Title" => "Tài khoản"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
            
            
        }
        public function StaffManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "StaffManager",
                    "Title" => "Nhân viên"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
            
        }
        public function CustomerManager(){
            // if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
            //     $this->view("internalManager", [
            //         "Page" => "CustomerManager",
            //         "Title" => "Khách hàng"
            //     ]);
            // }else{
            //     header('Location: ../SignIn/SayHi');
            // }

            $this->view("internalManager", [
                "Page" => "CustomerManager",
                "Title" => "Khách hàng"
            ]);
        }
        public function ProductManager(){
            if(!isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) || $_SESSION["role_id"]==5){
                header('Location: ../SignIn/SayHi');
            }   
            
            $uri = parse_url($_SERVER['REQUEST_URI']);

            $urlParams = null;
            if(isset($uri["query"])){            
                parse_str(urldecode($uri["query"]),$urlParams);
            }
            unset($uri);
            
            $resultProductList = $this->productService->GetFilteredProducts($urlParams,null, null, "" , "products.product_id ASC");
            $sql = "SELECT category_id,category_name
            FROM categories
            WHERE categories.is_active = '1'";
            $resultCategoryList = $this->productService->getProductsQuery($sql);
            unset($sql);
            
            $sql = "SELECT brand_id,brand_name
            FROM brands
            WHERE brands.is_active = '1'";
            $resultBrandList = $this->productService->getProductsQuery($sql);
            unset($sql);

            $this->view("internalManager", [
                "Page" => "ProductManager",
                "Title" => "Sản phẩm",
                "ProductList"=>$resultProductList,
                "CategoryList"=>$resultCategoryList,
                "BrandList"=>$resultBrandList,
                "URLParams"=>$urlParams
            ]);
        }

        public function DecodeURL(){
            $uri = parse_url($_SERVER['REQUEST_URI']);

            $urlParams = null;
            if(isset($uri["query"])){            
                parse_str(urldecode($uri["query"]),$urlParams);
            }
            return $urlParams;
        }

        public function GetMoreProducts(){
            $urlParams = $this->DecodeURL();

            $resultProductList = $this->productService->GetFilteredProducts($urlParams,"","", "", "products.product_id ASC");

            ob_start();
            $productList = $resultProductList["ProductList"];
            include("./MVC/Views/Pages/Manager/ProductManagers/ProductPrint.php");
            $htmlData=ob_get_contents();
            unset($productList); 
            ob_end_clean();

            $responseData = [
                "ProductsHTML"=>$htmlData,
                "StatusData"=>["IsLast"=>$resultProductList["IsLast"]]
            ];
            header('Content-Type: application/json');
            echo json_encode($responseData);
        }

        public function SupplierManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "SupplierManager",
                    "Title" => "Nhà cung cấp"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
            
        }
        public function WarehouseManager(){
            if(!(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) || $_SESSION["role_id"]==5)){
                header('Location: ../SignIn/SayHi');
            }   
            
            $uri = parse_url($_SERVER['REQUEST_URI']);

            $urlParams = null;
            if(isset($uri["query"])){            
                parse_str(urldecode($uri["query"]),$urlParams);
            }
            unset($uri);

            $productList = $this->productService->getFilteredProducts($urlParams,"products.product_id, products.product_name, categories.category_id, categories.category_name, brands.brand_id, brands.brand_name, skus.sku_id, skus.sku_code, skus.sku_name, IFNULL(SUM(shipments.remain),0) as total_remain","join skus on skus.product_id = products.product_id left outer join shipments on shipments.sku_id = skus.sku_id","skus.is_active = 1","","skus.sku_id");

            $this->view("internalManager", [
                "Page" => "WarehouseManager",
                "Title" => "Kho",
                "ProductList" => $productList,
                "urlParams"=>$urlParams
            ]);
        }

        public function GetMoreProductWarehouse(){
            $urlParams = $this->DecodeURL();

            $resultProductList = $this->productService->getFilteredProducts($urlParams,"products.product_id, products.product_name, categories.category_id, categories.category_name, brands.brand_id, brands.brand_name, skus.sku_id, skus.sku_code,  skus.sku_name, IFNULL(SUM(shipments.remain),0) as total_remain","join skus on skus.product_id = products.product_id left outer join shipments on shipments.sku_id = skus.sku_id","skus.is_active = 1","","skus.sku_id");

            ob_start();
            $productList = $resultProductList["ProductList"];
            include("./MVC/Views/Pages/Manager/WarehouseManager/ProductPrint.php");
            $htmlData=ob_get_contents();
            unset($productList); 
            ob_end_clean();

            $responseData = [
                "ProductsHTML"=>$htmlData,
                "StatusData"=>["IsLast"=>$resultProductList["IsLast"]]
            ];
            header('Content-Type: application/json');
            echo json_encode($responseData);
        }

        public function ImportManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "ImportManager",
                    "Title" => "Nhập hàng"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function ExportManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "ExportManager",
                    "Title" => "Xuất hàng"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function OrderManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "OrderManager",
                    "Title" => "Hóa đơn"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function SalaryManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "SalaryManager",
                    "Title" => "Lương"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function SelfSalaryManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "SelfSalaryManager",
                    "Title" => "Lương cá nhân"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function StatisticManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "StatisticManager",
                    "Title" => "Thống kê"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function DecentralizationManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "DecentralizationManager",
                    "Title" => "Phân quyền"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function LeaveApplicationManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "LeaveApplicationManager",
                    "Title" => "Đơn xin nghỉ"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function PersonalInfoManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "PersonalInfoManager",
                    "Title" => "Thông tin cá nhân"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function AttendenceManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "AttendenceManager",
                    "Title" => "Điểm danh"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function TimesheetManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "TimesheetManager",
                    "Title" => "Chấm công"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function ContractManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $this->view("internalManager", [
                    "Page" => "ContractManager",
                    "Title" => "Hợp đồng"
                ]);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }
        public function AdvertisementManager(){
            if(isset($_SESSION["account_id"]) && isset($_SESSION["role_id"]) && $_SESSION["role_id"]!=5){
                $bannerList = $this->productService->productRepo->get(
                    "SELECT banners.banner_id, banners.banner_name, banners.url, banners.image_path, banners.width, banners.height, banners.location_id, banner_locations.location_name
                    FROM banners join banner_locations on banners.location_id = banner_locations.location_id 
                    WHERE is_active = 1"
                );
                $locationList = $this->productService->productRepo->get("SELECT * FROM banner_locations");


                $featuredRowList = $this->productService->productRepo->get(
                    "SELECT * FROM featured_products_rows WHERE is_active = 1 ORDER BY featured_products_rows.index ASC"
                );

                $urlParams = $this->DecodeURL();

                $resultProductList = $this->productService->GetFilteredProducts($urlParams,
                    " DISTINCT products.product_id, products.product_name, products.description, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id, products.created_at, products.updated_at",
                    " join skus on skus.product_id = products.product_id"
                );
                $sql = "SELECT category_id,category_name
                FROM categories
                WHERE categories.is_active = '1'";
                $resultCategoryList = $this->productService->getProductsQuery($sql);
                unset($sql);
                
                $sql = "SELECT brand_id,brand_name
                FROM brands
                WHERE brands.is_active = '1'";
                $resultBrandList = $this->productService->getProductsQuery($sql);
                unset($sql);

                $this->view("internalManager", [
                    "Page" => "AdvertisementManager",
                    "Title" => "Quảng cáo",
                    "BannerList" => $bannerList,
                    "BannerLocationList" => $locationList,
                    "FeaturedRowList"=>$featuredRowList,
                    "ProductList"=>$resultProductList,
                    "CategoryList"=>$resultCategoryList,
                    "BrandList"=>$resultBrandList,
                    "URLParams"=>$urlParams
                ]);

                unset($bannerList);
                unset($locationList);
                unset($featuredRowList);
                unset($urlParams);
                unset($resultProductList);
                unset($resultBrandList);
                unset($resultCategoryList);
            }else{
                header('Location: ../SignIn/SayHi');
            }
        }

        public function AdvertisementGetMoreProducts(){
            $urlParams = $this->DecodeURL();

            // $resultProductList = $this->productService->GetFilteredProducts($urlParams,"","", "", "products.product_id ASC");

            $resultProductList = $this->productService->GetFilteredProducts($urlParams,
                " DISTINCT products.product_id, products.product_name, products.description, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id, products.created_at, products.updated_at",
                " join skus on skus.product_id = products.product_id",
                "",
                "products.product_id ASC"
            );

            ob_start();
            $productList = $resultProductList["ProductList"];
            include("./MVC/Views/Pages/Manager/AdvertisementManager/productPrint.php");
            $htmlData=ob_get_contents();
            unset($productList); 
            ob_end_clean();

            $responseData = [
                "ProductsHTML"=>$htmlData,
                "StatusData"=>["IsLast"=>$resultProductList["IsLast"]]
            ];
            header('Content-Type: application/json');
            echo json_encode($responseData);
        }

        public function Logout(){
            session_start();
            // Hủy tất cả các biến session
            session_unset();
            // Hủy toàn bộ session
            session_destroy();
            // Chuyển hướng người dùng về trang đăng nhập
            header('Location: ../SignIn/SayHi');
        }
        public function GetAllDataHome(){// lấy ra các thông số cơ bản
            $cardValue = array(
                "countProduct" => $this->productService->getQuantityAllProduct(),
                "countCustomer" => $this->customerService->getQuantityAllCustomer(),
                "countOrder" => $this->orderService->getQuantityAllOrder(),
                "countStaff" => $this->staffService->getQuantityAllStaff()
            );     
            $data = array("cardValue" => $cardValue);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);    
        }
        public function GetAllDataStaff(){
            $cardValue = array(
                "countSaleStaff" => $this->staffService->getQuantityStaffByRole(3),
                "countWarehouseStaff" => $this->staffService->getQuantityStaffByRole(4),
                "countStoreManager" => $this->staffService->getQuantityStaffByRole(2),
                "countAdmin" => $this->staffService->getQuantityStaffByRole(1)
            );
            $infoStaff = $this->staffService->getInfoStaff();
            $roleStaff = $this->roleService->GetAllRoleStaff();
            $data = array("cardValue" => $cardValue, "infoStaff" => $infoStaff, "roleStaff" => $roleStaff);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }
        public function GetPage(){
            $uri = parse_url($_SERVER['REQUEST_URI']);

            $urlParams = null;
            if(isset($uri["query"])){            
                parse_str(urldecode($uri["query"]),$urlParams);
            }
            if(isset($urlParams["action"])){
                $action = $urlParams["action"];
                header("Content-Type: text/html");
                echo file_get_contents("./MVC/Views/pages/Manager/ProductManagers/$action.php");
            }
            else{
                header("Location: ../InternalManager/HomeManager");
            }
        }

        public function GetAllDataCustomer(){
            $cardValue = array(
                "countAllCustomer" => $this->customerService->getQuantityAllCustomer(),
                "countMaleCustomer" => $this->customerService->getQuantityMaleCustomer(),
                "countFemaleCustomer" => $this->customerService->getQuantityFemaleCustomer(),
                "averageAgeCustomer" => $this->customerService->calculateAverageAgeCustomer()
            );
            $infoCustomer = $this->customerService->getInfoCustomer();
            $data = array("cardValue" => $cardValue, "infoCustomer" => $infoCustomer);  
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }

        public function GetAllDataSupplier(){
            $infoSupplier = $this->supplierService->getAllSupplier();
            $data = array("infoSupplier" => $infoSupplier);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }

        public function GetAllDataAccount(){
            $cardValue = array(
                "countAllAccount" => $this->accountService->getQuantityAllAccount(),
                "countStaffAccount" => $this->accountService->getQuantityStaffAccount(),
                "countCustomerAccount" => $this->accountService->getQuantityCustomerAccount(),
                "countBlockedAccount" => $this->accountService->getQuantityAccountBlocked()
            );
            $infoAccount = $this->accountService->getAccountStaffCustomer();
            $allRole = $this->roleService->getAllRole();
            $data = array("cardValue" => $cardValue, "infoAccount" => $infoAccount, "allRole" => $allRole);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }
        public function GetAllDataDecentralization(){
            $moduleNames = $this->decentralizationService->getAllModule();
            $roleNames = $this->decentralizationService->getAllRole();
            $data = array("modules" => $moduleNames, "roles" => $roleNames);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }
        public function GetAllDataOrder(){
            $cardValue = array(
                "countPending" => $this->orderService->getQuantityOrderByStatus("Pending"),
                "countProcessing" => $this->orderService->getQuantityOrderByStatus("Processing"),
                "countShipped" => $this->orderService->getQuantityOrderByStatus("Shipped"),
                "countDelivered"=> $this->orderService->getQuantityOrderByStatus("Delivered"),
                "countCancelled" => $this->orderService->getQuantityOrderByStatus("Cancelled")
            );
            $infoOrder = $this->orderService->getInfoOrder();
            $orders = $this->orderService->getOrder1();
            $ordersdetails = $this->orderDetailService->GetOrderDetailByOrderId();
            $productSku = $this->productService->getProductSku();
            // echo var_dump($cardValue);
            $data = array("cardValue" => $cardValue,"orders" => $orders,"infoOrder" => $infoOrder,"productSku" => $productSku,"orders_details"=> $ordersdetails);
            //$data = array("cardValue" => $cardValue, "infoOrder" => $infoOrder,"orders" => $infoOrder1,"productSku" => $productSku);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }
        public function GetAllDataExport(){
            $infoExport = $this->exportService->getInfoExport();
            $exportsdetails = $this->exportDetailService->getExportDetailByExportId();
            $data = array("infoExport" => $infoExport,"exportsdetails" => $exportsdetails);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }
        public function GetAllDataImport(){
            $infoImport = $this->importService->getInfoImport();
            $shipments = $this->shipmentService->GetShipmentlByImportId();
            $suppliers = $this->supplierService->getAllSupplier();
            $categories = $this->categoryService->getAllCategory();
            $brands = $this-> brandService->getAllBrand();
            $productSku = $this->productService->getAllProduct();
            $skus = $this->skuService->getAllSku();
            $data = array("infoImport" => $infoImport,"shipments" => $shipments,"suppliers" => $suppliers,"categories" => $categories,"brands" => $brands,"productSku" => $productSku,"skus" => $skus);
            // $data = array("categories" => $categories);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }
        // public function getAllProductSku(){
        //     $productSku = $this->productService->getProductSku();
        //     // echo var_dump($cardValue);
        //     $data = array( "productSku" => $productSku);
        //     header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
        //     echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        // }
        public function GetAllDataAttendance(){
            $attendanceData = $this->attendanceService->getAllDataAttendance();
            $data = array("attendances" => $attendanceData);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }
        public function GetAllDataLeaveApplication(){
            $leaveApplicationData = $this->leaveApplicationService->getAllLeaveApplication();
            $data = array("leaveApplications" => $leaveApplicationData);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }
        public function GetAllDataPersonalInfoStaff($account_id, $staff_id){
            $personalInfoStaff = $this->staffService->getInfoStaffById($account_id);
            $selfSalary = $this->timesheetDetailService->GetSalaryByStaffId($staff_id);
            $data = array("personalInfoStaff" => $personalInfoStaff, "selfSalary" => $selfSalary);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }

        public function GetAllDataSalary(){
            $salaryData = $this->timesheetDetailService->getSalaryTable();
            $allMonth = $this->timesheetDetailService->getAllMonth();
            $allYear = $this->timesheetDetailService->getAllYear();
            $data = array("salaryData" => $salaryData, "allMonth" => $allMonth, "allYear" => $allYear);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }

        public function GetAllDataTimesheet(){
            $timesheetData = $this->timesheetDetailService->getAllDataTimesheet();
            $allMonth = $this->timesheetDetailService->getAllMonth();
            $allYear = $this->timesheetDetailService->getAllYear();
            $data = array("timesheetData" => $timesheetData, "allMonth" => $allMonth, "allYear" => $allYear);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }

       public function UpdateStatus(){
            $attendance_id = $_POST['attendance_id'];
            $status = $_POST['status'];
            $this->attendanceService->updateStatus($attendance_id, $status);
       }

       public function GetAllDataContract(){
            $contractData = $this->contractService->getAllDataContract();
            $data = array("contractData" => $contractData);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
       }

       public function GetAllDataBusinessSituation(){
            $revenueAllProduct = $this->orderService->getAllDataStatistic();
            $data = array("revenueAllProduct" => $revenueAllProduct);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
       }
    }
 