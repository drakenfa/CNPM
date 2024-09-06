<?php
    require_once "./MVC/Models/SupplierModel.php";
    class SupplierService extends Service{
        public $supplierRepo;

        public function __construct(){
            $this->supplierRepo = $this->repository("SupplierRepository");
        }
        
        public function createSupplier($supplierName, $phoneNumber, $address, $email){//$supplierDTO
            $supplier = new SupplierModel($supplierName, $phoneNumber, $address, $email);
            $this->supplierRepo->createSupplier($supplier);
        }

        public function updateSupplier($supplierName, $phoneNumber, $address, $email, $supplier_id){// by id (truyền DTO)
            $supplier = new SupplierModel(
                $supplierName, $phoneNumber, $address, $email, $supplier_id, "1"
            );
            $this->supplierRepo->updateSupplier($supplier, $supplier_id);
        }

        public function deleteSupplier($supplier_id){
            $this->supplierRepo->deleteSupplier($supplier_id);
            header("location: ../../InternalManager/SupplierManager");
        }

        public function getAllSupplier(){
            return $this->supplierRepo->getAllSupplier();
        }

        public function getSupplierById(){
            $id = "'NCC010'";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->supplierRepo->getSupplierById($id), JSON_UNESCAPED_UNICODE);
        }



        public function getSupplierByPhoneNumber($phoneNumber){
            $supplier = $this->supplierRepo->getSupplierByPhoneNumber($phoneNumber);//lấy ra mảng chứa data của account có username = $username
            if($supplier){// nếu mảng khác null
                return json_encode("Số điện thoại đã tồn tại", JSON_UNESCAPED_UNICODE); // trả về json data
            }else{
                return null;
            }
        }

        public function getSupplierByEmail($email){  
            // $accountCustomer = $this->accountRepo->joinAccountCustomer($this->toString($email));// lấy ra mảng chứa data của account có email = $email bằng cách join 2 bảng on account_id
            // $accountStaff = $this->accountRepo->joinAccountStaff($this->toString($email));
            $supplier = $this->supplierRepo->getSupplierByEmail($email);
            if($supplier){ // nếu mảng khác null
                return json_encode("Email đã tồn tại", JSON_UNESCAPED_UNICODE);   // trả về json data
            }else{
                return null;
            }
        }

    }
?>