<?php
        class FunctionRepository extends DB{
            public function createFunction($function){
                $this->create("functions", $function, "function_id");
            }

            public function updateFunction($function, $id){// by id
                $this->update("functions", $function, "function_id = ".$id);
            }

            public function deleteFunction($id){// by id
                $this->delete("functions", "function_id = ".$id);
            }

            public function getAllFunction(){
                return $this->read("functions");
            }
            
            public function getFunctionById($id){
                return $this->getAllByWhere("functions", "function_id = ".$id);
            }
        }
    ?>