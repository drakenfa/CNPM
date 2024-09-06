<?php
    require_once "./MVC/Models/ProductImageModel.php";
    class ProductImageService extends Service{
        public $productImageRepo;

        public function __construct(){
            $this->productImageRepo = $this->repository("ProductImageRepository");
        }
        
        public function createProductImage(){//$productImageDTO
            $productImage = new ProductImageModel("1", "anh.png");
            $this->productImageRepo->createProductImage($productImage);
        }

        public function updateProductImage(){// by id (truyền DTO)
            $productImageData = $this->productImageRepo->getProductImageById("1");
            extract($productImageData);// gán các giá trị cho các key tương ứng với các biến
            $productImage = new ProductImageModel(
                $product_id, "anh.jpg", $product_image_id
            );
            $this->productImageRepo->updateProductImage($productImage, "1");
        }

        public function deleteProductImage(){
            $id = "1";
            $this->productImageRepo->deleteProductImage($id);
        }

        public function getAllProductImage(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productImageRepo->getAllProductImage(), JSON_UNESCAPED_UNICODE);
        }

        public function getProductImageById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->productImageRepo->getProductImageById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>