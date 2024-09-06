<?php
    class LeaveApplication extends Controller{
        public $leaveApplicationService;
        public function __construct(){
            $this->leaveApplicationService = $this->service("LeaveApplicationService");
        }
        public function ApproveApplication($id){
            $this->leaveApplicationService->approveLeaveApplication($id);
            header("location: ../../InternalManager/LeaveApplicationManager");
        }
        public function ApproveLeaveApplication(){
            $staff_id = $_POST['staff_id_leave'];
            $start_date = $_POST['start_date'];
            $end_date = $_POST['end_date'];
            $this->leaveApplicationService->createLeaveApplication($staff_id, $start_date, $end_date);
            header("location: ../InternalManager/PersonalInfoManager");
        }
        public function ApproveSickApplication(){
            $staff_id = $_POST['staff_id_sick'];
            $start_date = $_POST['start_date'];
            $end_date = $_POST['end_date'];
            $this->leaveApplicationService->createSickApplication($staff_id, $start_date, $end_date);
            header("location: ../InternalManager/PersonalInfoManager");
        }
        public function ApproveDemistApplication(){
            $staff_id = $_POST['staff_id_demist'];
            $current_date = date('Y-m-d');
            $this->leaveApplicationService->createDemistApplication($staff_id, $current_date, $current_date);
            header("location: ../InternalManager/PersonalInfoManager");
        }

        public function GetLeaveApplicationById($id){
            $this->leaveApplicationService->getLeaveApplicationById($id);
        }   


    }
?>