<?php
    class Sku extends Controller{
        public $skuService;
        public function __construct(){
            $this->skuService = $this->service("SkuService");
        }
        public function CreateSku(){
            $this->skuService->createSku();
        }
        public function UpdateSku(){
            $this->skuService->updateSku();
        }
        public function DeleteSku(){
            $this->skuService->deleteSku();
        }
        public function GetAllSku(){
            $this->skuService->getAllSku();
        }
        public function GetSkuById(){
            $this->skuService->GetSkuById();
        }
    }
?>