<?php
    require_once "./MVC/Models/ReviewModel.php";
    class ReviewService extends Service{
        public $reviewRepo;

        public function __construct(){
            $this->reviewRepo = $this->repository("ReviewRepository");
        }
        
        public function createReview(){//$reviewDTO
            $review = new ReviewModel("1", "1", "4.5", "Sản phẩm như hạch");
            $this->reviewRepo->createReview($review);
        }

        public function updateReview(){// by id (truyền DTO)
            $reviewData = $this->reviewRepo->getReviewById("1");
            extract($reviewData);// gán các giá trị cho các key tương ứng với các biến
            $review = new ReviewModel(
                $product_id, $customer_id, $rating, "Sản phẩm như cc", $review_id, $review_date, $is_active
            );
            $this->reviewRepo->updateReview($review, "1");
        }

        public function deleteReview(){
            $id = "1";
            $this->reviewRepo->deleteReview($id);
        }

        public function getAllReview(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->reviewRepo->getAllReview(), JSON_UNESCAPED_UNICODE);
        }

        public function getReviewById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->reviewRepo->getReviewById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>