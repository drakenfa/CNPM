<?php
    require_once "./MVC/Models/ShipmentModel.php";
    require_once "./MVC/Models/ImportModel.php";
    class ShipmentService extends Service{
        public $shipmentRepo;
        public $importRepo;
        public function __construct(){
            $this->shipmentRepo = $this->repository("ShipmentRepository");
            $this->importRepo = $this->repository("ImportRepository");
        }
        
        public function createShipment($staffId, $shipmentDataList) {
            // Create import based on import data
            $import = new ImportModel($staffId);
            $import_id = $this->importRepo->createImport($import);
            
            // Create shipments based on shipment data
            foreach ($shipmentDataList as $shipmentData) {
                $shipmentModel = new ShipmentModel(
                    $import_id,
                    $shipmentData['supplierValue'],
                    $shipmentData['priceValue'],
                    $shipmentData['numberValue'],
                    $shipmentData['skuValue']
                );
            
                $this->shipmentRepo->createShipment($shipmentModel);
            }

            header("location: ../../../web-ban-hang/InternalManager/ImportManager");
        }
         
        
        
        // public function createShipment($staffId) {
        //     // Create import based on import data
        //     // $staffId = $_GET['staffId'];
        //     $importData = ["staff_id" => $staffId];
        //     $import = new ImportModel($importData['staff_id']);
        //     $this->importRepo->createImport($import);
        // }
        

        public function updateShipment(){// by id (truyền DTO)
            $shipmentData = $this->shipmentRepo->getShipmentById("1");
            extract($shipmentData);// gán các giá trị cho các key tương ứng với các biến
            $shipment = new ShipmentModel(
                $import_id, $supplier_id, "1000000", $quantity, $sku_id, $mfg, $exp, "4", $shipment_id, $is_active 
            );
            $this->shipmentRepo->updateShipment($shipment, "1");
        }

        public function deleteShipment(){
            $id = "1";
            $this->shipmentRepo->deleteShipment($id);
        }

        public function getAllShipment(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->shipmentRepo->getAllShipment(), JSON_UNESCAPED_UNICODE);
        }

        public function getShipmentById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->shipmentRepo->getShipmentById($id), JSON_UNESCAPED_UNICODE);
        }
        public function GetShipmentlByImportId(){
            return $this->shipmentRepo->getDetails();
        }
    }
?>