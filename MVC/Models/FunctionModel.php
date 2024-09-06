<?php
    class FunctionModel{
        private $function_id;
        private $function_name;
        private $is_active;
        public function __construct($function_name, $function_id = null, $is_active = null){
            $this->function_name = $function_name;
            $this->function_id = $function_id;
            $this->is_active = $is_active;
        }
        public function getFunctionId(){
            return $this->function_id;
        }
        public function setFunctionId($function_id){
            $this->function_id = $function_id;
        }
        public function getFunctionName(){
            return $this->function_name;
        }
        public function setFunctionName($function_name){
            $this->function_name = $function_name;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'function_id' => $this->function_id,
                'function_name' => $this->function_name,
                'is_active' => $this->is_active
            );
        }
    }
?>