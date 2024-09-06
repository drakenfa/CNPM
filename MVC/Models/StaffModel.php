<?php
    class StaffModel{
        private $account_id;
        private $staff_fullname;
        private $staff_email;
        private $role_id;
        private $gender;
        private $address;
        private $staff_id;
        private $entry_date;
        private $is_active;
        public function __construct($account_id, $staff_fullname, $role_id, $gender, $address, $staff_id = null, $entry_date = null, $is_active = null)
        {
            $this->account_id = $account_id;
            $this->staff_fullname = $staff_fullname;
            $this->role_id = $role_id;
            $this->gender = $gender;
            $this->address = $address;
            $this->staff_id = $staff_id;
            $this->entry_date = $entry_date;
            $this->is_active = $is_active;
        }
        public function getAccountId(){
            return $this->account_id;
        }
    
        public function setAccountId($account_id){
            $this->account_id = $account_id;
        }
    
        public function getStaffFullname(){
            return $this->staff_fullname;
        }
    
        public function setStaffFullname($staff_fullname){
            $this->staff_fullname = $staff_fullname;
        }
    
        public function getRoleId(){
            return $this->role_id;
        }
    
        public function setRoleId($role_id){
            $this->role_id = $role_id;
        }
    
        public function getGender(){
            return $this->gender;
        }
    
        public function setGender($gender){
            $this->gender = $gender;
        }

        public function getAdress(){
            return $this->address;
        }
    
        public function setAddress($address){
            $this->address = $address;
        }
    
        public function getStaffId(){
            return $this->staff_id;
        }
    
        public function setStaffId($staff_id){
            $this->staff_id = $staff_id;
        }
    
        public function getEntryDate(){
            return $this->entry_date;
        }
    
        public function setEntryDate($entry_date){
            $this->entry_date = $entry_date;
        }
    
        public function getIsActive(){
            return $this->is_active;
        }
    
        public function setIsActive($is_active){
            $this->is_active = $is_active;
        }

        public function toArray() {
            return array(
                'staff_id' => $this->staff_id,
                'account_id' => $this->account_id,
                'staff_fullname' => $this->staff_fullname,
                'role_id' => $this->role_id,
                'gender' => $this->gender,
                'address' => $this->address,
                'entry_date' => $this->entry_date,
                'is_active' => $this->is_active
            );
        }
    }
?>