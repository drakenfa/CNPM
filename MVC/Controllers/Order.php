<?php
    class Order extends Controller{
        public $orderService;
        public $orderDetailService;
        public $exportService;
        public $exportDetailsService;
        public function __construct(){
            $this->orderService = $this->service("OrderService");
            $this->exportService = $this->service("ExportService");
            $this->exportDetailsService = $this->service("ExportDetailService");
        }
        public function CreateOrder($account,$t){
            $account_id = $account;

            $receiver_name = $_POST["name"];
            $email_of_receiver = $_POST["email"];
            $phone_number_of_receiver = $_POST["phone_number"];
            $shipping_address = $_POST["address"];
            $note = $_POST["note"];
            $shipping_method = $_POST["shipping_method"];
            $tracking_number = $_POST["tracking_number"];
            $payment_method = $_POST["payment_method"];
            $data = $_POST['data']; 
            $orderData = json_decode($data, true);
            var_dump($data);           
             $this->orderService->createOrder($account_id,$receiver_name, $email_of_receiver, $phone_number_of_receiver,$note,$t,$shipping_method,$shipping_address,$tracking_number,$payment_method,$orderData);
        }
        public function UpdateOrder(){
            $this->orderService->updateOrder();
        }
        public function CancelledOrder($order_id){
            $this->orderService->CancelledOrder($order_id);
        }
        public function CancelledOrder2($order_id){
            $this->orderService->CancelledOrder2($order_id);
        }
        public function UpdateStatusOrder($order_id){
            $this->orderService->UpdateStatusOrder($order_id);
        }
        
        // public function CancelledOrder($order_id) {
        //     // Lấy thông tin đơn hàng từ cơ sở dữ liệu
        //     $orderData = $this->orderService->getOrderById($order_id);
            
        //     // Kiểm tra xem $orderData có giá trị null không
        //     if ($orderData) {
        //         // Cập nhật trạng thái của đơn hàng thành "Cancelled"
        //         $orderData->updateOrderStatus("Cancelled");
            
        //         // Gọi phương thức để cập nhật trạng thái trong cơ sở dữ liệu
        //         $this->orderService->updateOrderStatus($orderData);
        //     } else {
        //         // Xử lý trường hợp không tìm thấy thông tin đơn hàng
        //         echo "Không tìm thấy thông tin đơn hàng.";
        //     }
        // }
        
        public function DeleteOrder(){
            $this->orderService->deleteOrder();
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
        public function GetAllDataStatisticByTime($start_date, $end_date){
            header('Content-Type: application/json');
            echo json_encode($this->orderService->getAllDataStatisticByTime($start_date, $end_date), JSON_UNESCAPED_UNICODE);
        }
    }
?>