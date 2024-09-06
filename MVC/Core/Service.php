<?php
    class Service{
        public function repository($repository){
            require_once "./MVC/Repositories/".$repository.".php";
            return new $repository;// tạo ra 1 đối tượng
        }
    }
?>