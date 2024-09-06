<?php
    class ShipmentModel{
        private $import_id;
        private $supplier_id;
        private $unit_price_import;
        private $quantity;
        private $remain;
        private $sku_id;
        private $shipment_id;
        private $is_active;
        public function __construct($import_id, $supplier_id, $unit_price_import, $quantity, $sku_id, $remain = null, $shipment_id = null, $is_active = null)
        {
            $this->import_id = $import_id;
            $this->supplier_id = $supplier_id;
            $this->unit_price_import = $unit_price_import;
            $this->quantity = $quantity;
            $this->sku_id = $sku_id;
            $this->remain = is_null($remain) ? $quantity : $remain;
            $this->shipment_id = $shipment_id;
            $this->is_active = $is_active;
        }
        public function getImport_id(){
            return $this->import_id;
        }
    
        public function setImport_id($import_id){
            $this->import_id = $import_id;
        }
    
        public function getsupplier_id(){
            return $this->supplier_id;
        }
    
        public function setsupplier_id($supplier_id){
            $this->supplier_id = $supplier_id;
        }
    
        public function getUnit_price_import(){
            return $this->unit_price_import;
        }
    
        public function setUnit_price_import($unit_price_import){
            $this->unit_price_import = $unit_price_import;
        }
    
        public function getQuantity(){
            return $this->quantity;
        }
    
        public function setQuantity($quantity){
            $this->quantity = $quantity;
        }
    
        public function getRemain(){
            return $this->remain;
        }
    
        public function setRemain($remain){
            $this->remain = $remain;
        }
    
        public function getSku_id(){
            return $this->sku_id;
        }
    
        public function setSku_id($sku_id){
            $this->sku_id = $sku_id;
        }
    

    
        public function getShipment_id(){
            return $this->shipment_id;
        }
    
        public function setShipment_id($shipment_id){
            $this->shipment_id = $shipment_id;
        }
    
        public function getIs_active(){
            return $this->is_active;
        }
    
        public function setIs_active($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'shipment_id' => $this->shipment_id,
                'import_id' => $this->import_id,
                'supplier_id' => $this->supplier_id,
                'unit_price_import' => $this->unit_price_import,
                'quantity' => $this->quantity,
                'remain' => $this->remain,
                'sku_id' => $this->sku_id,
                'is_active' => $this->is_active
            );
        }
    }
?>