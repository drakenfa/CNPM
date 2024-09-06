<?php
    require_once "./MVC/Models/SkuModel.php";
    class SkuService extends Service{
        public $skuRepo;

        public function __construct(){
            $this->skuRepo = $this->repository("SkuRepository");
        }
        
        public function createSku(){//$skuDTO
            $sku = new SkuModel("#RED4500", "1", "1");
            $this->skuRepo->createSku($sku);
        }

        public function updateSku(){// by id (truyền DTO)
            $skuData = $this->skuRepo->getSkuById("1");
            extract($skuData);// gán các giá trị cho các key tương ứng với các biến
            $sku = new SkuModel(
                "#GRE4500", $product_id, $option_id, $sku_id, $is_active
            );
            $this->skuRepo->updateSku($sku, "1");
        }

        public function deleteSku(){
            $id = "1";
            $this->skuRepo->deleteSku($id);
        }

        public function getAllSku(){
            return $this->skuRepo->getAllSku(); 
        }


        public function getSkuById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->skuRepo->getSkuById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>