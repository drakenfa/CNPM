<?php
    class TimesheetDetailModel{
        private $timesheet_id;
        private $total_salary;
        private $timesheet_detail_id;   
        public function __construct($timesheet_id, $total_salary, $timesheet_detail_id = null)
        {
            $this->timesheet_id = $timesheet_id;
            $this->total_salary = $total_salary;
            $this->timesheet_detail_id = $timesheet_detail_id;
        }
        public function getTimesheetId(){
            return $this->timesheet_id;
        }
    
        public function setTimesheetId($timesheet_id){
            $this->timesheet_id = $timesheet_id;
        }
    
        public function getTotalSalary(){
            return $this->total_salary;
        }
    
        public function setTotalSalary($total_salary){
            $this->total_salary = $total_salary;
        }
    
        public function getTimesheetDetailId(){
            return $this->timesheet_detail_id;
        }
    
        public function setTimesheetDetailId($timesheet_detail_id){
            $this->timesheet_detail_id = $timesheet_detail_id;
        }

        public function toArray() {
            return array(
                'timesheet_detail_id' => $this->timesheet_detail_id,
                'timesheet_id' => $this->timesheet_id,
                'total_salary' => $this->total_salary
            );
        }
    }
?>