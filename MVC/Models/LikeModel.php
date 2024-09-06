<?php
    class LikeModel{
        private $like_id;
        private $product_id;
        private $customer_id;
        public function __construct($product_id, $customer_id, $like_id = null)
        {
            $this->product_id = $product_id;
            $this->customer_id = $customer_id;
            $this->like_id = $like_id;
        }
        public function getLikeId(){
            return $this->like_id;
        }
    
        public function setLikeId($like_id){
            $this->like_id = $like_id;
        }
    
        public function getProductId(){
            return $this->product_id;
        }
    
        public function setProductId($product_id){
            $this->product_id = $product_id;
        }
    
        public function getCustomerId(){
            return $this->customer_id;
        }
    
        public function setCustomerId($customer_id){
            $this->customer_id = $customer_id;
        }

        public function toArray() {
            return array(
                'like_id' => $this->like_id,
                'product_id' => $this->product_id,
                'customer_id' => $this->customer_id
            );
        }
    }
?>