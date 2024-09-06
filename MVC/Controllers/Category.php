<?php
    class Category extends Controller{
        public $categoryService;
        public function __construct(){
            $this->categoryService = $this->service("CategoryService");
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
        public function CreateCategory(){
            $this->categoryService->createCategory();
        }
        public function UpdateCategory(){
            $this->categoryService->updateCategory();
        }
        public function DeleteCategory(){
            $this->categoryService->deleteCategory();
        }
        public function GetAllCategory(){
            $this->categoryService->getAllCategory();
        }
        public function GetCategoryById(){
            $this->categoryService->GetCategoryById();
        }
        public function GetAllCategoryName(){
            $this->categoryService->getAllCategoryName();
        }
    }
?>