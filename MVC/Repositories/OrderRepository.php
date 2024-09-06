<?php
class OrderRepository extends DB{
    public function createOrder($order){
        $order_ids=$this->create("orders", $order, "order_id");
        $order_id = $order_ids['order_id'];
        return $order_id;

    }

    public function getQuantityOrderByStatus($status_of_order){
        return $this->getCountColumn("orders", "order_id","status_of_order = '" .$status_of_order."'");
    }
    public function getQuantityStaffByRole($role_id){
        return $this->getCountColumn("staffs", "staff_id", "role_id = ".$role_id);
    }
    public function deleteOrder($id){// by id
        $this->delete("orders", "order_id = ".$id);
    }
    public function updateOrder($order, $id){// by id
        $this->update("orders", $order, "order_id = ".$id,"order_id");
    }
    public function updateOrderStatus($orderData) {
        $order_id = $orderData->order_id;
        $whereCondition = "order_id = '$order_id'";
        return $this->update("orders", $order_id, $whereCondition, "order_id");
    }
    
    
    public function getAllOrder(){
        return $this->read("orders");
    }
    
    public function getOrderById($id){
        return $this->getAllByWhere("orders", "order_id = ".$id);
    }
    public function getOrderbyAccount($id){
        return $this->getAllByWhere("orders", "account_id= ".$id);
    }
    // public function joinOrderOrderdetails(){
    //     return $this->joinTablesNotwhere("orders", "order_details","order_id");
    // }
    public function joinOrderOrderdetails(){
        return $this->join3TablesNotWhere("orders", "order_details","skus","orders.order_id=order_details.order_id","order_details.sku_id=skus.sku_id");
    }
    public function getQuantityAllOrder(){
        return $this->getCountColumn("orders", "order_id", "");
    }
    public function getAllDataStatistic(){
        return $this->get("SELECT DISTINCT
                            od.order_detail_id,
                            p.product_name,
                            c.category_name,
                            s.unit_price_import,
                            od.price,
                            od.number_of_products,
                            DATE(e.export_date) AS export_date,
                            (od.price - s.unit_price_import) * od.number_of_products as 'profit'
                        FROM 
                            products p
                        JOIN 
                            skus sku ON p.product_id = sku.product_id
                        JOIN 
                            categories c ON p.category_id = c.category_id
                        JOIN 
                            order_details od ON sku.sku_id = od.sku_id
                        JOIN 
                            orders o ON o.order_id = od.order_id
                        JOIN 
                            shipments s ON sku.sku_id = s.sku_id
                        JOIN exports e ON o.order_id = e.order_id
                        WHERE 
                            o.status_of_order = 'Shipped';
    ");
    }
    public function getAllDataStatisticByTime($start_date, $end_date){
        return $this->get("SELECT DISTINCT
                            od.order_detail_id,
                            p.product_name,
                            c.category_name,
                            s.unit_price_import,
                            od.price,
                            od.number_of_products,
                            DATE(e.export_date) AS export_date,
                            (od.price - s.unit_price_import) * od.number_of_products as 'profit'
                        FROM products p
                        JOIN skus sku ON p.product_id = sku.product_id
                        JOIN categories c ON p.category_id = c.category_id
                        JOIN order_details od ON sku.sku_id = od.sku_id
                        JOIN orders o ON o.order_id = od.order_id
                        JOIN shipments s ON sku.sku_id = s.sku_id
                        JOIN exports e ON o.order_id = e.order_id
                        WHERE o.status_of_order = 'Shipped'
                        AND DATE(e.export_date) BETWEEN '$start_date' AND '$end_date';
    ");
    }
}
?>
