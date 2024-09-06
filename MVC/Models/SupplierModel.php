<?php
    class SupplierModel{
        private $supplier_name;
        private $phone_number_of_supplier;
        private $address_of_supplier;
        private $email_of_supplier;
        private $supplier_id;
        private $is_active;
        public function __construct($supplier_name, $phone_number_of_supplier, $address_of_supplier, $email_of_supplier, $supplier_id = null, $is_active = null)
        {
            $this->supplier_name = $supplier_name;
            $this->phone_number_of_supplier = $phone_number_of_supplier;
            $this->address_of_supplier = $address_of_supplier;
            $this->email_of_supplier = $email_of_supplier;
            $this->supplier_id = $supplier_id;
            $this->is_active = $is_active;
        }
        public function getSupplierName(){
            return $this->supplier_name;
        }
    
        public function setSupplierName($supplier_name){
            $this->supplier_name = $supplier_name;
        }
    
        public function getPhoneNumberOfSupplier(){
            return $this->phone_number_of_supplier;
        }
    
        public function setPhoneNumberOfSupplier($phone_number_of_supplier){
            $this->phone_number_of_supplier = $phone_number_of_supplier;
        }
    
        public function getAddressOfSupplier(){
            return $this->address_of_supplier;
        }
    
        public function setAddressOfSupplier($address_of_supplier){
            $this->address_of_supplier = $address_of_supplier;
        }
    
        public function getEmailOfSupplier(){
            return $this->email_of_supplier;
        }
    
        public function setEmailOfSupplier($email_of_supplier){
            $this->email_of_supplier = $email_of_supplier;
        }
    
        public function getSupplierId(){
            return $this->supplier_id;
        }
    
        public function setSupplierId($supplier_id){
            $this->supplier_id = $supplier_id;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'supplier_id' => $this->supplier_id,
                'supplier_name' => $this->supplier_name,
                'phone_number_of_supplier' => $this->phone_number_of_supplier,
                'address_of_supplier' => $this->address_of_supplier,
                'email_of_supplier' => $this->email_of_supplier,
                'is_active' => $this->is_active
            );
        }
    }
?>