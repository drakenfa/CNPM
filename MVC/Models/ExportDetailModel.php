<?php
    class ExportDetailModel{
        private $export_detail_id;
        private $export_id;
        private $shipment_id;
        private $unit_price_export;
        private $quantity_export;
        public function __construct($export_id, $shipment_id, $unit_price_export = null, $quantity_export = null, $export_detail_id = null){
            $this->export_id = $export_id;
            $this->shipment_id = $shipment_id;
            $this->unit_price_export = $unit_price_export;
            $this->quantity_export = $quantity_export;
            $this->export_detail_id = $export_detail_id;
        }
        public function getExportDetailId(){
            return $this->export_detail_id;
        }
    
        public function setExportDetailId($export_detail_id){
            $this->export_detail_id = $export_detail_id;
        }
    
        public function getExportId(){
            return $this->export_id;
        }
    
        public function setExportId($export_id){
            $this->export_id = $export_id;
        }
    
        public function getShipmentId(){
            return $this->shipment_id;
        }
    
        public function setShipmentId($shipment_id){
            $this->shipment_id = $shipment_id;
        }
    
        public function getUnitPriceExport(){
            return $this->unit_price_export;
        }
    
        public function setUnitPriceExport($unit_price_export){
            $this->unit_price_export = $unit_price_export;
        }
    
        public function getQuantityExport(){
            return $this->quantity_export;
        }
    
        public function setQuantityExport($quantity_export){
            $this->quantity_export = $quantity_export;
        }

        public function toArray() {
            return array(
                'export_detail_id' => $this->export_detail_id,
                'export_id' => $this->export_id,
                'shipment_id' => $this->shipment_id,
                'unit_price_export' => $this->unit_price_export,
                'quantity_export' => $this->quantity_export
            );
        }
    }
?>