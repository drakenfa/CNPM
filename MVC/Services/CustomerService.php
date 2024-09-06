<?php
    require_once "./MVC/Models/CustomerModel.php";
    require_once "./MVC/Models/AccountModel.php";
    class CustomerService extends Service{
        public $customerRepo;
        public $accountRepo;
        public function __construct(){
            $this->customerRepo = $this->repository("CustomerRepository");
            $this->accountRepo = $this->repository("AccountRepository");
        }
        
        public function getCustomerByAccountId($account_id){
            return $this->customerRepo->getCustomerByAccountId($account_id);
        }
        public function toString($string){// tránh bị lỗi khi nhập ký tự đặc biệt vào chuỗi
            return "'".$string."'";
        }
        public function getAccountByPhoneNumber($phoneNumber){
            $account = $this->accountRepo->getAccountByPhoneNumber($phoneNumber);//lấy ra mảng chứa data của account có username = $username
            if($account){// nếu mảng khác null
                return json_encode("Số điện thoại đã tồn tại", JSON_UNESCAPED_UNICODE); // trả về json data
            }else{
                return null;
            }
        }

        public function createAccount($email, $password, $avatar, $phoneNumber){
            $account = new AccountModel($email, $password, $avatar, $phoneNumber);
            return $this->accountRepo->createAccount($account);
        }
        public function updateAccount($phoneNumber, $password, $avatar, $account_id){
            $account = new AccountModel($phoneNumber, $password, $avatar, $account_id);
            return $this->accountRepo->updateAccount($account, $account_id);
        }

        public function createCustomer($fullname, $birthDate, $phoneNumber, $email, $gender, $address, $password, $avatar){//$staffDTO
            $existingAccountByPhoneNumber = $this->getAccountByPhoneNumber($phoneNumber);
            $existingAccountByEmail = $this->getAccountByEmail($email);
            if($existingAccountByEmail != null){
                header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
                return json_encode("Email này đã được đăng ký", JSON_UNESCAPED_UNICODE);   
            }elseif($existingAccountByPhoneNumber != null){
                header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
                return json_encode("Số điện thoại này đã được đăng ký", JSON_UNESCAPED_UNICODE);   
            }else{
                $account_id = $this->createAccount($email, $password, $avatar, $phoneNumber)['account_id'];
                $customer = new CustomerModel($account_id, $fullname, "5", $gender, $address, $birthDate);
                $this->customerRepo->createCustomer($customer);
            }
        }
        public function getAccountByEmail($email){  
            $accountCustomer = $this->accountRepo->getAccountByEmail1($this->toString($email));// lấy ra mảng chứa data của account có email = $email bằng cách join 2 bảng on account_id
            $accountStaff = $this->accountRepo->getAccountByEmail1($this->toString($email));
            if($accountCustomer){ // nếu mảng khác null
                return json_encode("Email đã tồn tại", JSON_UNESCAPED_UNICODE);   // trả về json data
            }elseif($accountStaff){
                header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
                return json_encode("Email đã tồn tại", JSON_UNESCAPED_UNICODE);
            }else{
                return null;
            }
        }
        // public function createStaff($fullname, $role_id, $phoneNumber, $email, $gender, $address, $password, $avatar){//$staffDTO
        //     $existingAccountByPhoneNumber = $this->getAccountByPhoneNumber($phoneNumber);
        //     $existingAccountByEmail = $this->getAccountByEmail($email);
        //     if($existingAccountByEmail != null){
        //         header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
        //         return json_encode("Email này đã được đăng ký", JSON_UNESCAPED_UNICODE);   
        //     }elseif($existingAccountByPhoneNumber != null){
        //         header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
        //         return json_encode("Số điện thoại này đã được đăng ký", JSON_UNESCAPED_UNICODE);   
        //     }else{
        //         $account_id = $this->createAccount($email, $password, $avatar, $phoneNumber)['account_id'];
        //         $staff = new StaffModel($account_id, $fullname, $role_id, $gender, $address);
        //         $this->staffRepo->createStaff($staff);
        //     }
        // }
        // public function updateCustomer(){// by id (truyền DTO)
        //     $customerData = $this->customerRepo->getCustomerById("'KH005'");
        //     extract($customerData);// gán các giá trị cho các key tương ứng với các biến
        //     $customer = new CustomerModel(
        //         "Nguyễn Huỳnh", $role_id, $account_id, $gender, $phone_number, $customer_email, $address, $date_of_birth, $customer_id, $is_active
        //     );
        //     $this->customerRepo->updateCustomer($customer, "'KH005'");
        // }
        public function updateCustomer($fullname, $birthDate, $phoneNumber, $email, $genderCustomer, $addressCustomer, $passwordCustomer,  $acc_id, $cust_id){
                $customerData = $this->customerRepo->getCustomerById($cust_id)[0];
                extract($customerData);// gán các giá trị cho các key tương ứng với các biến
                $customer = new CustomerModel(
                    $account_id, $fullname, "5", $genderCustomer, $addressCustomer, $birthDate, $customer_id, $is_active
                );
                $this->customerRepo->updateCustomer($customer, $customer_id); 

                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $currentDateTime = date('Y-m-d H:i:s');
                $accountData = $this->accountRepo->getAccountById($acc_id);
                extract($accountData);
                $account = new AccountModel(
                    $email, $passwordCustomer, $avatar, $phoneNumber, $account_id, $created_at, $currentDateTime, $is_active
                );
                $this->accountRepo->updateAccount($account, $account_id);
            // }
        }

        public function deleteCustomer($customer_id, $account_id){
            $this->customerRepo->deleteCustomer($customer_id);
            $this->accountRepo->deleteAccount($account_id);
            header("location: ../../../InternalManager/CustomerManager");
        }

        public function getAllCustomer(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->customerRepo->getAllCustomer(), JSON_UNESCAPED_UNICODE);
        }

        public function getQuantityAllCustomer(){
            return $this->customerRepo->getQuantityAllCustomer();
        }
        public function getQuantityMaleCustomer(){
            return $this->customerRepo->getQuantityMaleCustomer();
        }
        public function getQuantityFemaleCustomer(){
            return $this->customerRepo->getQuantityFemaleCustomer();
        }
        public function calculateAverageAgeCustomer(){
            $allBirthDateCustomer = $this->customerRepo->getAllBirthDateCustomer();
            $totalAge = 0;
            $count = 0;
            foreach ($allBirthDateCustomer as $customer) {
                $birthDate = new DateTime($customer['date_of_birth']);
                $today = new DateTime('now');
                $interval = $birthDate->diff($today);
                $age = $interval->y;
                $totalAge += $age;
                $count++;
            }
            $averageAge = $totalAge / $count;
            return ceil($averageAge);
        }
        
        public function getCustomerById(){
            $id = "'KH002'";
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->customerRepo->getCustomerById($id), JSON_UNESCAPED_UNICODE);
        }

        public function getInfoCustomer(){
            return $this->customerRepo->joinCustomerAccount();
        }
    }
?>