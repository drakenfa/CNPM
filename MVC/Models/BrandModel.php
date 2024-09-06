<?php
    class BrandModel{
        private $brand_id;
        private $brand_name;
        private $brand_logo;
        private $supplier_id;
        private $is_active;

        public function __construct($brand_name, $brand_logo, $supplier_id, $brand_id = null, $is_active = null){
            $this->brand_name = $brand_name;
            $this->brand_logo = $brand_logo;
            $this->supplier_id = $supplier_id;
            $this->brand_id = $brand_id;
            $this->is_active = $is_active;
        }
        public function getBrandId(){
            return $this->brand_id;
        }
        public function setBrandId($brand_id){
            $this->brand_id = $brand_id;
        }
        public function getBrandName(){
            return $this->brand_name;
        }
        public function setBrandName($brand_name){
            $this->brand_name = $brand_name;
        }
        public function getBrandLogo(){
            return $this->brand_logo;
        }
        public function setBrandLogo($brand_logo){
            $this->brand_logo = $brand_logo;
        }
        public function getSupplierId(){
            return $this->supplier_id;
        }
        public function setSupplierId($supplier_id){
            $this->supplier_id = $supplier_id;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'brand_id' => $this->brand_id,
                'brand_name' => $this->brand_name,
                'brand_logo' => $this->brand_logo,
                'supplier_id' => $this->supplier_id,
                'is_active' => $this->is_active
            );
        }
    }
?>