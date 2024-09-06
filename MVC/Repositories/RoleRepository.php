<?php
    class RoleRepository extends DB{
        public function createRole($role){
            $this->create("roles", $role, "role_id");
        }

        public function deleteRole($id){// by id
            $this->realDelete("roles", "role_id = ".$id);
        }

        public function getAllRole(){
            return $this->read("roles");
        }

        public function getAllRoleStaff(){
            return $this->getAllByWhere("roles", "role_id != 5");
        }
        
        public function getRoleById($id){
            return $this->getAllByWhere("roles", "role_id = ".$id);
        }

        public function getRoleByName($roleName){
            return $this->getAllByWhere("roles", "role_name = '".$roleName."'");
        }
    }
?>