<?php
    require_once "./MVC/Models/OptionModel.php";
    class OptionService extends Service{
        public $optionRepo;

        public function __construct(){
            $this->optionRepo = $this->repository("OptionRepository");
        }
        
        public function createOption(){//$optionDTO
            $option = new OptionModel("1", "8GB", "256GB", "A15 Bionic - 6 lõi: 2 hiệu suất, 4 hiệu quả, 3.2 GHz", "Đen", "4500", "7.2", "20");
            $this->optionRepo->createOption($option);
        }

        public function updateOption(){// by id (truyền DTO)
            $optionData = $this->optionRepo->getOptionById("1");
            extract($optionData);// gán các giá trị cho các key tương ứng với các biến
            $option = new OptionModel(
                $product_id, $ram, $rom, $chip, "Trắng", $battery, $screen, $wh, $option_id, $is_active
            );
            $this->optionRepo->updateOption($option, "1");
        }

        public function deleteOption(){
            $id = "1";
            $this->optionRepo->deleteOption($id);
        }

        public function getAllOption(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->optionRepo->getAllOption(), JSON_UNESCAPED_UNICODE);
        }

        public function getOptionById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->optionRepo->getOptionById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>