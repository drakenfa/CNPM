<?php
    require_once "./MVC/Models/ContractModel.php";
    class ContractService extends Service{
        public $contractRepo;

        public function __construct(){
            $this->contractRepo = $this->repository("ContractRepository");
        }
        
        public function createContract(){
            $contract = new ContractModel("3", "2023-05-22", "2024-05-22", "17000000");
            $this->contractRepo->createContract($contract);
        }

        public function updateContract(){// by id (truyền DTO)
            $contractData = $this->contractRepo->getContractById("1");
            extract($contractData);// gán các giá trị cho các key tương ứng với các biến
            $contract = new ContractModel(
                $staff_id, $start_date, $end_date, "21000000", $contract_id
            );
            $this->contractRepo->updateContract($contract, "1");
        }

        public function getAllContract(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->contractRepo->getAllContract(), JSON_UNESCAPED_UNICODE);
        }

        public function getContractById(){
            $id = "2";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->contractRepo->getContractById($id), JSON_UNESCAPED_UNICODE);
        }

        public function getAllDataContract(){
            return $this->contractRepo->getAllDataContract();
        }
    }
?>