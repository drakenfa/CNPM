<?php
    require_once "./MVC/Models/AccountModel.php";
    require_once "./MVC/Models/CustomerModel.php";
    class AccountService extends Service{
        public $accountRepo;
        public $customerRepo;

        public function __construct(){
            $this->accountRepo = $this->repository("AccountRepository");
            $this->customerRepo = $this->repository("CustomerRepository");
        }
        
        public function createAccount($phoneNumber, $password){
            $account = new AccountModel($phoneNumber, $password, "");
            return $this->accountRepo->createAccount($account);
        }

        public function createCustomer($account_id){
            $customer = new CustomerModel($account_id);
            return $this->customerRepo->createCustomer($customer);
        }

        public function updateAccount(){
            $accountData = $this->accountRepo->getAccountById("9");
            extract($accountData);// gán các giá trị cho các key tương ứng với các biến
            $account = new AccountModel(
                "ThiLua12345", $password, $account_id, $created_at, $updated_at, $is_active
            );
            $this->accountRepo->updateAccount($account, "9");
        }

        public function deleteAccount($id){
            $this->accountRepo->deleteAccount($id);
        }

        public function lockAndUnlockAccount($id){
            $this->accountRepo->lockAndUnlockAccount($id);
        }

        public function getAllAccount(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            return json_encode($this->accountRepo->getAllAccount(), JSON_UNESCAPED_UNICODE);
        }

        public function getAccountStaffCustomer(){
            return $this->accountRepo->joinAccountStaffCustomer();
        }

        public function getAccountById($id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->accountRepo->getAccountById($id), JSON_UNESCAPED_UNICODE);
        }

        public function toString($string){// tránh bị lỗi khi nhập ký tự đặc biệt vào chuỗi
            return "'".$string."'";
        }

        public function getAccountByPhoneNumber($phoneNumber){
            $account = $this->accountRepo->getAccountByPhoneNumber($phoneNumber);//lấy ra mảng chứa data của account có username = $username
            if($account){// nếu mảng khác null
                header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
                return json_encode($account, JSON_UNESCAPED_UNICODE); // trả về json data
            }else{
                return null;
            }
        }

        public function getAccountByEmail($email){  
            $account = $this->accountRepo->getAccountByEmail($email);//lấy ra mảng chứa data của account có username = $username
            if($account){// nếu mảng khác null
                header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
                return json_encode($account, JSON_UNESCAPED_UNICODE); // trả về json data
            }else{
                return null;
            }
        }

        public function getRoleByAccountId($account_id){
            return $this->accountRepo->getRoleByAccountId($account_id);
        }

        public function checkForAccount($login_details, $password){
            $customer_account = [];
            if(filter_var($login_details,FILTER_VALIDATE_EMAIL)){   
                $customer_account = $this->accountRepo->getAccountByEmail($login_details);
            }
            else{
                $customer_account = $this->accountRepo->getAccountByPhone($login_details);
            }
            if($customer_account==null){
                return null;
            }
            if($password != $customer_account["password"]){
                return null;
            }
            return $customer_account;
        }

        public function changeAccountPassword($account_email,$new_password){
            $sql = "UPDATE accounts set accounts.password = '$new_password' where email='$account_email'";
            $this->accountRepo->set($sql);
        }

        public function getQuantityAllAccount(){
            return $this->accountRepo->getQuantityAllAccount();
        }
        
        public function getQuantityAccountBlocked(){
            return $this->accountRepo->getQuantityAccountBlocked();
        }

        public function getQuantityStaffAccount(){
            return $this->accountRepo->getQuantityStaffAccount();
        }

        public function getQuantityCustomerAccount(){
            return $this->accountRepo->getQuantityCustomerAccount();
        }

        public function changePassword($password, $account_id){
            return $this->accountRepo->changePassword($password, $account_id);
        }
    }
?>