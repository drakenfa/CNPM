<?php
    class StaffRepository extends DB{
        public function createStaff($staff){
            $this->create("staffs", $staff, "staff_id");
        }

        public function updateStaff($staff, $id){// by id
            $this->update("staffs", $staff, "staff_id = ".$id, "staff_id");
        }

        public function deleteStaff($id){// by id
            $this->delete("staffs", "staff_id = ".$id);
        }

        public function getAllStaff(){
            return $this->read("staffs");
        }
        
        public function getStaffById($id){
            return $this->getAllByWhere("staffs", "staff_id = ".$id);
        }

        public function getQuantityStaffByRole($role_id){
            return $this->getCountColumn("staffs", "staff_id", "role_id = ".$role_id);
        }

        public function getQuantityAllStaff(){
            return $this->getCountColumn("staffs", "staff_id", "");
        }

        public function joinStaffAccountRole(){
            return $this->join3Tables("staffs", "accounts", "roles","staffs.account_id = accounts.account_id", "staffs.role_id = roles.role_id", "staffs.is_active = 1 ORDER BY staff_id ASC");
        }

        public function joinStaffAccountRoleById($account_id){
            return $this->join3Tables("staffs", "accounts", "roles","staffs.account_id = accounts.account_id", "staffs.role_id = roles.role_id", "staffs.is_active = 1 AND staffs.account_id = $account_id ORDER BY staff_id ASC");
        }
    }
?>