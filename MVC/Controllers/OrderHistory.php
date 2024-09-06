<?php
    class OrderHistory extends Controller{
        public $orderService;
        public $orderDetailService;

        public function __construct(){
            $this->orderService = $this->service("OrderService");
            $this->orderDetailService = $this->service("OrderDetailService");
        }
        public function GetOrderbyAccount($id){
            
            $orders=$this->orderService->getOrderbyAccount("$id");
            $ordersdetails = $this->orderDetailService->GetOrderDetailByOrderId2($id);
            // echo var_dump($cardValue);
            $data = array("orders" => $orders,"order_details" => $ordersdetails);

            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($data, JSON_UNESCAPED_UNICODE); 
        }
        public function SayHi(){

            $this->view("master",[
                "Page" => "OrderHistory/OrderHistory",
            ]);            
        }  
        public function GetAllOrder(){
            $this->orderService->getAllOrder();
        }
        public function GetOrderById($id){
            $this->orderService->GetOrderById($id);
        }
        
        public function GetInfoOrder(){
            $this->orderService->GetInfoOrder();
        }
        public function GetOrder1(){
            $this->orderService->GetOrder1();
        }
    }
?>