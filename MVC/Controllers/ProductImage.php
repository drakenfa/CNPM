<?php
    class ProductImage extends Controller{
        public $productImageService;
        public function __construct(){
            $this->productImageService = $this->service("ProductImageService");
        }
        public function CreateProductImage(){
            $this->productImageService->createProductImage();
        }
        public function UpdateProductImage(){
            $this->productImageService->updateProductImage();
        }
        public function DeleteProductImage(){
            $this->productImageService->deleteProductImage();
        }
        public function GetAllProductImage(){
            $this->productImageService->getAllProductImage();
        }
        public function GetProductImageById(){
            $this->productImageService->GetProductImageById();
        }
    }
?>