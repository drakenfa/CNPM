<?php
    require_once "./MVC/Models/ExportDetailModel.php";
    class ExportDetailService extends Service{
        public $exportDetailRepo;

        public function __construct(){
            $this->exportDetailRepo = $this->repository("ExportDetailRepository");
        }
        
        public function createExportDetail(){//$exportDetailDTO
            $exportDetail = new ExportDetailModel("1", "1", "0", "0");
            $this->exportDetailRepo->createExportDetail($exportDetail);
        }

        public function updateExportDetail(){// by id (truyền DTO)
            $exportDetailData = $this->exportDetailRepo->getExportDetailById("1");
            extract($exportDetailData);// gán các giá trị cho các key tương ứng với các biến
            $exportDetail = new ExportDetailModel(
                $export_id, "2", $unit_price_export, $quantity_export, $export_detail_id
            );
            $this->exportDetailRepo->updateExportDetail($exportDetail, "1");
        }

        public function deleteExportDetail(){
            $id = "1";
            $this->exportDetailRepo->deleteExportDetail($id);
        }

        public function getAllExportDetail(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportDetailRepo->getAllExportDetail(), JSON_UNESCAPED_UNICODE);
        }

        public function getExportDetailById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportDetailRepo->getExportDetailById($id), JSON_UNESCAPED_UNICODE);
        }
        public function GetExportDetailByExportId(){
            return $this->exportDetailRepo->getDetails();
        }
    }
?>