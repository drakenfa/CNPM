<?php
    require_once "./MVC/Models/LikeModel.php";
    class LikeService extends Service{
        public $likeRepo;

        public function __construct(){
            $this->likeRepo = $this->repository("LikeRepository");
        }
        
        public function createLike(){//$likeDTO
            $like = new LikeModel("1", "1");
            $this->likeRepo->createLike($like);
        }

        public function deleteLike(){
            $id = "1";
            $this->likeRepo->deleteLike($id);
        }

        public function getAllLike(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->likeRepo->getAllLike(), JSON_UNESCAPED_UNICODE);
        }

        public function getLikeById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->likeRepo->getLikeById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>