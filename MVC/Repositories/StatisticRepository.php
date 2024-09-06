<?php
    class StatisticRepository extends DB{
        public function createStatistic($statistic){
            $this->create("statistics", $statistic, "statistic_id");
        }

        public function updateStatistic($statistic, $id){// by id
            $this->update("statistics", $statistic, "statistic_id = ".$id, "statistic_id");
        }

        public function deleteStatistic($id){// by id
            $this->delete("statistics", "statistic_id = ".$id);
        }

        public function getAllStatistic(){
            return $this->read("statistics");
        }
        
        public function getStatisticById($id){
            return $this->getAllByWhere("statistics", "statistic_id = ".$id);
        }
    }
?>