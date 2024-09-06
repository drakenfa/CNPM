<?php
    class Decentralization extends Controller{
        public $decentralizationService;
        public function __construct(){
            $this->decentralizationService = $this->service("DecentralizationService");
        }
        public function CreateDecentralization(){
            $roleId = $_POST['role_id'];
            $moduleId = $_POST['module_id'];
            $this->decentralizationService->createDecentralization($roleId, $moduleId);
        }
        public function UpdateDecentralization(){
            $this->decentralizationService->updateDecentralization();
        }
        public function DeleteDecentralization(){
            $roleId = $_POST['role_id'];
            $moduleId = $_POST['module_id'];
            $this->decentralizationService->deleteDecentralization($roleId, $moduleId);
        }
        public function GetAllDecentralization(){
            $this->decentralizationService->getAllDecentralization();
        }
        public function GetDecentralizationById(){
            $this->decentralizationService->GetDecentralizationById();
        }
        public function GetAllModuleByRole($role_id){// lấy ra các module
            $this->decentralizationService->getAllModuleByRole($role_id);
        }
    }
?>