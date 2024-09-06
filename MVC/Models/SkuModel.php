<?php
    class SkuModel{
        private $sku_code;
        private $sku_name;
        private $product_id;
        private $sku_id;
        private $is_active;
        public function __construct($sku_code, $sku_name, $product_id, $sku_id = null, $is_active = null)
        {
            $this->sku_code = $sku_code;
            $this->sku_name = $sku_name;
            $this->product_id = $product_id;
            $this->sku_id = $sku_id;
            $this->is_active = $is_active;
        }
        public function getSkuCode(){
            return $this->sku_code;
        }
    
        public function setSkuCode($sku_code){
            $this->sku_code = $sku_code;
        }
    
        public function getProductId(){
            return $this->product_id;
        }
    
        public function setProductId($product_id){
            $this->product_id = $product_id;
        }
    
        public function getSkuId(){
            return $this->sku_id;
        }
    
        public function setSkuId($sku_id){
            $this->sku_id = $sku_id;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'sku_id' => $this->sku_id,
                'sku_code' => $this->sku_code,
                'sku_name' => $this->sku_name,
                'product_id' => $this->product_id,
                'is_active' => $this->is_active
            );
        }
    }
?>