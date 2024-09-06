<?php
        class CustomerRepository extends DB{
            public function getCustomerById($id){
                return $this->getAllByWhere("customers", "customer_id = ".$id);
            }
            public function getCustomerByAccountId($account_id){
                $customer = $this->getAllByWhere("customers","customers.account_id = ".$account_id);
                if(sizeof($customer)==0){
                    return null;
                }
                else{
                    return $customer[0];
                }
            }

            public function getQuantityAllCustomer(){
                return $this->getCountColumn("customers", "customer_id", "");
            }




            public function createCustomer($customer){
                $this->create("customers", $customer, "customer_id");
            }

            public function updateCustomer($customer, $id){// by id
                $this->update("customers", $customer, "customer_id = ".$id, "customer_id");
            }

            public function deleteCustomer($id){// by id
                $this->delete("customers", "customer_id = ".$id);
            }

            public function getAllCustomer(){
                return $this->read("customers");
            }

            public function getQuantityMaleCustomer(){
                return $this->getCountColumn("customers", "customer_id", "gender = 0");
            }

            public function getQuantityFemaleCustomer(){
                return $this->getCountColumn("customers", "customer_id", "gender = 1");
            }

            public function getAllBirthDateCustomer(){
                return $this->getOneColumnTable("customers", "date_of_birth", "");
            }

            public function joinCustomerAccount(){
                return $this->joinTables("customers", "accounts","account_id", "customers.is_active = 1 ORDER BY customer_id ASC");
            }
        }
    ?>