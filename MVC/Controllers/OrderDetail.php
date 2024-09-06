<?php
    class OrderDetail extends Controller{
        public $orderDetailService;
        public function __construct(){
            $this->orderDetailService = $this->service("OrderDetailService");
        }
        public function CreateOrderDetail(){
            $this->orderDetailService->createOrderDetail();
        }
        public function UpdateOrderDetail(){
            $this->orderDetailService->updateOrderDetail();
        }
        public function DeleteOrderDetail(){
            $this->orderDetailService->deleteOrderDetail();
        }
        public function GetAllOrderDetail(){
            $this->orderDetailService->getAllOrderDetail();
        }
        public function GetOrderDetailById(){
            $this->orderDetailService->GetOrderDetailById();
        }
        public function GetOrderDetailByOrderId(){
            $this->orderDetailService->GetOrderDetailByOrderId();
        }
    }
?>