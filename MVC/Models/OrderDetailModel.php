<?php
    class OrderDetailModel{
        private $order_id;
        private $sku_id;
        private $price;
        private $color_of_product;
        private $number_of_products;
        private $order_detail_id;
        public function __construct($order_id, $sku_id, $price, $number_of_products, $color_of_product, $order_detail_id = null)
        {
            $this->order_id = $order_id;
            $this->sku_id = $sku_id;
            $this->price = $price;
            $this->color_of_product = $color_of_product;
            $this->number_of_products = $number_of_products;
            $this->order_detail_id = $order_detail_id;
        }
        public function getOrderId(){
            return $this->order_id;
        }
    
        public function setOrderId($order_id){
            $this->order_id = $order_id;
        }
    

        public function getSkuId(){
            return $this->sku_id;
        }
    
        public function setSkuId($sku_id){
            $this->sku_id = $sku_id;
        }
    
        public function getPrice(){
            return $this->price;
        }
    
        public function setPrice($price){
            $this->price = $price;
        }

    
        public function getColorOfProduct(){
            return $this->color_of_product;
        }
    
        public function setColorOfProduct($color_of_product){
            $this->color_of_product = $color_of_product;
        }


        public function getOrderDetailId(){
            return $this->order_detail_id;
        }
    
        public function setOrderDetailId($order_detail_id){
            $this->order_detail_id = $order_detail_id;
        }

        public function toArray() {
            return array(
                'order_detail_id' => $this->order_detail_id,
                'order_id' => $this->order_id,
                'sku_id' => $this->sku_id,
                'price' => $this->price,
                'number_of_products' => $this->number_of_products,
                'color_of_product' => $this->color_of_product
            );
        }
    }
?>