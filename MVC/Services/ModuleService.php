<?php
    require_once "./MVC/Models/ModuleModel.php";
    class ModuleService extends Service{
        public $moduleRepo;

        public function __construct(){
            $this->moduleRepo = $this->repository("ModuleRepository");
        }
        
        public function createModule(){
            $module = new ModuleModel("Gửi xe");
            $this->moduleRepo->createModule($module);
        }

        public function updateModule(){// by id (truyền DTO)
            $moduleData = $this->moduleRepo->getModuleById("13");
            extract($moduleData);// gán các giá trị cho các key tương ứng với các biến
            $module = new ModuleModel(
                "Gửi xe hơi", $module_id, $is_active
            );
            $this->moduleRepo->updateModule($module, "13");
        }

        public function deleteModule(){
            $id = "13";
            $this->moduleRepo->deleteModule($id);
        }

        public function getAllModule(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->moduleRepo->getAllModule(), JSON_UNESCAPED_UNICODE);
        }

        public function getModuleById(){
            $id = "14";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->moduleRepo->getModuleById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>