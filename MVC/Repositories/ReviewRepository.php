<?php
    class ReviewRepository extends DB{
        public function createReview($review){
            $this->create("reviews", $review, "review_id");
        }

        public function updateReview($review, $id){// by id
            $this->update("reviews", $review, "review_id = ".$id);
        }

        public function deleteReview($id){// by id
            $this->delete("reviews", "review_id = ".$id);
        }

        public function getAllReview(){
            return $this->read("reviews");
        }
        
        public function getReviewById($id){
            return $this->getAllByWhere("reviews", "review_id = ".$id);
        }
    }
?>