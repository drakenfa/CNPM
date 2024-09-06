<?php
    require_once "./MVC/Models/StatisticModel.php";
    class StatisticService extends Service{
        public $statisticRepo;

        public function __construct(){
            $this->statisticRepo = $this->repository("StatisticRepository");
        }
        
        public function createStatistic(){//$statisticDTO
            $statistic = new StatisticModel("Doanh thu hằng năm", "");
            $this->statisticRepo->createStatistic($statistic);
        }

        public function updateStatistic(){// by id (truyền DTO)
            $statisticData = $this->statisticRepo->getStatisticById("1");
            extract($statisticData);// gán các giá trị cho các key tương ứng với các biến
            $statistic = new StatisticModel(
                "Doanh thu hằng tháng", $value, $statistic_id, $is_active
            );
            $this->statisticRepo->updateStatistic($statistic, "1");
        }

        public function deleteStatistic(){
            $id = "1";
            $this->statisticRepo->deleteStatistic($id);
        }

        public function getAllStatistic(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->statisticRepo->getAllStatistic(), JSON_UNESCAPED_UNICODE);
        }

        public function getStatisticById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->statisticRepo->getStatisticById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>