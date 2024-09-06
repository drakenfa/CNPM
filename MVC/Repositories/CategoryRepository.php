<?php
        class CategoryRepository extends DB{
            public function createCategory($category){
                $this->create("categories", $category, "category_id");
            }

            // public function updateCategory($category, $id){// by id
            //     $this->update("categories", $category, "category_id = ".$id);
            // }

            public function deleteCategory($id){// by id
                $this->delete("categories", "category_id = ".$id);
            }

            public function getAllCategory(){
                return $this->read("categories");
            }
            
            public function getCategoryById($id){
                return $this->getAllByWhere("categories", "category_id = ".$id);
            }
            public function getAllCategoryName(){
                return $this->get("SELECT category_name FROM categories");
            }
        }
    ?>