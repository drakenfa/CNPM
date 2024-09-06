<?php
    class Option extends Controller{
        public $optionService;
        public function __construct(){
            $this->optionService = $this->service("OptionService");
        }
        public function CreateOption(){
            $this->optionService->createOption();
        }
        public function UpdateOption(){
            $this->optionService->updateOption();
        }
        public function DeleteOption(){
            $this->optionService->deleteOption();
        }
        public function GetAllOption(){
            $this->optionService->getAllOption();
        }
        public function GetOptionById(){
            $this->optionService->GetOptionById();
        }
    }
?>