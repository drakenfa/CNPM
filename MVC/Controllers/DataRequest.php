<?php
    class DataRequest extends Controller{
        public $productService;
        public function __construct(){
            $this->productService = $this->service("ProductService");
        }

        public function GetProductSKUs(){
            $productID = $_POST["product_id"];
            $sql = "SELECT skus.sku_id, skus.sku_code, skus.sku_name
                FROM skus
                WHERE skus.product_id = $productID and skus.is_active = '1'
                ORDER BY skus.sku_name;
            ";

            $resultData = $this->productService->productRepo->get($sql);
            $skuList = $resultData;
            include("./MVC/Views/pages/Manager/ProductManagers/skuListRender.php");
            unset($skuList);
            unset($productID);
        }

        public function GetProductShipments(){
            $productID = $_POST["product_id"];
            $skuID = $_POST["sku_id"];
            $sql = "SELECT imports.import_id, imports.import_date, shipments.shipment_id, shipments.quantity, shipments.remain
                FROM imports join shipments on imports.import_id = shipments.import_id join skus on shipments.sku_id = skus.sku_id
                WHERE skus.product_id = $productID and shipments.sku_id = $skuID and shipments.is_active = '1' and shipments.remain > 0
                ORDER BY imports.import_id;
            ";

            $resultData = $this->productService->productRepo->get($sql);
            $importList = $resultData;
            include("./MVC/Views/pages/Manager/WarehouseManager/importPrint.php");
            unset($importList);
            unset($productID);
        }

        public function GetProductImages(){
            $productID = $_POST["product_id"];
            $sql = "SELECT product_images.product_image_id, product_images.product_id, product_images.image_url
                FROM product_images
                WHERE product_images.product_id = $productID
                ORDER BY product_images.image_url;
            ";

            $resultData = $this->productService->productRepo->get($sql);
            $productImageList = $resultData;

            include("./MVC/Views/pages/Manager/ProductManagers/productImageRender.php");
            unset($productImageList);
            unset($productID);
        }

        public function GetProductOptions(){
            $productID = $_POST["product_id"];
            $sql = "SELECT options.option_id, options.product_id, options.option_name, options.option_value
                FROM options
                WHERE options.product_id = $productID and options.is_active = '1';
            ";

            $resultData = $this->productService->productRepo->get($sql);
            $optionList = $resultData;

            include("./MVC/Views/pages/Manager/ProductManagers/productOptionRender.php");
            unset($optionList);
            unset($productID);
        }

        public function GetFeaturedRowsData(){
            $rowID = $_POST["row_id"];
            $sql = "SELECT products.product_id, products.product_name
                FROM products join featured_products on products.product_id = featured_products.product_id
                WHERE featured_products.featured_row = $rowID;
            ";

            $resultData = $this->productService->productRepo->get($sql);
            $productList = $resultData;

            include("./MVC/Views/pages/Manager/AdvertisementManager/productFeaturedPrint.php");
            unset($productList);
            unset($rowID);
        }

        public function Add(){
            $table = $_POST["table"];

            $arrayKeys = [];
            $arrayValues= [];
            foreach (array_keys($_POST) as $key){
                if($key != "table"){
                    array_push($arrayKeys,$table.".".$key);
                    array_push($arrayValues,"'".$_POST["$key"]."'");
                }
            }

            foreach (array_keys($_FILES) as $key){
                $imgPath = $_FILES["$key"]["full_path"];
                $imgData = file_get_contents($_FILES["$key"]["tmp_name"]);
                
                $fileNameSep = strrpos($imgPath, '/'); 
                $imgDir = [substr($imgPath, 0, $fileNameSep),substr($imgPath, $fileNameSep + 1)];

                if($table=="accounts"){
                    $storePath = "./Public/img/".$imgDir[0]."/";
                }
                else if($table == "banners"){
                    $storePath = "./Public/img/".$imgDir[0]."/";
                }
                else{
                    $storePath = "./Public/img/products/".$imgDir[0]."/";    
                }

                $fileNameInfo = explode(".",$imgDir[1]);
                if (!is_dir($storePath)) {
                    mkdir($storePath);
                }
                $newPathDir = $fileNameInfo[0].".".$fileNameInfo[1];
                $count = 1;
                while(file_exists($storePath.$newPathDir)){
                    $newPathDir = $fileNameInfo[0]."$count.".$fileNameInfo[1];
                    $count++;
                }
                
                file_put_contents($storePath.$newPathDir, $imgData);

                array_push($arrayKeys,$key);
                array_push($arrayValues,"'".$imgDir[0]."/$newPathDir'");

                unset($newPathDir);
                unset($fileNameInfo);
                unset($count);
                unset($imgData);
                unset($imgPath);
                unset($imgDir);
                unset($storePath);
                unset($fileNameSep);
            }

            $sql = "INSERT INTO $table(".implode(",",$arrayKeys).") VALUES(".implode(",",$arrayValues).")";
            $this->productService->productRepo->set($sql);
            
            echo(json_encode(["status"=>"success"]));
            unset($updateKeys);
            unset($table);
        }

        public function updateFeaturedProducts(){
            $featuredRow = $_POST["featured_row"];
            $addProductIdList = json_decode($_POST["product_id_list"]);
            
            $sql = "SELECT product_id FROM featured_products WHERE featured_products.featured_row = $featuredRow";
            $removeProductIdList = $this->productService->productRepo->get($sql);
            $removeProductIdList = array_column($removeProductIdList,"product_id");

            // echo(var_dump($addProductIdList));
            // echo(var_dump($removeProductIdList));
            $temp = $addProductIdList;
            for ($i = 0; $i < count($temp); $i++){
                $keyIndex = array_search($addProductIdList[$i],$removeProductIdList);
                if(!($keyIndex===false)){
                    unset($removeProductIdList[$keyIndex]);
                    unset($addProductIdList[$i]);
                }
            }

            // echo(var_dump($addProductIdList));
            // echo(var_dump($removeProductIdList));

            if(count($addProductIdList)>0){
                $insertPairs = [];
                foreach ($addProductIdList as $productID){
                    array_push($insertPairs,"('$featuredRow','$productID')");   
                }
                // echo(var_dump($insertPairs));
                $insertPairs = implode(",",$insertPairs);
                $sql = "INSERT INTO featured_products(featured_row,product_id) VALUES$insertPairs";
                // echo($sql);
                $this->productService->productRepo->set($sql);
                unset($insertPairs);
                unset($sql);
            }

            if(count($removeProductIdList)>0){
                $deletePairs = "(".implode(",",$removeProductIdList).")";
                // echo(var_dump($deletePairs));
                $sql = "DELETE FROM featured_products WHERE featured_row = $featuredRow and product_id in $deletePairs";
                // echo($sql);

                $this->productService->productRepo->set($sql);
                unset($deletePairs);
                unset($sql);
            }
            unset($addProductIdList);
            unset($removeProductIdList);
            unset($temp);

            echo(json_encode(["status"=>"success"]));
        }

        public function Update(){
            $table = $_POST["table"];
            $tableKey = $_POST["table_id"];

            $sql = "UPDATE $table SET ";

            $updateKeys = [];
            foreach (array_keys($_POST) as $key){
                if($key != "table" && $key !="table_id" && $key != $tableKey){
                    $value = $_POST["$key"];
                    array_push($updateKeys,"$table.$key = '$value'");
                    unset($value);
                }
            }
            foreach (array_keys($_FILES) as $key){
                //delete
                $deleteSQL = "SELECT $table.$key FROM $table where $table.$tableKey = ".$_POST["$tableKey"];
                $filePath = $this->productService->productRepo->get($deleteSQL);
                
                $filePath = $filePath[0][$key];
                if($filePath!=""){
                    if($table=="accounts"){
                        $deletePath = "./Public/img/$filePath";
                    }
                    else if($table == "banners"){
                        $deletePath = "./Public/img/$filePath";
                    }
                    else{
                        $deletePath = "./Public/img/products/$filePath";
                    }
                    if(file_exists($deletePath)){
                        unlink($deletePath);
                    }
                }

                $imgPath = $_FILES["$key"]["full_path"];
                $imgData = file_get_contents($_FILES["$key"]["tmp_name"]);
                
                $fileNameSep = strrpos($imgPath, '/'); 
                $imgDir = [substr($imgPath, 0, $fileNameSep),substr($imgPath, $fileNameSep + 1)];
                
                if($table=="accounts"){
                    $storePath = "./Public/img/".$imgDir[0]."/";
                }
                else if($table == "banners"){
                    $storePath = "./Public/img/".$imgDir[0]."/";
                }
                else{
                    $storePath = "./Public/img/products/".$imgDir[0]."/";
                }
                
                $fileNameInfo = explode(".",$imgDir[1]);
                if (!is_dir($storePath)) {
                    mkdir($storePath);
                }
                $newPathDir = $fileNameInfo[0].".".$fileNameInfo[1];
                $count = 1;
                while(file_exists($storePath.$newPathDir)){
                    $newPathDir = $fileNameInfo[0]."$count.".$fileNameInfo[1];
                    $count++;
                }
                
                file_put_contents($storePath.$newPathDir, $imgData);

                array_push($updateKeys,"$table.$key = '".$imgDir[0]."/$newPathDir'");
                

                unset($newPathDir);
                unset($fileNameInfo);
                unset($count);
                unset($imgData);
                unset($imgPath);
                unset($imgDir);
                unset($storePath);
                unset($fileNameSep);
            }
            $sql .= implode(",",$updateKeys);
            $sql .= " WHERE $table.$tableKey = ".$_POST["$tableKey"];

            $this->productService->productRepo->set($sql);

            echo(json_encode(["status"=>"success"]));
            unset($updateKeys);
            unset($table);
        }

        public $imagePossesionList = [
            //"products"=>["thumbnail"],
            "product_images"=>["image_url"]
        ];
        public function Delete(){
            $table = $_POST["table"];
            $tableKey = $_POST["table_id"];
            $keyValue = $_POST["$tableKey"];
            
            $sql = "UPDATE $table SET $table.is_active = '0' WHERE $table.$tableKey = '$keyValue'";

            $this->productService->productRepo->set($sql);

            echo(json_encode(["status"=>"success"]));
            unset($table);
            unset($tableKey);
            unset($keyValue);
            unset($sql);
        }

        public function TrueDelete(){
            $table = $_POST["table"];
            $tableKey = $_POST["table_id"];
            $keyValue = $_POST["$tableKey"];
            
            if(array_key_exists($table,$this->imagePossesionList)){
                $possesionCols = $this->imagePossesionList["$table"];
                foreach ($possesionCols as $col){
                    $fileDeleteSQL = "SELECT $table.$col from $table WHERE $table.$tableKey = '$keyValue'";
                    $imgPath = $this->productService->productRepo->get($fileDeleteSQL)[0]["$col"];
                    $imgPath = "./Public/img/products/$imgPath";
                    if(file_exists($imgPath)){
                        unlink($imgPath);
                    }
                    unset($fileDeleteSQL);
                    unset($imgPath);
                }
                unset($possesionCols);
            }

            $sql = "DELETE FROM $table WHERE $table.$tableKey = '$keyValue'";

            $this->productService->productRepo->set($sql);

            echo(json_encode(["status"=>"success"]));
            unset($table);
            unset($tableKey);
            unset($keyValue);
            unset($sql);
        }
        
        public function CheckExist(){
            $table = $_POST["table"];
            $tableKey = $_POST["table_id"];
            $keyValue = $_POST["$tableKey"];
            $existColumnName = $_POST["exist_column"];

            $sql = "SELECT * FROM $table WHERE $tableKey = '$keyValue'";

            $ret = $this->productService->productRepo->get($sql);
            // echo(var_dump($ret));
            if(count($ret) > 0){
                echo(json_encode([
                    "status"=>"key_exists",
                    "key_value"=>$ret[0]["$existColumnName"]
                ]));
            }
            else{
                echo(json_encode(["status"=>"success"]));                
            }
            unset($table);
            unset($tableKey);
            unset($keyValue);
            unset($sql);
        }

        public function DeleteImage(){

        }

        public function RefreshSessionData(){
            $accountID = $_SESSION["logged_in_account"]["account_id"];

            $sql = "SELECT * FROM accounts where accounts.account_id = $accountID";
            $account = $this->productService->productRepo->get($sql)[0];

            $sql = "SELECT * FROM customers where customers.account_id = $accountID";
            $customer = $this->productService->productRepo->get($sql)[0];

            $_SESSION["logged_in_account"]=$account;
            $_SESSION["logged_in_customer"]=$customer;

            unset($accountID);
            unset($sql);
            unset($account);
            unset($customer);
        }
    }
?>