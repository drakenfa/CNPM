<?php
    class Module extends Controller{
        public $moduleService;
        public function __construct(){
            $this->moduleService = $this->service("ModuleService");
        }
        public function CreateModule(){
            $this->moduleService->createModule();
        }
        public function UpdateModule(){
            $this->moduleService->updateModule();
        }
        public function DeleteModule(){
            $this->moduleService->deleteModule();
        }
        public function GetAllModule(){
            $this->moduleService->getAllModule();
        }
        public function GetModuleById(){
            $this->moduleService->GetModuleById();
        }
    }
?>