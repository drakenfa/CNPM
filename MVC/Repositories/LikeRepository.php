<?php
        class LikeRepository extends DB{
            public function createLike($like){
                $this->create("likes", $like, "like_id");
            }

            public function deleteLike($id){// by id
                $this->realDelete("likes", "like_id = ".$id);
            }

            public function getAllLike(){
                return $this->readDontHaveIsActive("likes");
            }
            
            public function getLikeById($id){// có thể lấy các lượt like theo id khách hàng
                return $this->getAllDontHaveIsActive("likes", "like_id = ".$id);
            }
        }
    ?>