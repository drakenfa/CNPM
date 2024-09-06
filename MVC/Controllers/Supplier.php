<?php
    class Supplier extends Controller{
        public $supplierService;
        public function __construct(){
            $this->supplierService = $this->service("SupplierService");
        }
        public function CreateSupplier(){
            $supplierName = $_POST["supplier_name_add_form"];
            $address = $_POST["address_add_form"];
            $phoneNumber = $_POST["phone_number_add_form"];
            $email = $_POST["email_add_form"];
            $this->supplierService->createSupplier($supplierName, $phoneNumber, $address, $email);
            header("location: ../InternalManager/SupplierManager");
        }
        public function UpdateSupplier(){
            $supplierName = $_POST["supplier_name_edit_form"];
            $address = $_POST["address_edit_form"];
            $phoneNumber = $_POST["phone_number_edit_form"];
            $email = $_POST["email_edit_form"];
            $supplierId = $_POST["supplier_id"];
            $this->supplierService->updateSupplier($supplierName, $phoneNumber, $address, $email, $supplierId);
            header("location: ../InternalManager/SupplierManager");
        }
        public function DeleteSupplier($supplier_id){
            $this->supplierService->deleteSupplier($supplier_id);
        }
        public function GetAllSupplier(){
            $this->supplierService->getAllSupplier();
        }
        public function GetSupplierById(){
            $this->supplierService->GetSupplierById();
        }
        public function GetSupplierByPhoneNumber(){
            $phoneNumber = $_POST["phone_number"];
            if($this->supplierService->getSupplierByPhoneNumber($phoneNumber) != null){
                echo "Số điện thoại đã tồn tại";
            }
        }
        public function GetSupplierByEmail(){
            $email = $_POST["email"];
            if($this->supplierService->getSupplierByEmail($this->toString($email)) != null){
                echo "Email đã tồn tại";
            }
        }
        public function toString($string){// tránh bị lỗi khi nhập ký tự đặc biệt vào chuỗi
            return "'".$string."'";
        }
    }
?>