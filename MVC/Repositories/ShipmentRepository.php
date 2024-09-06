<?php
    class ShipmentRepository extends DB{
        public function createShipment($shipment){
            $this->create("shipments", $shipment, "shipment_id");
            echo "shipment new created";
        }

        public function updateShipment($shipment, $id){// by id
            $this->update("shipments", $shipment, "shipment_id = ".$id,"shipment_id");
        }

        public function deleteShipment($id){// by id
            $this->delete("shipments", "shipment_id = ".$id);
        }

        public function getAllShipment(){
            return $this->read("shipments");
        }
        
        public function getShipmentById($id){
            return $this->getAllByWhere("shipments", "shipment_id = ".$id);
        }
        public function getDetails(){
            return $this->readDontHaveIsActive("shipments");
        }
    }
?>