<?php
    class SupplierRepository extends DB{
        public function createSupplier($supplier){
            $this->create("suppliers", $supplier, "supplier_id");
        }

        public function updateSupplier($supplier, $id){// by id
            $this->update("suppliers", $supplier, "supplier_id = ".$id, "supplier_id");
        }

        public function deleteSupplier($id){// by id
            $this->delete("suppliers", "supplier_id = ".$id);
        }

        public function getAllSupplier(){
            return $this->read("suppliers");
        }
        
        public function getSupplierById($id){
            return $this->getAllByWhere("suppliers", "supplier_id = ".$id);
        }

        public function getSupplierByPhoneNumber($phone_number){
            return $this->getAllByWhere("suppliers", "phone_number_of_supplier = ".$phone_number);
        }

        public function getSupplierByEmail($email){
            return $this->getAllByWhere("suppliers", "email_of_supplier = ".$email);
        }
    }
?>