<?php
    class Brand extends Controller{
        public $brandService;
        public function __construct(){
            $this->brandService = $this->service("BrandService");
        }
        public function SayHi(){
            $this->view("master",[
                "Page" => "Home"
            ]);
        }
        public function List(){
            $this->view("master",[
                "Page" => "News"
            ]);
        }
        public function CreateBrand(){
            $this->brandService->createBrand();
        }
        public function UpdateBrand(){
            $this->brandService->updateBrand();
        }
        public function DeleteBrand(){
            $this->brandService->deleteBrand();
        }
        public function GetAllBrand(){
            $this->brandService->getAllBrand();
        }
        public function GetBrandById(){
            $this->brandService->GetBrandById();
        }
    }
?>