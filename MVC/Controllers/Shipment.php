<?php
    class Shipment extends Controller{
        public $shipmentService;
        public function __construct(){
            $this->shipmentService = $this->service("ShipmentService");
        }
        public function CreateShipment(){
            $this->shipmentService->createShipment();
        }
        public function UpdateShipment(){
            $this->shipmentService->updateShipment();
        }
        public function DeleteShipment(){
            $this->shipmentService->deleteShipment();
        }
        public function GetAllShipment(){
            $this->shipmentService->getAllShipment();
        }
        public function GetShipmentById(){
            $this->shipmentService->GetShipmentById();
        }
        public function GetShipmentlByImportId(){
            $this->shipmentService->GetShipmentlByImportId();
        }
    }
?>