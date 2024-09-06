<?php
    class ExportDetailRepository extends DB{
        public function createExportDetail($exportDetail){
            $this->create("export_details", $exportDetail, "export_detail_id");
        }

        public function updateExportDetail($exportDetail, $id){// by id
            $this->update("export_details", $exportDetail, "export_detail_id = ".$id,"export_detail_id");
        }

        public function deleteExportDetail($id){// by id
            $this->realDelete("export_details", "export_detail_id = ".$id);
        }

        public function getAllExportDetail(){
            return $this->readDontHaveIsActive("export_details");
        }
        
        public function getExportDetailById($id){
            return $this->getAllDontHaveIsActive("export_details", "export_detail_id = ".$id);
        }
        public function getDetails(){
            return $this->readDontHaveIsActive("export_details");
        }
    }
?>