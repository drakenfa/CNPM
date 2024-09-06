<?php
    // Dùng để gọi Models và Views vào Controllers
    class Controller{
        // public function model($model){// Truyền tên model vào
        //     require_once "./MVC/Models/".$model.".php";
        //     return new $model;// tạo ra 1 đối tượng
        // }
        public function service($service){
            require_once "./MVC/Services/".$service.".php";
            return new $service;
        }
        public function view($view, $data = []){
            require_once "./MVC/Views/".$view.".php";
        }
    }
?>