<?php
    class OptionModel{
        private $option_id;
        private $product_id;
        private $ram;
        private $rom;
        private $chip;
        private $color;
        private $battery;
        private $screen;
        private $wh;
        private $is_active;
        public function __construct($product_id, $ram, $rom, $chip, $color, $battery, $screen, $wh, $option_id = null, $is_active = null)
        {
            $this->product_id = $product_id;
            $this->ram = $ram;
            $this->rom = $rom;
            $this->chip = $chip;
            $this->color = $color;
            $this->battery = $battery;
            $this->screen = $screen;
            $this->wh = $wh;
            $this->option_id = $option_id;
            $this->is_active = $is_active;
        }
        public function getOptionId(){
            return $this->option_id;
        }
    
        public function setOptionId($option_id){
            $this->option_id = $option_id;
        }

        public function getProductId(){
            return $this->product_id;
        }
    
        public function setProductId($product_id){
            $this->product_id = $product_id;
        }
    
        public function getRam(){
            return $this->ram;
        }
    
        public function setRam($ram){
            $this->ram = $ram;
        }
    
        public function getRom(){
            return $this->rom;
        }
    
        public function setRom($rom){
            $this->rom = $rom;
        }
    
        public function getChip(){
            return $this->chip;
        }
    
        public function setChip($chip){
            $this->chip = $chip;
        }
    
        public function getColor(){
            return $this->color;
        }
    
        public function setColor($color){
            $this->color = $color;
        }
    
        public function getBattery(){
            return $this->battery;
        }
    
        public function setBattery($battery){
            $this->battery = $battery;
        }
    
        public function getScreen(){
            return $this->screen;
        }
    
        public function setScreen($screen){
            $this->screen = $screen;
        }
    
        public function getWh(){
            return $this->wh;
        }
    
        public function setWh($wh){
            $this->wh = $wh;
        }

        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'option_id' => $this->option_id,
                'product_id' => $this->product_id,
                'ram' => $this->ram,
                'rom' => $this->rom,
                'chip' => $this->chip,
                'color' => $this->color,
                'battery' => $this->battery,
                'screen' => $this->screen,
                'wh' => $this->wh,
                'is_active' => $this->is_active
            );
        }
    }
?>