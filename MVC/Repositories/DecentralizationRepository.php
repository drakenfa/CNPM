<?php
        class DecentralizationRepository extends DB{
            public function createDecentralization($decentralization){
                $this->create("decentralizations", $decentralization, "decentralization_id");
            }

            public function updateDecentralization($decentralization, $id){// by id
                $this->update("decentralizations", $decentralization, "decentralization_id = ".$id, "decentralization_id");
            }

            public function deleteDecentralization($roleId, $moduleId){// by id
                $this->realDelete("decentralizations", "role_id = ".$roleId." AND "."module_id = ".$moduleId);
            }

            public function getAllDecentralization(){
                return $this->selectManyColumn("decentralizations", "role_id, module_id", "");
            }
            
            public function getDecentralizationById($id){
                return $this->getAllByWhere("decentralizations", "decentralization_id = ".$id);
            }

            public function getAllModuleByRole($role_id){
                return $this->getAllByDistinct("decentralizations", "module_id", "role_id = ".$role_id);
            }

            public function getAllModule(){
                return $this->read("modules");
            }

            public function getAllRole(){
                return $this->read("roles");
            }
        }
    ?>