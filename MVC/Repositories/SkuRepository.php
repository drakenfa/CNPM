<?php
    class SkuRepository extends DB{
        public function createSku($sku){
            $this->create("skus", $sku, "sku_id");
        }

        public function updateSku($sku, $id){// by id
            $this->update("skus", $sku, "sku_id = ".$id);
        }

        public function deleteSku($id){// by id
            $this->delete("skus", "sku_id = ".$id);
        }

        public function getAllSku(){
            return $this->read("skus");
        }
        
        public function getSkuById($id){
            return $this->getAllByWhere("skus", "sku_id = ".$id);
        }
    }
?>