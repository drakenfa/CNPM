<?php
    class ProductDescription extends Controller{// Có thể hiểu class Controller thông qua bridge.php 
        public $productService;

        public function __construct(){
            $this->productService = $this->service("ProductService");
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
            $id = $urlParams["id"];
            if(!isset($id)){
                header("Location: ../Home/");
            }

            $sqlQuery="SELECT products.product_id, products.product_name, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id,products.total_reviews
            FROM products join brands on products.brand_id = brands.brand_id join categories on products.category_id = categories.category_id
            where product_id = $id";
            $product = $this->productService->productRepo->get($sqlQuery)[0];


            
            $sqlQuery = "SELECT * 
            FROM product_images
            WHERE product_images.product_id = $id";
            
            $productImages =  $this->productService->productRepo->get($sqlQuery);

            
            $sqlQuery = "SELECT skus.sku_id, skus.sku_code, skus.sku_name, IFNULL(SUM(shipments.remain), 0) AS remain
            FROM skus LEFT OUTER JOIN shipments on skus.sku_id = shipments.sku_id
            WHERE skus.product_id = $id
            GROUP BY skus.sku_id
            ";

            
            $productSkus =  $this->productService->productRepo->get($sqlQuery);

            
            $sqlQuery = "SELECT options.option_name, options.option_value
            FROM options
            WHERE options.product_id = $id
            ";

            
            $productOptions =  $this->productService->productRepo->get($sqlQuery);

            
            $sqlQuery = "SELECT customers.customer_fullname, reviews.rating, reviews.comment, reviews.review_date, accounts.avatar
            FROM reviews join customers on reviews.customer_id = customers.customer_id join accounts on customers.account_id = accounts.account_id
            WHERE reviews.product_id = $id and reviews.is_active = 1
            ";

            
            $productReviews =  $this->productService->productRepo->get($sqlQuery);


            $category_id=$product["category_id"];
            
            $sqlQuery = "SELECT products.product_id, products.product_name, categories.category_name, brands.brand_name, products.price, products.description, products.thumbnail, products.guarantee, products.average_rating, categories.category_id, brands.brand_id
            FROM products join brands on products.brand_id = brands.brand_id join categories on products.category_id = categories.category_id
            WHERE products.is_active = 1 and products.category_id = $category_id and products.product_id!=$id
            LIMIT 12;";
            
            $similarProductList =  $this->productService->productRepo->get($sqlQuery);
            

            $hasReviewed = false;
            $hasOrdered = false;
            $isLoggedIn = isset($_SESSION["logged_in_customer"]) && isset($_SESSION["logged_in_account"]);
            if($isLoggedIn){
                $loggedInCustomerID = $_SESSION["logged_in_customer"]["customer_id"];
                $loggedInAccountID = $_SESSION["logged_in_customer"]["account_id"];
                if(count($this->productService->productRepo->get("SELECT reviews.customer_id FROM reviews where reviews.customer_id =$loggedInCustomerID AND reviews.product_id = $id"))>0){
                    $hasReviewed = true;
                }

                $sql = "SELECT orders.order_id 
                FROM orders join order_details on orders.order_id = order_details.order_id 
                join skus on order_details.sku_id = skus.sku_id 
                where orders.account_id =  $loggedInAccountID AND skus.product_id = $id";
                if(count($this->productService->productRepo->get($sql))>0){
                    $hasOrdered = true;
                }
                else{
                    $hasOrdered = false;
                }
                unset($sql);
            }

            $this->view("master",[
                "Page" => "ProductDescription/ProductDescription",
                "Product" => $product,
                "ProductImages" => $productImages,
                "ProductSkus" => $productSkus,
                "ProductOptions" => $productOptions,
                "ProductReviews" => $productReviews,
                "SimilarProductList" => $similarProductList,
                "IsLoggedIn" => $isLoggedIn,
                "HasReviewed" => $hasReviewed,
                "HasOrdered" => $hasOrdered
            ]);
            
            unset($sqlQuery);
            unset($product);
            unset($id);
        }

        public function SendReview(){
            $isLoggedIn = isset($_SESSION["logged_in_customer"]) && isset($_SESSION["logged_in_account"]);
            if($isLoggedIn){
                $loggedInCustomerID = $_SESSION["logged_in_customer"]["customer_id"];
                $loggedInAccountID = $_SESSION["logged_in_customer"]["account_id"];
                
                $productId = $_POST["product_id"];
                $comment = $_POST["comment"];
                $rating = $_POST["rating"];

                
                $sql = "SELECT orders.order_id 
                FROM orders join order_details on orders.order_id = order_details.order_id 
                    join skus on order_details.sku_id = skus.sku_id 
                where orders.account_id =  $loggedInAccountID AND skus.product_id = $productId";

                if(count($this->productService->productRepo->get("SELECT reviews.customer_id FROM reviews where reviews.customer_id =$loggedInCustomerID AND reviews.product_id = $productId"))>0){
                    echo json_encode(["status"=>"had_reviewed"]);
                    return;
                }
                else if(!count($this->productService->productRepo->get($sql))>0){
                    echo json_encode(["status"=>"not_ordered"]);
                    return;
                }
                unset($sql);
            }
            else{
                echo json_encode(["status"=>"not_signed_in"]);
                return;    
            }


            $hasOrdered = true;

            
            $sql = "INSERT INTO reviews(reviews.customer_id,reviews.comment,reviews.rating,reviews.product_id) VALUES ($loggedInCustomerID,'$comment',$rating,$productId)";
            $this->productService->productRepo->set($sql);
            unset($sql);
            
            echo json_encode(["status"=>"success"]);
            return;
        }

    }
?>