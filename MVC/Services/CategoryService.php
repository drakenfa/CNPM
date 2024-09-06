<?php
    require_once "./MVC/Models/CategoryModel.php";
    class CategoryService extends Service{
        public $categoryRepo;

        public function __construct(){
            $this->categoryRepo = $this->repository("CategoryRepository");
        }
        
        public function createCategory(){
            $category = new CategoryModel("TV", "");
            $this->categoryRepo->createCategory($category);
        }

        public function updateCategory(){// by id (truyền DTO)
            $categoryData = $this->categoryRepo->getCategoryById("9");
            extract($categoryData);// gán các giá trị cho các key tương ứng với các biến
            $category = new CategoryModel(
                "Tivi sieu mong", $category_logo, $category_id, $is_active
            );
            $this->categoryRepo->updateCategory($category, "9");
        }

        public function deleteCategory(){
            $id = "9";
            $this->categoryRepo->deleteCategory($id);
        }

        public function getAllCategory(){
            return $this->categoryRepo->getAllCategory();
        }

        public function getCategoryById(){
            $id = "5";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->categoryRepo->getCategoryById($id), JSON_UNESCAPED_UNICODE);
        }
        public function getAllCategoryName(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->categoryRepo->getAllCategoryName(), JSON_UNESCAPED_UNICODE);
        }
    }
?>