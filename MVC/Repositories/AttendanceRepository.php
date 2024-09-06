<?php
    class AttendanceRepository extends DB{
        public function createAttendance($attendance){
            $this->create("attendance", $attendance, "attendance_id");
        }

        public function updateAttendance($attendance, $id){// by id
            $this->update("attendance", $attendance, "attendance_id = ".$id, "attendance_id");
        }

        public function deleteAttendance($id){// by id
            $this->delete("attendance", "attendance_id = ".$id);
        }

        public function getAllAttendance(){
            return $this->readDontHaveIsActive("attendance");
        }
        
        public function getAttendanceById($id){
            return $this->getAllByWhere("attendance", "attendance_id = ".$id);
        }

        public function getAllDataAttendance(){
            $this->set("INSERT INTO timesheets (`contract_id`, `month`, `year`, `days_worked`, `days_off`, `days_leave`, `days_late`)
                        SELECT contracts.contract_id, MONTH(CURDATE()), YEAR(CURDATE()), 0, 0, 0, 0
                        FROM contracts
                        WHERE NOT EXISTS (
                            SELECT 1 FROM timesheets 
                            WHERE month = MONTH(CURDATE()) AND year = YEAR(CURDATE()) AND contract_id = contracts.contract_id
                        )
                        AND CURDATE() BETWEEN contracts.start_date AND contracts.end_date;");
            $this->set("INSERT INTO attendance (timesheet_id, date, status)
                        SELECT timesheet_id, CURDATE(), 'Chưa điểm danh'
                        FROM timesheets
                        INNER JOIN contracts ON timesheets.contract_id = contracts.contract_id
                        INNER JOIN staffs ON contracts.staff_id = staffs.staff_id
                        INNER JOIN accounts ON staffs.account_id = accounts.account_id
                        WHERE month = MONTH(CURDATE()) AND year = YEAR(CURDATE())
                        AND accounts.is_active = 1
                        AND NOT EXISTS (
                            SELECT 1 FROM attendance 
                            WHERE date = CURDATE() AND timesheet_id = timesheets.timesheet_id
                        );");
            return $this->get("SELECT 
                                attendance.attendance_id, 
                                staffs.staff_fullname, 
                                attendance.date, 
                                attendance.status, 
                                attendance.leave_application_id
                            FROM 
                                attendance
                            INNER JOIN 
                                timesheets ON attendance.timesheet_id = timesheets.timesheet_id
                            INNER JOIN 
                                contracts ON timesheets.contract_id = contracts.contract_id
                            INNER JOIN 
                                staffs ON contracts.staff_id = staffs.staff_id
                            WHERE 
                                attendance.date = CURDATE();
                            ");
        }

        public function updateStatus($attendance_id, $status){
            return $this->set("UPDATE attendance
                            SET status = '$status'
                            WHERE attendance_id = $attendance_id;");
        }
    }
?>