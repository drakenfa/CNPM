<?php
    class OrderModel{
        private $staff_id;
        private $account_id;
        private $receiver_name;
        private $email_of_receiver;
        private $phone_number_of_receiver;
        private $note;
        private $total_money;
        private $shipping_method;
        private $shipping_address;
        private $shipping_date;
        private $tracking_number;
        private $payment_method;
        private $order_id;
        private $order_date;
        private $status_of_order;
        private $is_active;
        public function __construct($staff_id, $account_id, $receiver_name, $email_of_receiver, $phone_number_of_receiver, $note,$total_money ,$shipping_method, $shipping_address,$tracking_number, $payment_method, $shipping_date='1990-01-01 00:00:00' , $order_id = null, $order_date = null, $status_of_order = null, $is_active = null)
        {
            $this->staff_id = $staff_id;
            $this->account_id = $account_id;
            $this->receiver_name = $receiver_name;
            $this->email_of_receiver = $email_of_receiver;
            $this->phone_number_of_receiver = $phone_number_of_receiver;
            $this->note = $note;
            $this->total_money = $total_money;
            $this->shipping_method = $shipping_method;
            $this->shipping_address = $shipping_address;
            $this->shipping_date = $shipping_date;
            $this->tracking_number = $tracking_number;
            $this->payment_method = $payment_method;
            $this->order_id = $order_id;
            $this->order_date = $order_date;
            $this->status_of_order = $status_of_order;
            $this->is_active = $is_active;
        }
        public function getStaffId(){
            return $this->staff_id;
        }
    
        public function setStaffId($staff_id){
            $this->staff_id = $staff_id;
        }
    
        public function getAccountId(){
            return $this->account_id;
        }
    
        public function setAccountId($account_id){
            $this->account_id = $account_id;
        }
    
        public function getReceiverName(){
            return $this->receiver_name;
        }
    
        public function setReceiverName($receiver_name){
            $this->receiver_name = $receiver_name;
        }
    
        public function getEmailOfReceiver(){
            return $this->email_of_receiver;
        }
    
        public function setEmailOfReceiver($email_of_receiver){
            $this->email_of_receiver = $email_of_receiver;
        }
    
        public function getPhoneNumberOfReceiver(){
            return $this->phone_number_of_receiver;
        }
    
        public function setPhoneNumberOfReceiver($phone_number_of_receiver){
            $this->phone_number_of_receiver = $phone_number_of_receiver;
        }
    
        public function getNote(){
            return $this->note;
        }
    
        public function setNote($note){
            $this->note = $note;
        }
    
        public function getTotalMoney(){
            return $this->total_money;
        }
    
        public function setTotalMoney($total_money){
            $this->total_money = $total_money;
        }
    
        public function getShippingMethod(){
            return $this->shipping_method;
        }
    
        public function setShippingMethod($shipping_method){
            $this->shipping_method = $shipping_method;
        }
    
        public function getShippingAddress(){
            return $this->shipping_address;
        }
    
        public function setShippingAddress($shipping_address){
            $this->shipping_address = $shipping_address;
        }
    
        public function getShippingDate(){
            return $this->shipping_date;
        }
    
        public function setShippingDate($shipping_date){
            $this->shipping_date = $shipping_date;
        }
    
        public function getTrackingNumber(){
            return $this->tracking_number;
        }
    
        public function setTrackingNumber($tracking_number){
            $this->tracking_number = $tracking_number;
        }
    
        public function getPaymentMethod(){
            return $this->payment_method;
        }
    
        public function setPaymentMethod($payment_method){
            $this->payment_method = $payment_method;
        }
    
        public function getOrderId(){
            return $this->order_id;
        }
    
        public function setOrderId($order_id){
            $this->order_id = $order_id;
        }
    
        public function getOrderDate(){
            return $this->order_date;
        }
    
        public function setOrderDate($order_date){
            $this->order_date = $order_date;
        }
    
        public function getStatusOfOrder(){
            return $this->status_of_order;
        }
    
        public function setStatusOfOrder($status_of_order){
            $this->status_of_order = $status_of_order;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        // public function updateOrderStatus($status) {
        //     $this->status_of_order = $status;
        // }
        public function toArray() {
            return array(
                'order_id' => $this->order_id,
                'staff_id' => $this->staff_id,
                'account_id' => $this->account_id,
                'receiver_name' => $this->receiver_name,
                'email_of_receiver' => $this->email_of_receiver,
                'phone_number_of_receiver' => $this->phone_number_of_receiver,
                'note' => $this->note,
                'order_date' => $this->order_date,
                'status_of_order' => $this->status_of_order,
                'total_money' => $this->total_money,
                'shipping_method' => $this->shipping_method,
                'shipping_address' => $this->shipping_address,
                'shipping_date' => $this->shipping_date,
                'tracking_number' => $this->tracking_number,
                'payment_method' => $this->payment_method,
                'is_active' => $this->is_active
            );
        }
    }
?>