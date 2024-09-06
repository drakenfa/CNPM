<?php
    class Attendance extends Controller{
        public $attendanceService;
        public function __construct(){
            $this->attendanceService = $this->service("AttendanceService");
        }
        public function SayHi(){
            $this->view("loginSignUp", [
                "Page" => "LoginSignUp"
            ]);
        }
    }
?>