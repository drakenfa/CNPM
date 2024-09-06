<?php
    require_once "./MVC/Models/ExportModel.php";
    class ExportService extends Service{
        public $exportRepo;

        public function __construct(){
            $this->exportRepo = $this->repository("ExportRepository");
        }
        
        public function createExport(){//$exportDTO
            $export = new ExportModel("4", "4");
            $this->exportRepo->createExport($export);
        }
        public function createExport2(){//$exportDTO
            $export = new ExportModel("4", "4");
            $this->exportRepo->createExport($export);
        }
        public function updateExport(){// by id (truyền DTO)
            $exportData = $this->exportRepo->getExportById("1");
            extract($exportData);// gán các giá trị cho các key tương ứng với các biến
            $export = new ExportModel(
                "2", $order_id, $total_price, $export_id, $export_date, $is_active
            );
            $this->exportRepo->updateExport($export, "1");
        }

        public function deleteExport(){
            $id = "1";
            $this->exportRepo->deleteExport($id);
        }

        public function getAllExport(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getAllExport(), JSON_UNESCAPED_UNICODE);
        }
        public function getInfoExport(){
            return $this->exportRepo->getAllExport();
        }
        
        public function getExportById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getExportById($id), JSON_UNESCAPED_UNICODE);
        }

        public function getQuantityExportByMonth($year){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getQuantityExportByMonth($year), JSON_UNESCAPED_UNICODE);
        }

        public function getQuantityExportByQuarter($year){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getQuantityExportByQuarter($year), JSON_UNESCAPED_UNICODE);
        }

        public function getProfitByMonth($year){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getProfitByMonth($year), JSON_UNESCAPED_UNICODE);
        }

        public function getProfitByQuarter($year){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getProfitByQuarter($year), JSON_UNESCAPED_UNICODE);
        }

        public function getDistinctYear(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->exportRepo->getDistinctYear(), JSON_UNESCAPED_UNICODE);
        }
    }
?>