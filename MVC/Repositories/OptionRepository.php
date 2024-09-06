<?php
        class OptionRepository extends DB{
            public function createOption($option){
                $this->create("options", $option, "option_id");
            }

            public function updateOption($option, $id){// by id
                $this->update("options", $option, "option_id = ".$id);
            }

            public function deleteOption($id){// by id
                $this->delete("options", "option_id = ".$id);
            }

            public function getAllOption(){
                return $this->read("options");
            }
            
            public function getOptionById($id){
                return $this->getAllByWhere("options", "option_id = ".$id);
            }
        }
    ?>