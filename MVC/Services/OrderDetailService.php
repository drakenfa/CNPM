<?php
    require_once "./MVC/Models/OrderDetailModel.php";
    class OrderDetailService extends Service{
        public $orderDetailRepo;

        public function __construct(){
            $this->orderDetailRepo = $this->repository("OrderDetailRepository");
        }
        
        public function createOrderDetail(){//$orderDetailDTO
            $orderDetail = new OrderDetailModel("77", "1", "2000000", "2", "Đen");
            $this->orderDetailRepo->createOrderDetail($orderDetail);
        }

        public function updateOrderDetail(){// by id (truyền DTO)
            $orderDetailData = $this->orderDetailRepo->getOrderDetailById("3");
            extract($orderDetailData);// gán các giá trị cho các key tương ứng với các biến
            $orderDetail = new OrderDetailModel(
                $order_id, $product_id, $price, $number_of_products, "Trắng", $order_detail_id
            );
            $this->orderDetailRepo->updateOrderDetail($orderDetail, "3");
        }

        public function deleteOrderDetail(){
            $id = "3";
            $this->orderDetailRepo->deleteOrderDetail($id);
        }

        public function getAllOrderDetail(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->orderDetailRepo->getAllOrderDetail(), JSON_UNESCAPED_UNICODE);
        }

        public function getOrderDetailById(){
            $id = "1";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->orderDetailRepo->getOrderDetailById($id), JSON_UNESCAPED_UNICODE);
        }
        public function GetOrderDetailByOrderId(){
            return $this->orderDetailRepo->getDetails();
        }
        public function GetOrderDetailByOrderId2($id){

            return $this->orderDetailRepo->read4($id);
        }
    }
?>