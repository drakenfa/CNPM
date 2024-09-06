<?php
    class ModuleModel{
        private $module_id;
        private $module_name;
        private $is_active;

        public function __construct($module_name, $module_id = null, $is_active = null){
            $this->module_name = $module_name;
            $this->module_id = $module_id;
            $this->is_active = $is_active;
        }
        public function getModuleId(){
            return $this->module_id;
        }
        public function setModuleId($module_id){
            $this->module_id = $module_id;
        }
        public function getModuleName(){
            return $this->module_name;
        }
        public function setModuleName($module_name){
            $this->module_name = $module_name;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'module_id' => $this->module_id,
                'module_name' => $this->module_name,
                'is_active' => $this->is_active
            );
        }
    }
?>