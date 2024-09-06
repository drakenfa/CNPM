<?php
    require_once "./MVC/Models/ProductModel.php";
    class ProductService extends Service{
        public $productRepo;

        public function __construct(){
            $this->productRepo = $this->repository("ProductRepository");
        }
        
        public function createProduct(){//$productDTO
            $product = new ProductModel("Điện thoại của chó Huy", "1", "1", "15000000", "12");
            $this->productRepo->createProduct($product);
        }

        public function updateProduct(){// by id (truyền DTO)
            $productData = $this->productRepo->getProductById("27");
            extract($productData);// gán các giá trị cho các key tương ứng với các biến
            $product = new ProductModel(
                "Hiển đẹp trai vãi lin", $brand_id, $category_id, $price, $guarantee, $product_id, $thumbnail, $description, $created_at, $updated_at, $is_active// sua lai created_at
            );
            $this->productRepo->updateProduct($product, "27");
        }

        public function deleteProduct(){
            $id = "27";
            $this->productRepo->deleteProduct($id);
        }

        public function getAllProduct(){
            return $this->productRepo->getAllProduct(); 
               }

        public function getQuantityAllProduct(){
            return $this->productRepo->getQuantityAllProduct();
        }

        public function getProductById($product_id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getProductById($product_id), JSON_UNESCAPED_UNICODE);
        }

        public function getProductById2($product_id){
            return $this->productRepo->getProductById($product_id);
        }

        public function getAllBrandOfProduct(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getAllBrandOfProduct(), JSON_UNESCAPED_UNICODE);
        }

        public function getAllBrandOfProductByCategory($category_id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getAllBrandOfProductByCategory($category_id), JSON_UNESCAPED_UNICODE);
        }

        public function getAllProductByCategory($category_id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getAllProductByCategory($category_id), JSON_UNESCAPED_UNICODE);
        }

        public function getAllProductByBrand($brand_id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getAllProductByBrand($brand_id), JSON_UNESCAPED_UNICODE);
        }

        public function getAllProductByCategoryWithBrand($category_id, $brand_id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getAllProductByCategoryWithBrand($category_id, $brand_id), JSON_UNESCAPED_UNICODE);
        }

        public function getBrandLogoByCategory($category_id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productRepo->getBrandLogoByCategory($category_id), JSON_UNESCAPED_UNICODE);
        }
        public function getProductByType($categoryName, $productCount = 20, $index = 0){
            $sql = "SELECT products.product_id, products.product_name, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating
                FROM products join brands on products.brand_id = brands.brand_id join categories on products.category_id = categories.category_id
                WHERE categories.category_name = '$categoryName'
                ORDER BY products.updated_at DESC
                LIMIT $productCount;";

            return $this->productRepo->get($sql);
        }
        public function getProductSku(){
            return $this->productRepo->joinProductSku();
        }
        public function getProductSku2(){
            return $this->productRepo->joinProductSku2();
        }
        public function getProductsQuery($sqlQuery){
            return $this->productRepo->get($sqlQuery);
        }
        
        public function GetFilteredProducts($urlParams,$selectQueries = "",$fromQueries = "", $otherQueries = "", $orderQueries = "", $groupByQueries= ""){
            if($otherQueries!=""){
                $otherQueries = " AND ".$otherQueries;
            }

            $queryCount = 25;
            $index = 0;
            if(isset($urlParams["page"])){
                $index = (int)$urlParams["page"];
            }
            $indexCount = $index*($queryCount-1);

            $filterQueries = "";
            if(isset($urlParams["categories"]) && $urlParams["categories"]!=""){
                $queryItems = explode(",",$urlParams["categories"]);
                $filterQueries.=" AND products.category_id IN (".implode(",",$queryItems).")";
            }

            if(isset($urlParams["brands"]) && $urlParams["brands"]!=""){
                $queryItems = explode(",",$urlParams["brands"]);
                $filterQueries.=" AND products.brand_id IN (".implode(",",$queryItems).")";
            }

            $priceRangeQueries = "";
            if(isset($urlParams["upper-price-range"])){
                $upperPrice = $urlParams["upper-price-range"];
                $priceRangeQueries.=" AND products.price <= $upperPrice";
            }
            if(isset($urlParams["lower-price-range"])){
                $lowerPrice = $urlParams["lower-price-range"];
                $priceRangeQueries.=" AND products.price >= $lowerPrice";
            }
            
            
            $searchQueries = "";
            if(isset($urlParams["search-query"])){
                $searchValue = $urlParams["search-query"];
                $searchQueries.=" AND products.product_name LIKE '%{$searchValue}%'";
            }

            $orderByQueries = "";
            if(isset($urlParams["order-by"])){
                $orderByValue = $urlParams["order-by"];
                if($orderByValue=="product-a-z"){
                    $orderByQueries.="products.product_name ASC,";
                }
                else if($orderByValue=="brand-a-z"){
                    $orderByQueries.="brands.brand_name ASC,";
                }
                else if($orderByValue=="price-asc"){
                    $orderByQueries.="products.price ASC,";
                }
                else if($orderByValue=="price-desc"){
                    $orderByQueries.="products.price DESC,";
                }
                // else if($orderByValue=="updated-at-desc"){
                //     $orderByQueries.="products.updated_at DESC,";
                // }
                // else if($orderByValue=="updated-at-asc"){
                //     $orderByQueries.="products.updated_at asc,";
                // }
            }
            if($orderQueries!=""){
                $orderQueries.=",";
            }
            
            if($selectQueries == ""){
                $selectQueries = "products.product_id, products.product_name, products.description, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id, products.created_at, products.updated_at";
            }
            
            if($fromQueries == ""){
                $fromQueries = " ".$fromQueries;
            }

            if($groupByQueries!=""){
                $groupByQueries = " GROUP BY $groupByQueries";
            }

            $sqlQuery = "SELECT $selectQueries 
            FROM products join brands on products.brand_id = brands.brand_id join categories on products.category_id = categories.category_id
            $fromQueries
            WHERE products.is_active = 1 $filterQueries $searchQueries $priceRangeQueries 
            $otherQueries
            $groupByQueries
            ORDER BY $orderByQueries $orderQueries products.updated_at DESC
            LIMIT $indexCount,$queryCount";
            

            $resultList =  $this->GetProductsQuery($sqlQuery);
            unset($sqlQuery);
            unset($filterQueries);
            unset($searchQueries);
            unset($selectQueries);
            unset($groupByQueries);
            unset($fromQueries);
            $isLast = true;
            if(count($resultList)==$queryCount){
                $isLast = false;
                unset($resultList[24]);
            }
            
            return [
                "ProductList"=>$resultList,
                "IsLast"=>$isLast
            ];
        }
    }
?>