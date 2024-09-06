<?php
    class CustomerModel{
        private $customer_id;
        private $customer_fullname;
        private $role_id;
        private $account_id;
        private $gender;
        private $address;
        private $date_of_birth;
        private $is_active;
        public function __construct($account_id, $customer_fullname = null, $role_id = null, $gender = null,  $address = null, $date_of_birth = null, $customer_id = null, $is_active = null){
            $this->customer_fullname = $customer_fullname;
            $this->role_id = $role_id;
            $this->account_id = $account_id;
            $this->gender = $gender;
            $this->address = $address;
            $this->date_of_birth = $date_of_birth;
            $this->customer_id = $customer_id;
            $this->is_active = $is_active;
        }
        public function getCustomerId(){
            return $this->customer_id;
        }
        public function setCustomerId($customer_id){
            $this->customer_id = $customer_id;
        }
        public function getCustomerFullname(){
            return $this->customer_fullname;
        }
        public function setCustomerFullname($customer_fullname){
            $this->customer_fullname = $customer_fullname;
        }
        public function getRoleId(){
            return $this->role_id;
        }
        public function setRoleId($role_id){
            $this->role_id = $role_id;
        }
        public function getAccountId(){
            return $this->account_id;
        }
        public function setAccountId($account_id){
            $this->account_id = $account_id;
        }
        public function getGender(){
            return $this->gender;
        }
        public function setGender($gender){
            $this->gender = $gender;
        }
        public function getAddress(){
            return $this->address;
        }
        public function setAddress($address){
            $this->address = $address;
        }
        public function getDateOfBirth(){
            return $this->date_of_birth;
        }
        public function setDateOfBirth($date_of_birth){
            $this->date_of_birth = $date_of_birth;
        }
        public function getIsActive(){
            return $this->is_active;
        }
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }
        public function toArray() {
            return array(
                'customer_id' => $this->customer_id,
                'customer_fullname' => $this->customer_fullname,
                'role_id' => $this->role_id,
                'account_id' => $this->account_id,
                'gender' => $this->gender,
                'address' => $this->address,
                'date_of_birth' => $this->date_of_birth,
                'is_active' => $this->is_active
            );
        }
    }
?>