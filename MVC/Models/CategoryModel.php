<?php
    class CategoryModel{
        private $category_id;
        private $category_name;
        private $category_logo;
        private $is_active;

        public function __construct($category_name, $category_logo, $category_id = null, $is_active = null){
            $this->category_id = $category_id;
            $this->category_name = $category_name;
            $this->category_logo = $category_logo;
            $this->is_active = $is_active;
        }
        public function getCategoryId(){
            return $this->category_id;
        }
        public function setCategoryId($category_id){
            $this->category_id = $category_id;
        }
        public function getCategoryName(){
            return $this->category_name;
        }
        public function setCategoryName($category_name){
            $this->category_name = $category_name;
        }
        public function getCategoryLogo(){
            return $this->category_logo;
        }
        public function setCategoryLogo($category_logo){
            $this->category_logo = $category_logo;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'category_id' => $this->category_id,
                'category_name' => $this->category_name,
                'category_logo' => $this->category_logo,
                'is_active' => $this->is_active
            );
        }
    }
?>