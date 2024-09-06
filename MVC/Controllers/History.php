<?php
    class History extends Controller{// Có thể hiểu class Controller thông qua bridge.php 
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
            $ProductLists = [
                "Laptop" => $this->productService->getProductByType('Laptop'),
                "Điện thoại"=> $this->productService->getProductByType('Điện thoại'),
                "Smartwatch"=> $this->productService->getProductByType('Smartwatch'),
                "Sạc dự phòng"=> $this->productService->getProductByType('Sạc dự phòng'),
                "Loa"=> $this->productService->getProductByType('Loa'),
                "Bàn phím"=> $this->productService->getProductByType('Bàn phím'),
            ];
            $this->view("master",[
                "Page" => "History/History",
                "ProductLists" => $ProductLists
            ]);            
        }        
        public function getAllProductSku(){
            $productSku = $this->productService->getProductSku();
            // echo var_dump($cardValue);
            $data = array( "productSku" => $productSku);
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE);   
        }

    }
?>