<?php
    class LeaveApplicationRepository extends DB{
        public function createLeaveApplication($leaveApplication){
            $this->create("leave_application", $leaveApplication, "leave_application_id");
        }

        public function updateLeaveApplication($leaveApplication, $id){// by id
            $this->update("leave_application", $leaveApplication, "leave_application_id = ".$id, "leave_application_id");
        }

        public function deleteLeaveApplication($id){// by id
            $this->delete("leave_application", "leave_application_id = ".$id);
        }

        public function getAllLeaveApplication(){
            return $this->readDontHaveIsActive("leave_application");
        }
        
        public function getLeaveApplicationById($id){
            return $this->getAllByWhereNonIsActive("leave_application", "leave_application_id = ".$id);
        }

        public function joinLeaveApplicationStaff(){
            return $this->joinTables("leave_application", "staffs", "staff_id", "");
        }
    }
?>