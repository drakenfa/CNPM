<?php
        class ModuleRepository extends DB{
            public function createModule($module){
                $this->create("modules", $module, "module_id");
            }

            public function updateModule($module, $id){// by id
                $this->update("modules", $module, "module_id = ".$id);
            }

            public function deleteModule($id){// by id
                $this->delete("modules", "module_id = ".$id);
            }

            public function getAllModule(){
                return $this->read("modules");
            }
            
            public function getModuleById($id){
                return $this->getAllByWhere("modules", "module_id = ".$id);
            }
        }
    ?>