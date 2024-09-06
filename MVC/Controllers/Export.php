<?php
    class Export extends Controller{
        public $exportService;
        public function __construct(){
            $this->exportService = $this->service("ExportService");
        }
        public function CreateExport(){
            $this->exportService->createExport();
        }
        public function UpdateExport(){
            $this->exportService->updateExport();
        }
        public function DeleteExport(){
            $this->exportService->deleteExport();
        }
        public function GetAllExport(){
            $this->exportService->getAllExport();
        }
        public function GetExportById(){
            $this->exportService->GetExportById();
        }
        public function getInfoExport(){
            $this->exportService->getInfoExport();
        }
        public function GetQuantityExportByMonth($year){
            $this->exportService->getQuantityExportByMonth($year);
        }

        public function GetQuantityExportByQuarter($year){
            $this->exportService->getQuantityExportByQuarter($year);
        }

        public function GetProfitByMonth($year){
            $this->exportService->getProfitByMonth($year);
        }

        public function GetProfitByQuarter($year){
            $this->exportService->getProfitByQuarter($year);
        }

        public function GetDistinctYear(){
            $this->exportService->getDistinctYear();
        }
    }
?>