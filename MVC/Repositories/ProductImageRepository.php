<?php
    class ProductImageRepository extends DB{
        public function createProductImage($productImage){
            $this->create("product_images", $productImage, "product_image_id");
        }

        public function updateProductImage($productImage, $id){// by id
            $this->update("product_images", $productImage, "product_image_id = ".$id);
        }

        public function deleteProductImage($id){// by id
            $this->realDelete("product_images", "product_image_id = ".$id);
        }

        public function getAllProductImage(){
            return $this->readDontHaveIsActive("product_images");
        }
        
        public function getProductImageById($id){
            return $this->getAllDontHaveIsActive("product_images", "product_image_id = ".$id);
        }
    }
?>