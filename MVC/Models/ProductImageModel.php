<?php
    class ProductImageModel{
        private $product_id;
        private $image_url;
        private $product_image_id;
        public function __construct($product_id, $image_url, $product_image_id = null)
        {
            $this->product_id = $product_id;
            $this->image_url = $image_url;
            $this->product_image_id = $product_image_id;
        }
        public function getProductId(){
            return $this->product_id;
        }
    
        public function setProductId($product_id){
            $this->product_id = $product_id;
        }
    
        public function getImageUrl(){
            return $this->image_url;
        }
    
        public function setImageUrl($image_url){
            $this->image_url = $image_url;
        }
    
        public function getProductImageId(){
            return $this->product_image_id;
        }
    
        public function setProductImageId($product_image_id){
            $this->product_image_id = $product_image_id;
        }

        public function toArray() {
            return array(
                'product_image_id' => $this->product_image_id,
                'product_id' => $this->product_id,
                'image_url' => $this->image_url
            );
        }
    }
?>