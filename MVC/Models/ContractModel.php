<?php
    class ContractModel{
        private $contract_id;
        private $staff_id;
        private $start_date;
        private $end_date;
        private $salary;
        public function __construct($staff_id, $start_date, $end_date, $salary, $contract_id = null){
            $this->contract_id = $contract_id;
            $this->staff_id = $staff_id;
            $this->start_date = $start_date;
            $this->end_date = $end_date;
            $this->salary = $salary;
        }
        public function getContract(){
            return $this->contract_id;
        }
        public function setContract($contract_id){
            $this->contract_id = $contract_id;
        }
        public function getStaffId(){
            return $this->staff_id;
        }
        public function setStaffId($staff_id){
            $this->staff_id = $staff_id;
        }
        public function getStartDate(){
            return $this->start_date;
        }
        public function setStartDate($start_date){
            $this->start_date = $start_date;
        }
        public function getEndDate(){
            return $this->end_date;
        }
        public function setEndDate($end_date){
            $this->end_date = $end_date;
        }
        public function getSalary(){
            return $this->salary;
        }
        public function setSalary($salary){
            $this->salary = $salary;
        }
        public function toArray() {
            return array(
                'contract_id' => $this->contract_id,
                'staff_id' => $this->staff_id,
                'start_date' => $this->start_date,
                'end_date' => $this->end_date,
                'salary' => $this->salary
            );
        }
    }
?>