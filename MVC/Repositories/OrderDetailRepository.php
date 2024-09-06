<?php
    class OrderDetailRepository extends DB{
        public function createOrderDetail($orderDetail){
            $this->create("order_details", $orderDetail, "order_detail_id");
        }

        public function updateOrderDetail($orderDetail, $id){// by id
            $this->update("order_details", $orderDetail, "order_detail_id = ".$id,"order_detail_id");
        }

        public function deleteOrderDetail($id){// by id
            $this->realDelete("order_details", "order_detail_id = ".$id);
        }

        public function getAllOrderDetail(){
            return $this->readDontHaveIsActive("order_details");
        }
        
        public function getOrderDetailById($id){
            return $this->getAllDontHaveIsActive("order_details", "order_detail_id = ".$id);
        }
        public function GetOrderDetailByOrderId2($id){
            return $this->getAllByWhere2("order_details", "order_id= ".$id);
        }
        //     return $this->getAllByWhere1("order_details", "order_id = 1" .$id );
        // }
        public function getDetails(){
            return $this->readDontHaveIsActive("order_details");
        }
    }
?>