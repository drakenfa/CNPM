<?php
    class Shopcart extends Controller{// Có thể hiểu class Controller thông qua bridge.php 
        public $productService;

        public function __construct(){
            $this->productService = $this->service("ProductService");
        }
        public function getAllProduct(){
            $this->productService->getAllProduct();
        }
        public function getQuantityAllProduct(){
            return $this->productService->getQuantityAllProduct();
        }
        // public function SayHi(){
        //     $this->view("pages/Shopcart/shopcart");
        // }
        public function SayHi(){
            $this->view("master",[
                "Page" => "Shopcart/Shopcart",
            ]);            
        }        
        public function getAllProductSku(){
            $productSku = $this->productService->getProductSku2();
            $data = array( "productSku" => $productSku);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }

    }
?>