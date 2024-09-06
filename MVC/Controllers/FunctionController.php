<?php
    class FunctionController extends Controller{
        public $functionService;
        public function __construct(){
            $this->functionService = $this->service("FunctionService");
        }
        public function CreateFunction(){
            $this->functionService->createFunction();
        }
        public function UpdateFunction(){
            $this->functionService->updateFunction();
        }
        public function DeleteFunction(){
            $this->functionService->deleteFunction();
        }
        public function GetAllFunction(){
            $this->functionService->getAllFunction();
        }
        public function GetFunctionById(){
            $this->functionService->GetFunctionById();
        }
    }
?>