<?php
        class BrandRepository extends DB{
            public function createBrand($brand){
                $this->create("brands", $brand, "brand_id");
            }

            // public function updateBrand($brand, $id){// by id
            //     $this->update("brands", $brand, "brand_id = ".$id);
            // }

            public function deleteBrand($id){// by id
                $this->delete("brands", "brand_id = ".$id);
            }

            public function getAllBrand(){
                return $this->read("brands");
            }
            
            public function getBrandById($id){
                return $this->getAllByWhere("brands", "brand_id = ".$id);
            }

            
        }
    ?>