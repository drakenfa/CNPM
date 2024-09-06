<?php
    class RoleModel{
        private $role_name;
        private $role_id;
        private $is_active;
        public function __construct($role_name, $role_id = null, $is_active = null)
        {
            $this->role_name = $role_name;
            $this->role_id = $role_id;
            $this->is_active = $is_active;
        }
        public function getRoleName(){
            return $this->role_name;
        }
    
        public function setRoleName($role_name){
            $this->role_name = $role_name;
        }
    
        public function getRoleId(){
            return $this->role_id;
        }
    
        public function setRoleId($role_id){
            $this->role_id = $role_id;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'role_id' => $this->role_id,
                'role_name' => $this->role_name,
                'is_active' => $this->is_active
            );
        }
    }
?>