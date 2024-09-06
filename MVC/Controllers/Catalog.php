<?php
    class Catalog extends Controller{
        public $productService;

        public function __construct(){
            $this->productService = $this->service("ProductService");
        }
        
        private function ProcessPriceRange($urlParams){
            $filterQueries = "";
            if(isset($urlParams["categories"])){
                $queryItems = explode(",",$urlParams["categories"]);
                $filterQueries.=" AND products.category_id IN (".implode(",",$queryItems).")";
            }

            if(isset($urlParams["brands"])){
                $queryItems = explode(",",$urlParams["brands"]);
                $filterQueries.=" AND products.brand_id IN (".implode(",",$queryItems).")";
            }
            
            $searchQueries = "";
            if(isset($urlParams["search-query"])){
                $searchValue = $urlParams["search-query"];
                $searchQueries.=" AND products.product_name LIKE '%{$searchValue}%'";
            }

            //query price range
            $priceRangeSQLQuery = "SELECT max(products.price) as maxPrice, min(products.price) as minPrice 
                FROM products join brands on products.brand_id = brands.brand_id join categories on products.category_id = categories.category_id
                WHERE products.is_active = 1 $filterQueries $searchQueries
                ORDER BY products.updated_at DESC";
                
            $priceRangeValue = $this->productService->GetProductsQuery($priceRangeSQLQuery)[0];
            
            $priceRangeValue["maxPrice"] = ceil($priceRangeValue["maxPrice"] / 500000) * 500000;
            unset($priceRangeSQLQuery);
            unset($filterQueries);
            unset($searchQueries);

            return $priceRangeValue;
        }

        private function ProcessFilterOptions($urlParams){
            $filterOptions = [];

            $searchQueries = "";
            if(isset($urlParams["search-query"])){
                $searchValue = $urlParams["search-query"];
                $searchQueries.=" AND products.product_name LIKE '%{$searchValue}%'";
            }


            //loc categories
            if((isset($urlParams["context"]) && $urlParams["context"]!="categories") || !isset($urlParams["context"])){
                $filterQueries = "";



                if(isset($urlParams["context"])){
                    $value = $urlParams["context-value"];
                    $filterQueries.= " OR products.brand_id = $value";
                    unset($value);
                }
                else{
                    if(isset($urlParams["brands"])){
                        $queryItems = explode(",",$urlParams["brands"]);
                        if(count($queryItems)>0){
                            $filterQueries.="AND products.brand_id IN (".implode(",",$queryItems).")";
                        }
                    }
    
                    if(isset($urlParams["categories"])){
                        $queryItems = explode(",",$urlParams["categories"]);
                        if(count($queryItems)>0){
                            $filterQueries.=" OR products.category_id IN (".implode(",",$queryItems).")";
                        }
                    }
                }
                
                // if($filterQueries!=""){
                //     $filterQueries = " AND $filterQueries";
                // }

                $sqlQuery = "SELECT DISTINCT categories.category_id as opt_id, categories.category_name as opt_name
                FROM categories join products on products.category_id = categories.category_id
                WHERE categories.is_active = 1 $searchQueries $filterQueries
                ORDER BY categories.category_name ASC
                ";
                $result = $this->productService->productRepo->get($sqlQuery);
                unset($sqlQuery);
                if(count($result)>0){
                    array_push($filterOptions,[
                        "name"=>"Loại sản phẩm",
                        "id"=>"categories",
                        "values"=>$result
                    ]
                    );
                }
                unset($filterQueries);
            }

            //loc brands
            if((isset($urlParams["context"]) && $urlParams["context"]!="brands") || !isset($urlParams["context"])){
                $filterQueries = "";

                if(isset($urlParams["context"])){
                    $value = $urlParams["context-value"];
                    $filterQueries.= " AND products.category_id = $value";
                    unset($value);
                }
                else{
                    if(isset($urlParams["categories"])){
                        $queryItems = explode(",",$urlParams["categories"]);
                        
                        if(count($queryItems)>0){
                            $filterQueries.=" AND products.category_id IN (".implode(",",$queryItems).")";
                        }
                    }
    
                    if(isset($urlParams["brands"])){
                        $queryItems = explode(",",$urlParams["brands"]);
                        if(count($queryItems)>0){
                            $filterQueries.=" OR brands.brand_id IN (".implode(",",$queryItems).")";
                        }
                    }
                }
                
                $sqlQuery = "SELECT DISTINCT brands.brand_id as opt_id, brands.brand_name as opt_name
                FROM brands join products on products.brand_id = brands.brand_id
                WHERE brands.is_active = 1 $searchQueries $filterQueries
                ORDER BY brands.brand_name ASC
                ";

                $result = $this->productService->productRepo->get($sqlQuery);
                unset($sqlQuery);
                unset($filterQueries);
                if(count($result)>0){
                    array_push($filterOptions,[
                        "name"=>"Hãng sản xuất",
                        "id"=>"brands",
                        "values"=>$result
                    ]
                    );
                }
                unset($filterQueries);
            }
            return $filterOptions;
        }

        public function DecodeURL(){
            $uri = parse_url($_SERVER['REQUEST_URI']);

            $urlParams = null;
            if(isset($uri["query"])){            
                parse_str(urldecode($uri["query"]),$urlParams);
            }
            return $urlParams;
        }

        public function SayHi(){
            $urlParams = $this->DecodeURL();
            
            $resultProductList = $this->productService->GetFilteredProducts($urlParams,
                " DISTINCT products.product_id, products.product_name, products.description, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id, products.created_at, products.updated_at",
                " join skus on skus.product_id = products.product_id"
            );
            $resultFilterElements = $this->ProcessFilterOptions($urlParams);
            $priceRangeValue = $this->ProcessPriceRange($urlParams);

            $message = "Danh mục sản phẩm";
            if(isset($urlParams["search-query"])){
                $name = $urlParams["search-query"];
                $message="Kết quả tìm kiếm cho $name";
                unset($name);
            }

            $this->view("master",[
                "Page" => "Catalog/Catalog",
                "ProductList"=>$resultProductList,
                "FilterElements"=>$resultFilterElements,
                "URLParams"=>$urlParams,
                "PriceRange"=>$priceRangeValue,
                "Message"=>$message
            ]);
        }

        public function Category(){
            $urlParams = $this->DecodeURL();
            if(isset($urlParams["context"]) && isset($urlParams["context-value"])){
                $context = $urlParams["context"];
                $contextValue = $urlParams["context-value"];
                
                $otherQueries = "";

                if($context == "categories"){
                    $contextName = $this->productService->productRepo->get("SELECT categories.category_name FROM categories WHERE categories.category_id = $contextValue")[0]["category_name"];
                    $message = "Danh sách $contextName";
                    $otherQueries = " products.category_id = $contextValue";
                }
                else if($context == "brands"){
                    $contextName = $this->productService->productRepo->get("SELECT brands.brand_name FROM brands WHERE brands.brand_id = $contextValue")[0]["brand_name"];
                    $message = "Sản phẩm $contextName";
                    $otherQueries = " products.brand_id = $contextValue";
                }
                
                $resultProductList = $this->productService->GetFilteredProducts($urlParams,"","",$otherQueries);
                $resultFilterElements = $this->ProcessFilterOptions($urlParams);
                $priceRangeValue = $this->ProcessPriceRange($urlParams);

                unset($otherQueries);


                $this->view("master",[
                    "Page" => "Catalog/Catalog",
                    "ProductList"=>$resultProductList,
                    "FilterElements"=>$resultFilterElements,
                    "URLParams"=>$urlParams,
                    "PriceRange"=>$priceRangeValue,
                    "Message"=>$message
                ]);
            }
            else{
                header("Location: ../Catalog/");
            }
        }

        public function GetMoreProducts(){
            $urlParams = $this->DecodeURL();

            $resultProductList = $this->productService->GetFilteredProducts($urlParams,
                " DISTINCT products.product_id, products.product_name, products.description, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id, products.created_at, products.updated_at",
                " join skus on skus.product_id = products.product_id"
            );

            ob_start();
            $productList = $resultProductList["ProductList"];
            include('./MVC/Views/pages/Catalog/ProductPrint.php');
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
    }
?>