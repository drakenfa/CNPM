<?php
    class ExportDetail extends Controller{
        public $exportDetailService;
        public function __construct(){
            $this->exportDetailService = $this->service("ExportDetailService");
        }
        public function CreateExportDetail(){
            $this->exportDetailService->createExportDetail();
        }
        public function UpdateExportDetail(){
            $this->exportDetailService->updateExportDetail();
        }
        public function DeleteExportDetail(){
            $this->exportDetailService->deleteExportDetail();
        }
        public function GetAllExportDetail(){
            $this->exportDetailService->getAllExportDetail();
        }
        public function GetExportDetailById(){
            $this->exportDetailService->GetExportDetailById();
        }
        public function GetExportDetailByExportId(){
            $this->exportDetailService->GetExportDetailByExportId();
        }
    }
?>