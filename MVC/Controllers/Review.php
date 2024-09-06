<?php
    class Review extends Controller{
        public $reviewService;
        public function __construct(){
            $this->reviewService = $this->service("ReviewService");
        }
        public function CreateReview(){
            $this->reviewService->createReview();
        }
        public function UpdateReview(){
            $this->reviewService->updateReview();
        }
        public function DeleteReview(){
            $this->reviewService->deleteReview();
        }
        public function GetAllReview(){
            $this->reviewService->getAllReview();
        }
        public function GetReviewById(){
            $this->reviewService->GetReviewById();
        }
    }
?>