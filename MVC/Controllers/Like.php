<?php
    class Like extends Controller{
        public $likeService;
        public function __construct(){
            $this->likeService = $this->service("LikeService");
        }
        public function CreateLike(){
            $this->likeService->createLike();
        }
        public function DeleteLike(){
            $this->likeService->deleteLike();
        }
        public function GetAllLike(){
            $this->likeService->getAllLike();
        }
        public function GetLikeById(){
            $this->likeService->GetLikeById();
        }
    }
?>