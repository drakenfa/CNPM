<?php
    class Product extends Controller{
        public $productService;
        public function __construct(){
            $this->productService = $this->service("ProductService");
        }
        public function SayHi(){
            $this->view("master",[
                "Page" => "Home"
            ]);
        }
        public function List(){
            $this->view("master",[
                "Page" => "News"
            ]);
        }
        public function CreateProduct(){
            $this->productService->createProduct();
        }
        public function UpdateProduct(){
            $this->productService->updateProduct();
        }
        public function DeleteProduct(){
            $this->productService->deleteProduct();
        }
        public function GetAllProduct(){
            $this->productService->getAllProduct();
        }
        public function GetProductById($product_id){
            $this->productService->GetProductById($product_id);
        }
        public function GetAllBrandOfProduct(){
            $this->productService->getAllBrandOfProduct();
        }
        public function GetAllBrandOfProductByCategory($category_id){
            $this->productService->getAllBrandOfProductByCategory($category_id);
        }
        public function GetAllProductByCategory($category_id){
            $this->productService->getAllProductByCategory($category_id);
        }
        public function GetAllProductByBrand($brand_id){
            $this->productService->getAllProductByBrand($brand_id);
        }
        public function GetAllProductByCategoryWithBrand($category_id, $brand_id){
            $this->productService->getAllProductByCategoryWithBrand($category_id, $brand_id);
        }
        public function GetBrandLogoByCategory($category_id){
            $this->productService->getBrandLogoByCategory($category_id);
        }
        public function GetProductSku(){
            $this->productService->GetProductSku();
        }
    }
?>