<?php
    require_once "./MVC/Models/ImportModel.php";
    require_once "./MVC/Models/ShipmentModel.php";
    class ImportService extends Service{
        public $importRepo;
        public $shipmentRepo;
        public function __construct(){
            $this->importRepo = $this->repository("ImportRepository");
        }
        
        public function createImport(){//$importDTO
            // $import = new ImportModel("4");
            // $this->importRepo->createImport($import);
            // header("location: ../../../web-ban-hang/InternalManager/ImportManager");
        }

        public function updateImport(){// by id (truyền DTO)
            $importData = $this->importRepo->getImportById("1");
            extract($importData);// gán các giá trị cho các key tương ứng với các biến
            $import = new ImportModel(
                "1", $import_id, $import_date, $is_active
            );
            $this->importRepo->updateImport($import, "1");
        }

        public function deleteImport(){
            $id = "1";
            $this->importRepo->deleteImport($id);
        }

        public function getAllImport(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->importRepo->getAllImport(), JSON_UNESCAPED_UNICODE);
        }

        public function getImportById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->importRepo->getImportById($id), JSON_UNESCAPED_UNICODE);
        }
        public function getInfoImport(){
            return $this->importRepo->getAllImport();
        }

        public function getQuantityImportByMonth($year){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->importRepo->getQuantityImportByMonth($year), JSON_UNESCAPED_UNICODE);
        }

        public function getQuantityImportByQuarter($year){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->importRepo->getQuantityImportByQuarter($year), JSON_UNESCAPED_UNICODE);
        }

        public function getDistinctYear(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->importRepo->getDistinctYear(), JSON_UNESCAPED_UNICODE);
        }
    }
?>