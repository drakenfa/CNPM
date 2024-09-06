<?php
        class ProductRepository extends DB{
            public function createProduct($product){
                $this->create("products", $product, "product_id");
            }

            // public function updateProduct($product, $id){// by id
            //     $this->update("products", $product, "product_id = ".$id);
            // }

            public function deleteProduct($id){// by id
                $this->delete("products", "product_id = ".$id);
            }

            public function getAllProduct(){
                return $this->read("products");
            }

            
            public function getProductById($product_id){
                return $this->getAllByWhere("products", "product_id = ".$product_id);
            }

            public function getAllBrandOfProduct(){// lấy ra tất cả thương hiệu của tất cả sản phẩm
                return $this->getAllByDistinct("products", "brand_id", "");
            }

            public function getAllBrandOfProductByCategory($category_id){// lấy ra tất cả thương hiệu của sản phẩm theo loại (dư)
                return $this->getAllByDistinct("products", "brand_id", "category_id = ".$category_id);
            }

            public function getAllProductByCategory($category_id){// lấy ra tất cả sản phẩm theo loại
                return $this->getAllByWhere("products", "category_id = ".$category_id);
            }

            public function getAllProductByBrand($brand_id){// lấy ra tất cả sản phẩm theo thương hiệu
                return $this->getAllByWhere("products", "brand_id = ".$brand_id);
            }

            public function getAllProductByCategoryWithBrand($category_id, $brand_id){// lấy ra tất cả sản phẩm lọc theo loại và thương hiệu
                return $this->getAllByWhere("products", "category_id = ".$category_id." AND brand_id = ".$brand_id);
            }

            public function getBrandLogoByCategory($category_id){// lấy ra tất cả logo thương hiệu theo loại sản phẩm
                return $this->joinTableDistinct("products", "brands", "brand_logo", "brand_id", "category_id = ".$category_id);
            }

            public function getQuantityAllProduct(){// lấy ra số lượng mặt hàng mà cửa hàng đang bán
                return $this->getCountColumn("products", "product_id", "");
            }
            public function joinProductSku(){
                return $this->joinTablesNotWhere("products", "skus","product_id");
            }
            public function joinProductSku2(){
                return $this->read5();
            }
        }
    ?>