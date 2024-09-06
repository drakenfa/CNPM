<?php
    class Statistic extends Controller{
        public $statisticService;
        public function __construct(){
            $this->statisticService = $this->service("StatisticService");
        }
        public function CreateStatistic(){
            $this->statisticService->createStatistic();
        }
        public function UpdateStatistic(){
            $this->statisticService->updateStatistic();
        }
        public function DeleteStatistic(){
            $this->statisticService->deleteStatistic();
        }
        public function GetAllStatistic(){
            $this->statisticService->getAllStatistic();
        }
        public function GetStatisticById(){
            $this->statisticService->GetStatisticById();
        }
    }
?>