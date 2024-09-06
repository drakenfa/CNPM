<?php
        class AccountRepository extends DB{
            public function createAccount($account){
                return $this->create("accounts", $account, "account_id");
            }

            public function updateAccount($account, $id){// by id
                $this->update("accounts", $account, "account_id = ".$id, "account_id");
            }

            public function deleteAccount($id){// by id
                $this->delete("accounts", "account_id = ".$id);
            }

            public function lockAndUnlockAccount($id){// by id
                $this->set("UPDATE accounts SET is_active = CASE WHEN is_active = 1 THEN 0 ELSE 1 END WHERE account_id = $id");
            }

            public function getAllAccount(){
                return $this->read("accounts");
            }
            
            public function getAccountById($id){
                $account = $this->getAllByWhere("accounts", "account_id = ".$id);
                if(sizeof($account)==0){
                    return null;
                }
                else{
                    return $account[0];
                }
            }

            public function getAccountByPhoneNumber($phoneNumber){
                $account = $this->getAllByWhere("accounts", "phone_number = '".$phoneNumber."'");
                if(sizeof($account)==0){
                    return null;
                }
                else{
                    return $account[0];
                }
            }

            public function getAccountByEmail($email){
                $account = $this->getAllByWhere("accounts","accounts.email = '$email'");
                if(sizeof($account)==0){
                    return null;
                }
                else{
                    return $account[0];
                }
            }
            public function getAccountByEmail1($email){
                $account = $this->getAllByWhere("accounts","accounts.email = $email");
                if(sizeof($account)==0){
                    return null;
                }
                else{
                    return $account[0];
                }
            }

            public function getAccountByPhone($phoneNumber){
                $account = $this->getAllByWhere("accounts","accounts.phone_number = '$phoneNumber'");
                if(sizeof($account)==0){
                    return null;
                }
                else{
                    return $account[0];
                }
            }

            public function joinAccountCustomer($email){
                return $this->joinTables("accounts", "customers", "account_id", "");
            }

            public function joinAccountStaff($email){
                return $this->joinTables("accounts", "staffs", "account_id", "");
            }

            public function joinAccountStaffCustomer(){
                return $this->getAccountStaffCustomer();
            }
            
            public function getRoleByAccountId($account_id){
                return $this->unionTables("customers", "staffs", "role_id", "account_id = ".$account_id, "account_id = ".$account_id)[0]["role_id"];
            }

            public function getQuantityAllAccount(){
                return $this->getCountColumnIsActive("accounts", "account_id", "");
            }

            public function getQuantityAccountBlocked(){
                return $this->getCountColumnUnactive("accounts", "account_id", "");
            }

            public function getQuantityStaffAccount(){
                return $this->getCountColumnJoin2Tables("accounts", "staffs", "account_id", "", "staff_id");
            }

            public function getQuantityCustomerAccount(){
                return $this->getCountColumnJoin2Tables("accounts", "customers", "account_id", "", "customer_id");
            }

            public function changePassword($password, $account_id){
                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $currentDateTime = date('Y-m-d H:i:s');
                return $this->set("UPDATE accounts SET password = '$password', updated_at = '$currentDateTime' WHERE accounts.account_id = $account_id");
            }
        }
    ?>