<?php
    class ReviewModel{
        private $product_id;
        private $customer_id;
        private $rating;
        private $comment;
        private $review_id;
        private $review_date;
        private $is_active;
        public function __construct($product_id, $customer_id, $rating, $comment, $review_id = null, $review_date = null, $is_active = null)
        {
            $this->product_id = $product_id;
            $this->customer_id = $customer_id;
            $this->rating = $rating;
            $this->comment = $comment;
            $this->review_id = $review_id;
            $this->review_date = $review_date;
            $this->is_active = $is_active;
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
    
        public function getRating(){
            return $this->rating;
        }
    
        public function setRating($rating){
            $this->rating = $rating;
        }
    
        public function getComment(){
            return $this->comment;
        }
    
        public function setComment($comment){
            $this->comment = $comment;
        }
    
        public function getReviewId(){
            return $this->review_id;
        }
    
        public function setReviewId($review_id){
            $this->review_id = $review_id;
        }
    
        public function getReviewDate(){
            return $this->review_date;
        }
    
        public function setReviewDate($review_date){
            $this->review_date = $review_date;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'review_id' => $this->review_id,
                'product_id' => $this->product_id,
                'customer_id' => $this->customer_id,
                'rating' => $this->rating,
                'comment' => $this->comment,
                'review_date' => $this->review_date,
                'is_active' => $this->is_active
            );
        }
    }
?>