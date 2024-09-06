<?php
    class TimesheetModel{
        private $contract_id;
        private $month;
        private $year;
        private $days_worked;
        private $days_off;
        private $days_late;
        private $timesheet_id;
        public function __construct($contract_id, $month, $year, $days_worked, $days_off, $days_late, $timesheet_id = null)
        {
            $this->contract_id = $contract_id;
            $this->month = $month;
            $this->year = $year;
            $this->days_worked = $days_worked;
            $this->days_off = $days_off;
            $this->days_late = $days_late;
            $this->timesheet_id = $timesheet_id;
        }
        public function getContractId(){
            return $this->contract_id;
        }
    
        public function setContractId($contract_id){
            $this->contract_id = $contract_id;
        }
    
        public function getMonth(){
            return $this->month;
        }
    
        public function setMonth($month){
            $this->month = $month;
        }
    
        public function getYear(){
            return $this->year;
        }
    
        public function setYear($year){
            $this->year = $year;
        }
    
        public function getDaysWorked(){
            return $this->days_worked;
        }
    
        public function setDaysWorked($days_worked){
            $this->days_worked = $days_worked;
        }
    
        public function getDaysOff(){
            return $this->days_off;
        }
    
        public function setDaysOff($days_off){
            $this->days_off = $days_off;
        }
    
        public function getDaysLate(){
            return $this->days_late;
        }
    
        public function setDaysLate($days_late){
            $this->days_late = $days_late;
        }

        public function getTimesheet(){
            return $this->timesheet_id;
        }
    
        public function setTimesheet($timesheet_id){
            $this->timesheet_id = $timesheet_id;
        }

        public function toArray() {
            return array(
                'timesheet_id' => $this->timesheet_id,
                'contract_id' => $this->contract_id,
                'month' => $this->month,
                'year' => $this->year,
                'days_worked' => $this->days_worked,
                'days_off' => $this->days_off,
                'days_late' => $this->days_late
            );
        }
    }
?>