<?php
    class Introduction extends Controller{
        public function Intro(){
            $this->view("introduction", [
                "Page" => "Intro"
            ]);
        }
    }
?>