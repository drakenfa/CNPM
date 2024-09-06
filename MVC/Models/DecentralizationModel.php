<?php
    class DecentralizationModel{
        private $decentralization_id;
        private $role_id;
        private $module_id;
        private $is_active;

        public function __construct($role_id, $module_id, $decentralization_id = null, $is_active = null){
            $this->decentralization_id = $decentralization_id;
            $this->role_id = $role_id;
            $this->module_id = $module_id;
            $this->is_active = $is_active;
        }
        public function getDecentralizationId(){
            return $this->decentralization_id;
        }
        public function setDecentralizationId($decentralization_id){
            $this->decentralization_id = $decentralization_id;
        }
        public function getRoleId(){
            return $this->role_id;
        }
        public function setRoleId($role_id){
            $this->role_id = $role_id;
        }
        public function getModuleId(){
            return $this->module_id;
        }
        public function setModuleId($module_id){
            $this->module_id = $module_id;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'decentralization_id' => $this->decentralization_id,
                'role_id' => $this->role_id,
                'module_id' => $this->module_id,
                'is_active' => $this->is_active
            );
        }
    }
?>