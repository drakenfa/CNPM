<?php
    class AccountModel{
        private $account_id;
        private $phone_number;
        private $email;
        private $password;
        private $avatar;
        private $created_at;
        private $updated_at;
        private $is_active;
        public function __construct($email, $password,  $avatar,$phone_number=null, $account_id = null, $created_at = null, $updated_at = null, $is_active = null){
            $this->account_id = $account_id;
            $this->phone_number = $phone_number;
            $this->email = $email;
            $this->password = $password;
            $this->avatar = $avatar;
            $this->created_at = $created_at;
            $this->updated_at = $updated_at;
            $this->is_active = $is_active;
        }
        public function getAccountId(){
            return $this->account_id;
        }
        public function setAccountId($account_id){
            $this->account_id = $account_id;
        }
    
        public function getPhoneNumber(){
            return $this->phone_number;
        }
    
        public function setPhoneNumber($phone_number){
            $this->phone_number = $phone_number;
        }
        public function getEmail(){
            return $this->email;
        }
        public function setEmail($email){
            $this->phone_number = $email;
        }
        public function getPassword(){
            return $this->password;
        }
        public function setPassword($password){
            $this->password = $password;
        }
        public function getAvatar(){
            return $this->avatar;
        }
        public function setAvatar($avatar){
            $this->avatar = $avatar;
        }
        public function getCreatedAt(){
            return $this->created_at;
        }
        public function setCreatedAt($created_at){
            $this->created_at = $created_at;
        }
        public function getUpdatedAt(){
            return $this->updated_at;
        }
        public function setUpdatedAt($updated_at){
            $this->updated_at = $updated_at;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'account_id' => $this->account_id,
                'phone_number'=>$this->phone_number,
                'email' => $this->email,
                'password' => $this->password,
                'avatar' => $this->avatar,
                'created_at' => $this->created_at,
                'updated_at' => $this->updated_at,
                'is_active' => $this->is_active
            );
        }
    }
?>