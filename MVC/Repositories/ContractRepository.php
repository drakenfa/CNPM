<?php
        class ContractRepository extends DB{
            public function createContract($contract){
                $this->create("contracts", $contract, "contract_id");
            }

            public function updateContract($contract, $id){// by id
                $this->update("contracts", $contract, "contract_id = ".$id, "contract_id");
            }

            public function getAllContract(){
                return $this->readDontHaveIsActive("contracts");
            }
            
            public function getContractById($id){
                return $this->getAllDontHaveIsActive("contracts", "contract_id = ".$id);
            }

            public function getAllDataContract(){
                return $this->get("SELECT 
                                    c.contract_id, 
                                    s.staff_id, 
                                    s.staff_fullname, 
                                    c.start_date, 
                                    c.end_date, 
                                    CONCAT(FORMAT(c.salary, 0, 'en_US'), 'đ') as salary
                                FROM 
                                    contracts c
                                INNER JOIN 
                                    staffs s ON c.staff_id = s.staff_id
                                ORDER BY c.contract_id ASC;
                                ");
            }
        }
    ?>