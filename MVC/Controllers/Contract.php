<?php
    class Contract extends Controller{
        public $contractService;
        public function __construct(){
            $this->contractService = $this->service("ContractService");
        }
        public function CreateContract(){
            $this->contractService->createContract();
        }
        public function UpdateContract(){
            $this->contractService->updateContract();
        }
        public function GetAllContract(){
            $this->contractService->getAllContract();
        }
        public function GetContractById(){
            $this->contractService->GetContractById();
        }
    }
?>