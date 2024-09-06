<?php
require_once "./MVC/Models/OrderModel.php";
require_once "./MVC/Models/OrderDetailModel.php";
class OrderService extends Service{
    public $orderRepo;
    public $orderDetailRepo;

    public $exportRepo;
    public function __construct(){
        $this->orderRepo = $this->repository("OrderRepository");
        $this->orderDetailRepo = $this->repository("OrderDetailRepository");
    }
    
    // public function createOrder($receiver_name, $email_of_receiver, $phone_number_of_receiver, $shipping_address, $note){//$staffDTO
    //         $order_id = $this->createOrderdetails($email, $password, $avatar, $phoneNumber)['order_id'];
    //         $order = new OrderModel("","1",$receiver_name, $email_of_receiver,$phone_number_of_receiver,$note,"VNPT",$shipping_address,"","","COD");
    //         $this->orderRepo->createOrder($order);
        
    // }
    public function createOrder($account_id,$receiver_name, $email_of_receiver, $phone_number_of_receiver,$note,$t,$shipping_method,$shipping_address,$tracking_number,$payment_method,$orderData){
        $staff_id = "3" ;
        $order = new OrderModel($staff_id,$account_id,$receiver_name, $email_of_receiver, $phone_number_of_receiver,$note,$t,$shipping_method,$shipping_address,$tracking_number,$payment_method);
        $order_id =$this->orderRepo->createOrder($order);
        // echo $order_id;
        foreach ($orderData as $order_Data) {
            $OrderDetailModel = new OrderDetailModel(
                $order_id,
                $order_Data['sku'],
                $order_Data['price'],
                $order_Data['number'],
                "Vàng"
            );
        
            $this->orderDetailRepo->createOrderDetail($OrderDetailModel);
        }
        header("location: ../../../Home/");

    }
    // public function updateOrder(){
    //     $orderData = $this->orderRepo->getOrderById("3");
    //     extract($orderData);
    //     $order = new OrderModel(
    //         $staff_id, $account_id, "Anh Hiển đẹp trai", $email_of_receiver, $phone_number_of_receiver, "Gửi tặng anh Hiển nha!", $shipping_method, $shipping_address, $shipping_date, $tracking_number, $payment_method, $total_money, $order_id, $order_date, $status_of_order, $is_active
    //     );
    //     $this->orderRepo->updateOrder($order, "3");
    // }
    public function updateOrder(){
        $orderData = $this->orderRepo->getAllOrder();
        extract($orderData);
        $order = new OrderModel(
            $staff_id, $account_id, "Anh Hiển đẹp trai", $email_of_receiver, $phone_number_of_receiver, "Gửi tặng anh Hiển nha!", $shipping_method, $shipping_address, $shipping_date, $tracking_number, $payment_method, $total_money, $order_id, $order_date, $status_of_order, $is_active
        );
        $this->orderRepo->updateOrder($order, "3");
    }
    public function CancelledOrder($order_id){
        // Lấy thông tin đơn hàng từ repository
        $orderData = $this->getOrderById($order_id);

        if ($orderData === null) {
            // Handle the case where no order data is found
            // $response = ["error" => "Order not found"];
        } else {
            // $response = array("orderData" => $orderData);
            $staff_id = $orderData[0]['staff_id'];  
            $account_id = $orderData[0]['account_id'];    
            $receiver_name=$orderData[0]['receiver_name'];
            $email_of_receiver = $orderData[0]['email_of_receiver'];
            $phone_number_of_receiver = $orderData[0]['phone_number_of_receiver'];
            $note=$orderData[0]['note'];
            $shipping_method = $orderData[0]['shipping_method'];
            $shipping_address = $orderData[0]['shipping_address'];
            $shipping_date=$orderData[0]['shipping_date'];
            $tracking_number = $orderData[0]['tracking_number'];
            $payment_method = $orderData[0]['payment_method'];
            $total_money=$orderData[0]['total_money'];
            $order_date=$orderData[0]['order_date'];
            $is_active=$orderData[0]['is_active'];  
        }

         extract($orderData);
         $total_money=$orderData[0]['total_money'];

        // Tạo một đối tượng OrderModel mới với trạng thái đã hủy
        $order = new OrderModel(
            "3", $account_id, $receiver_name, $email_of_receiver, $phone_number_of_receiver, 
            $note,$total_money, $shipping_method, $shipping_address,$tracking_number,  
            $payment_method,$shipping_date, $order_id,$order_date ,"Cancelled", $is_active
        );
    
        // Cập nhật đơn hàng trong repository
        $this->orderRepo->updateOrder($order, $order_id); 
        header("location: ../../../web-ban-hang/InternalManager/OrderManager");
    }
    public function CancelledOrder2($order_id){
        // Lấy thông tin đơn hàng từ repository
        $orderData = $this->getOrderById($order_id);

        if ($orderData === null) {
            // Handle the case where no order data is found
            // $response = ["error" => "Order not found"];
        } else {
            // $response = array("orderData" => $orderData);
            $staff_id = $orderData[0]['staff_id'];  
            $account_id = $orderData[0]['account_id'];    
            $receiver_name=$orderData[0]['receiver_name'];
            $email_of_receiver = $orderData[0]['email_of_receiver'];
            $phone_number_of_receiver = $orderData[0]['phone_number_of_receiver'];
            $note=$orderData[0]['note'];
            $shipping_method = $orderData[0]['shipping_method'];
            $shipping_address = $orderData[0]['shipping_address'];
            $shipping_date=$orderData[0]['shipping_date'];
            $tracking_number = $orderData[0]['tracking_number'];
            $payment_method = $orderData[0]['payment_method'];
            $total_money=$orderData[0]['total_money'];
            $order_date=$orderData[0]['order_date'];
            $is_active=$orderData[0]['is_active'];  
        }

         extract($orderData);
         $total_money=$orderData[0]['total_money'];

        // Tạo một đối tượng OrderModel mới với trạng thái đã hủy
        $order = new OrderModel(
            "3", $account_id, $receiver_name, $email_of_receiver, $phone_number_of_receiver, 
            $note,$total_money, $shipping_method, $shipping_address,$tracking_number,  
            $payment_method,$shipping_date, $order_id,$order_date ,"Cancelled", $is_active
        );
    
        // Cập nhật đơn hàng trong repository
        $this->orderRepo->updateOrder($order, $order_id); 
        header("location: ../../OrderHistory/");
    }
    public function UpdateStatusOrder($order_id){
        // Lấy thông tin đơn hàng từ repository
        $orderData = $this->getOrderById($order_id);

        if ($orderData === null) {
            // Handle the case where no order data is found
            // $response = ["error" => "Order not found"];
        } else {
            // $response = array("orderData" => $orderData);
            $staff_id = $orderData[0]['staff_id'];  
            $account_id = $orderData[0]['account_id'];    
            $receiver_name=$orderData[0]['receiver_name'];
            $email_of_receiver = $orderData[0]['email_of_receiver'];
            $phone_number_of_receiver = $orderData[0]['phone_number_of_receiver'];
            $note=$orderData[0]['note'];
            $shipping_method = $orderData[0]['shipping_method'];
            $shipping_address = $orderData[0]['shipping_address'];
            $shipping_date=$orderData[0]['shipping_date'];
            $tracking_number = $orderData[0]['tracking_number'];
            $payment_method = $orderData[0]['payment_method'];
            $total_money=$orderData[0]['total_money'];
            $order_date=$orderData[0]['order_date'];
            $status_of_order=$orderData[0]['status_of_order'];
            if ($status_of_order === "Pending") {
                $staff_id ="3";
                $status_of_order = "Processing";
            } elseif ($status_of_order === "Processing") {
                $status_of_order = "Shipped";
                // $this->orderRepo->updateOrder($order, $order_id); 
            } elseif ($status_of_order === "Shipped") {
                $status_of_order = "Delivered";
            }
            $is_active=$orderData[0]['is_active'];  
        }

         extract($orderData);
    
        // Tạo một đối tượng OrderModel mới với trạng thái đã hủy
        $order = new OrderModel(
            "3", $account_id, $receiver_name, $email_of_receiver, $phone_number_of_receiver, 
            $note,$total_money, $shipping_method, $shipping_address,$tracking_number,  
            $payment_method,$shipping_date, $order_id,$order_date ,$status_of_order, $is_active
        );

    
        // Cập nhật đơn hàng trong repository
        $this->orderRepo->updateOrder($order, $order_id); 
        header("location: ../../../web-ban-hang/InternalManager/OrderManager");
    }

    public function updateOrderStatus($orderData) {
        $this->orderRepo->updateOrderStatus($orderData);
    }
    public function deleteOrder(){
        $id = "3";
        $this->orderRepo->deleteOrder($id);
    }

    public function getAllOrder(){
        header('Content-Type: application/json');
        echo json_encode($this->orderRepo->getAllOrder(), JSON_UNESCAPED_UNICODE);
    }

    public function getQuantityAllOrder(){
        return $this->orderRepo->getQuantityAllOrder();
    }

    public function getQuantityOrderByStatus($status_of_order){
        return $this->orderRepo->getQuantityOrderByStatus($status_of_order);
    }
    public function getInfoOrder(){
        return $this->orderRepo->joinOrderOrderdetails();
    }
    public function getOrder1(){
        return $this->orderRepo->getAllOrder();
    }
    public function getOrderById($id) {
        header('Content-Type: application/json');
        echo json_encode($this->orderRepo->getOrderById($id), JSON_UNESCAPED_UNICODE);
        return $this->orderRepo->getOrderById($id);
    }
    public function getOrderbyAccount($id) {
        $orders = $this->orderRepo->getOrderbyAccount($id);     
        // return $orders['order_id'];
        return $orders;
    }
    public function getAllDataStatistic(){
        return $this->orderRepo->getAllDataStatistic();
    }
    public function getAllDataStatisticByTime($start_date, $end_date){
        return $this->orderRepo->getAllDataStatisticByTime($start_date, $end_date);
    }
}
?>
