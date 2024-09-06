<?php
    require_once "./MVC/Models/FunctionModel.php";
    class FunctionService extends Service{
        public $functionRepo;

        public function __construct(){
            $this->functionRepo = $this->repository("FunctionRepository");
        }
        
        public function createFunction(){//$functionDTO
            $function = new FunctionModel("Nâng cấp");
            $this->functionRepo->createFunction($function);
        }

        public function updateFunction(){// by id (truyền DTO)
            $functionData = $this->functionRepo->getFunctionById("7");
            extract($functionData);// gán các giá trị cho các key tương ứng với các biến
            $function = new FunctionModel(
                "Đã được nâng cấp", $function_id, $is_active
            );
            $this->functionRepo->updateFunction($function, "7");
        }

        public function deleteFunction(){
            $id = "7";
            $this->functionRepo->deleteFunction($id);
        }

        public function getAllFunction(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->functionRepo->getAllFunction(), JSON_UNESCAPED_UNICODE);
        }

        public function getFunctionById(){
            $id = "2";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->functionRepo->getFunctionById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>