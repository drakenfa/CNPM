<?php
    class Timesheet extends Controller{
        public $timesheetService;
        public function __construct(){
            $this->timesheetService = $this->service("TimesheetService");
        }
        public function CreateTimesheet(){
            $this->timesheetService->createTimesheet();
        }
        public function UpdateTimesheet(){
            $this->timesheetService->updateTimesheet();
        }
        public function GetAllTimesheet(){
            $this->timesheetService->getAllTimesheet();
        }
        public function GetTimesheetById(){
            $this->timesheetService->GetTimesheetById();
        }
    }
?>