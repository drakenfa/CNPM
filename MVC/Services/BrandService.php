<?php
    require_once "./MVC/Models/BrandModel.php";
    class BrandService extends Service{
        public $brandRepo;

        public function __construct(){
            $this->brandRepo = $this->repository("BrandRepository");
        }
        
        public function createBrand(){
            $brand = new BrandModel("Chin Su", "", "NCC001");
            $this->brandRepo->createBrand($brand);
        }

        public function updateBrand(){// by id (truyền DTO)
            $brandData = $this->brandRepo->getBrandById("19");
            extract($brandData);// gán các giá trị cho các key tương ứng với các biến
            $brand = new BrandModel(
                "Chin Su Food", $brand_logo, $supplier_id, $brand_id, $is_active
            );
            $this->brandRepo->updateBrand($brand, "19");
        }

        public function deleteBrand(){
            $id = "19";
            $this->brandRepo->deleteBrand($id);
        }

        public function getAllBrand(){
            return $this->brandRepo->getAllBrand();
        }

        public function getBrandById(){
            $id = "5";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->brandRepo->getBrandById($id), JSON_UNESCAPED_UNICODE);
        }
    }
?>