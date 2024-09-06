<?php
    require_once "./MVC/Models/AttendanceModel.php";
    class AttendanceService extends Service{
        public $attendanceRepo;

        public function __construct(){
            $this->attendanceRepo = $this->repository("AttendanceRepository");
        }
        
        public function createAttendance(){//$reviewDTO
            $attendance = new AttendanceModel("31", "2", "2024-04-01", "Present");
            $this->attendanceRepo->createAttendance($attendance);
        }

        public function updateAttendance(){// by id (truyền DTO)
            $attendanceData = $this->attendanceRepo->getAttendanceById("31");
            extract($attendanceData);// gán các giá trị cho các key tương ứng với các biến
            $attendance = new AttendanceModel(
                $timesheet_id, $status, $attendance_id, $date
            );
            $this->attendanceRepo->updateAttendance($attendance, "1");
        }

        public function deleteAttendance(){
            $id = "1";
            $this->attendanceRepo->deleteAttendance($id);
        }

        public function getAllAttendance(){
            return $this->attendanceRepo->getAllAttendance();
        }

        public function getAttendanceById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->attendanceRepo->getAttendanceById($id), JSON_UNESCAPED_UNICODE);
        }

        public function getAllDataAttendance(){
            return $this->attendanceRepo->getAllDataAttendance();
        }

        public function updateStatus($attendance_id, $status){
            return $this->attendanceRepo->updateStatus($attendance_id, $status);
        }
    }
?>