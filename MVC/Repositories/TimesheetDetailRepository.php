<?php
    class TimesheetDetailRepository extends DB{
        public function createTimesheetDetail($timesheetDetail){
            $this->create("timesheet_details", $timesheetDetail, "timesheet_detail_id");
        }

        public function updateTimesheetDetail($timesheetDetail, $id){// by id
            $this->update("timesheet_details", $timesheetDetail, "timesheet_detail_id = ".$id, "timesheet_detail_id");
        }

        public function getAllTimesheetDetail(){
            return $this->readDontHaveIsActive("timesheet_details");
        }
        
        public function getTimesheetDetailById($id){
            return $this->getAllDontHaveIsActive("timesheet_details", "timesheet_detail_id = ".$id);
        }

        public function getSalaryTable(){
            return $this->get("SELECT 
                                    s.staff_id, 
                                    s.staff_fullname, 
                                    c.contract_id, 
                                    t.month, 
                                    t.year, 
                                    CONCAT(FORMAT(c.salary, 0, 'en_US'), 'đ') as salary, 
                                    CONCAT(FORMAT(td.total_salary, 0, 'en_US'), 'đ') as total_salary
                                FROM 
                                    staffs s
                                JOIN 
                                    contracts c ON s.staff_id = c.staff_id
                                JOIN 
                                    timesheets t ON c.contract_id = t.contract_id
                                JOIN 
                                    timesheet_details td ON t.timesheet_id = td.timesheet_id;
                                ");
        }

        public function getAllMonth(){
            return $this->get("SELECT DISTINCT month FROM timesheets ORDER BY month ASC");
        }
        public function getAllYear(){
            return $this->get("SELECT DISTINCT year FROM timesheets ORDER BY year ASC");
        }
        public function getAllDataTimesheet(){
            return $this->get("SELECT 
                                    t.timesheet_id, 
                                    s.staff_id,
                                    s.staff_fullname, 
                                    t.month, 
                                    t.year, 
                                    t.days_worked, 
                                    t.days_off, 
                                    t.days_leave, 
                                    t.days_late, 
                                    CONCAT(FORMAT(td.total_salary, 0, 'en_US'), 'đ') as total_salary
                                FROM 
                                    timesheets t
                                INNER JOIN 
                                    timesheet_details td ON t.timesheet_id = td.timesheet_id
                                INNER JOIN 
                                    contracts c ON t.contract_id = c.contract_id
                                INNER JOIN 
                                    staffs s ON c.staff_id = s.staff_id
                                ORDER BY t.timesheet_id ASC
                                ");
        }

        public function getTotalSalaryByMonth($year){
            return $this->get("SELECT t.month AS `month`, 
                SUM(td.total_salary) AS `total_salary`
                FROM `timesheets` t
                JOIN `timesheet_details` td ON t.`timesheet_id` = td.`timesheet_id`
                WHERE t.year = $year
                GROUP BY t.month;
            ");
        }

        public function getSalaryByStaffId($staff_id){
            return $this->get("SELECT 
                                    c.contract_id, 
                                    t.month, 
                                    t.year, 
                                    CONCAT(FORMAT(td.total_salary, 0, 'en_US'), 'đ') as total_salary
                                FROM 
                                    staffs s
                                JOIN 
                                    contracts c ON s.staff_id = c.staff_id
                                JOIN 
                                    timesheets t ON c.contract_id = t.contract_id
                                JOIN 
                                    timesheet_details td ON t.timesheet_id = td.timesheet_id
                                WHERE c.staff_id = $staff_id
                                ");
        }

        public function getTotalSalaryByQuarter($year){
            return $this->get("SELECT QUARTER(CONCAT_WS('-', t.year, t.month, '01')) AS `quarter`, 
                SUM(td.total_salary) AS `total_salary`
                FROM `timesheets` t
                JOIN `timesheet_details` td ON t.`timesheet_id` = td.`timesheet_id`
                WHERE t.year = $year
                GROUP BY QUARTER(CONCAT_WS('-', t.year, t.month, '01'));
            ");
        }
        
        public function getDistinctYear(){
            return $this->get("SELECT DISTINCT year
                FROM `timesheets`
                ORDER BY year ASC;
            ");
        }
    }
?>