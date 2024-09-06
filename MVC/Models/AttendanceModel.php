<?php
    class AttendanceModel{
        private $attendance_id;
        private $timesheet_id;
        private $date;
        private $status;
        public function __construct($timesheet_id, $status, $attendance_id = null, $date = null)
        {
            $this->attendance_id = $attendance_id;
            $this->timesheet_id = $timesheet_id;
            $this->date = $date;
            $this->status = $status;
        }
        public function toArray() {
            return array(
                'attendance_id' => $this->attendance_id,
                'timesheet_id' => $this->timesheet_id,
                'date' => $this->date,
                'status' => $this->status,
            );
        }
    }
?>