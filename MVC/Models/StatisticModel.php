<?php
    class StatisticModel{
        private $statistic_name;
        private $value;
        private $statistic_id;
        private $is_active;
        public function __construct($statistic_name, $value, $statistic_id = null, $is_active = null)
        {
            $this->statistic_name = $statistic_name;
            $this->value = $value;
            $this->statistic_id = $statistic_id;
            $this->is_active = $is_active;
        }
        public function getStatistic_name(){
            return $this->statistic_name;
        }
    
        public function setStatistic_name($statistic_name){
            $this->statistic_name = $statistic_name;
        }
    
        public function getValue(){
            return $this->value;
        }
    
        public function setValue($value){
            $this->value = $value;
        }
    
        public function getStatistic_id(){
            return $this->statistic_id;
        }
    
        public function setStatistic_id($statistic_id){
            $this->statistic_id = $statistic_id;
        }
    
        public function getIs_active(){
            return $this->is_active;
        }
    
        public function setIs_active($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'statistic_id' => $this->statistic_id,
                'statistic_name' => $this->statistic_name,
                'value' => $this->value,
                'is_active' => $this->is_active
            );
        }
    }
?>