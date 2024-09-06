<?php
    require_once "./MVC/Models/TimesheetModel.php";
    class TimesheetService extends Service{
        public $timesheetRepo;

        public function __construct(){
            $this->timesheetRepo = $this->repository("TimesheetRepository");
        }
        
        public function createTimesheet(){//$timesheetDTO
            $timesheet = new TimesheetModel("1", "1", "2024", "23", "2", "1");
            $this->timesheetRepo->createTimesheet($timesheet);
        }

        public function updateTimesheet(){// by id (truyền DTO)
            $timesheetData = $this->timesheetRepo->getTimesheetById("3");
            extract($timesheetData);// gán các giá trị cho các key tương ứng với các biến
            $timesheet = new TimesheetModel(
                $contract_id, "2", $year, "24", $days_off, $days_late, $timesheet_id
            );
            $this->timesheetRepo->updateTimesheet($timesheet, "3");
        }

        public function getAllTimesheet(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->timesheetRepo->getAllTimesheet(), JSON_UNESCAPED_UNICODE);
        }

        public function getTimesheetById(){
            $id = "3";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->timesheetRepo->getTimesheetById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>