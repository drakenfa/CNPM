<?php
    class LeaveApplicationModel{
        private $leave_application_id;
        private $staff_id;
        private $start_date;
        private $end_date;
        private $reason;
        private $status;
        public function __construct($staff_id, $start_date, $end_date, $reason, $status, $leave_application_id = null)
        {
            $this->leave_application_id = $leave_application_id;
            $this->staff_id = $staff_id;
            $this->start_date = $start_date;
            $this->end_date = $end_date;
            $this->reason = $reason;
            $this->status = $status;
        }
        public function toArray() {
            return array(
                'leave_application_id' => $this->leave_application_id,
                'staff_id' => $this->staff_id,
                'start_date' => $this->start_date,
                'end_date' => $this->end_date,
                'reason' => $this->reason,
                'status' => $this->status
            );
        }
    }
?>