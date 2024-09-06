<?php
    class ExportModel{
        private $export_id;
        private $staff_id;
        private $order_id;
        private $export_date;
        private $total_price;
        private $is_active;
        public function __construct($staff_id, $order_id, $total_price = null, $export_id = null, $export_date = null, $is_active = null){
            $this->staff_id = $staff_id;
            $this->order_id = $order_id;
            $this->total_price = $total_price;
            $this->export_id = $export_id;
            $this->export_date = $export_date;
            $this->is_active = $is_active;
        }
        public function getExportId(){
            return $this->export_id;
        }
    
        public function setExportId($export_id){
            $this->export_id = $export_id;
        }
    
        public function getStaffId(){
            return $this->staff_id;
        }
    
        public function setStaffId($staff_id){
            $this->staff_id = $staff_id;
        }
    
        public function getOrderId(){
            return $this->order_id;
        }
    
        public function setOrderId($order_id){
            $this->order_id = $order_id;
        }
    
        public function getExportDate(){
            return $this->export_date;
        }
    
        public function setExportDate($export_date){
            $this->export_date = $export_date;
        }
    
        public function getTotalPrice(){
            return $this->total_price;
        }
    
        public function setTotalPrice($total_price){
            $this->total_price = $total_price;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'export_id' => $this->export_id,
                'staff_id' => $this->staff_id,
                'order_id' => $this->order_id,
                'total_price' => $this->total_price,
                'export_date' => $this->export_date,
                'is_active' => $this->is_active
            );
        }
    }
?>