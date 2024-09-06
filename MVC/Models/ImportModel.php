<?php
    class ImportModel{
        private $import_id;
        private $staff_id;
        private $import_date;
        private $is_active;
        public function __construct($staff_id, $import_id = null, $import_date = null, $is_active = null)
        {
            $this->staff_id = $staff_id;
            $this->import_id = $import_id;
            $this->import_date = $import_date;
            $this->is_active = $is_active;
        }
        public function getImportId(){
            return $this->import_id;
        }
    
        public function setImportId($import_id){
            $this->import_id = $import_id;
        }
    
        public function getStaffId(){
            return $this->staff_id;
        }
    
        public function setStaffId($staff_id){
            $this->staff_id = $staff_id;
        }
    
        public function getImportDate(){
            return $this->import_date;
        }
    
        public function setImportDate($import_date){
            $this->import_date = $import_date;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'import_id' => $this->import_id,
                'staff_id' => $this->staff_id,
                'import_date' => $this->import_date,
                'is_active' => $this->is_active
            );
        }
    }
?>