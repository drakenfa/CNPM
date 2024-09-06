<?php
    require_once "./MVC/Models/StaffModel.php";
    class StaffService extends Service{
        public $staffRepo;
        public $accountRepo;

        public function __construct(){
            $this->staffRepo = $this->repository("StaffRepository");
            $this->accountRepo = $this->repository("AccountRepository");
        }
        public function getAccountByPhoneNumber($phoneNumber){
            $account = $this->accountRepo->getAccountByPhoneNumber($phoneNumber);//lấy ra mảng chứa data của account có username = $username
            if($account){// nếu mảng khác null
                return json_encode("Số điện thoại đã tồn tại", JSON_UNESCAPED_UNICODE); // trả về json data
            }else{
                return null;
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

        public function toString($string){// tránh bị lỗi khi nhập ký tự đặc biệt vào chuỗi
            return "'".$string."'";
        }
        public function createAccount($email, $password, $avatar, $phoneNumber){
            $account = new AccountModel($email, $password, $avatar, $phoneNumber);
            return $this->accountRepo->createAccount($account);
        }
        public function updateAccount($email, $password, $avatar, $account_id){
            $account = new AccountModel($email, $password, $avatar, $account_id);
            return $this->accountRepo->updateAccount($account, $account_id);
        }
        
        public function createStaff($fullname, $role_id, $phoneNumber, $email, $gender, $address, $password, $avatar){//$staffDTO
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
                $staff = new StaffModel($account_id, $fullname, $role_id, $gender, $address);
                $this->staffRepo->createStaff($staff);
            }
        }

        public function updateStaff($fullname, $role_id_staff, $phoneNumber, $email, $genderStaff, $addressStaff, $passwordStaff,  $acc_id, $staf_id){
            // $staffData = $this->staffRepo->getStaffById("5");
            // extract($staffData);// gán các giá trị cho các key tương ứng với các biến
            // $staff = new StaffModel(
            //     $account_id, "Nguyễn Thị Lệ Liễu", $staff_phone_number, $staff_email, $role_id, $gender, $address, $staff_id, $entry_date, $is_active
            // );
            // $this->staffRepo->updateStaff($staff, "5");

            // $existingAccountByPhoneNumber = $this->getAccountByPhoneNumber($phoneNumber);
            // $existingAccountByEmail = $this->getAccountByEmail($email);
            // if($existingAccountByEmail != null){
            //     header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            //     return json_encode("Email này đã được đăng ký", JSON_UNESCAPED_UNICODE);   
            // }elseif($existingAccountByPhoneNumber != null){
            //     header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            //     return json_encode("Số điện thoại này đã được đăng ký", JSON_UNESCAPED_UNICODE);   
            // }else{
                $staffData = $this->staffRepo->getStaffById($staf_id)[0];
                extract($staffData);// gán các giá trị cho các key tương ứng với các biến
                print_r($staffData);
                $staff = new StaffModel(
                    $account_id, $fullname, $role_id_staff, $genderStaff, $addressStaff, $staff_id, $entry_date, $is_active
                );
                $this->staffRepo->updateStaff($staff, $staff_id); 

                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $currentDateTime = date('Y-m-d H:i:s');
                $accountData = $this->accountRepo->getAccountById($acc_id);
                extract($accountData);
                $account = new AccountModel(
                    $email, $passwordStaff, $avatar, $phoneNumber, $account_id, $created_at, $currentDateTime, $is_active
                );
                $this->accountRepo->updateAccount($account, $account_id);
            // }
        }
        public function updateStaffHaveAvatar($fullname, $phoneNumber, $email, $genderStaff, $addressStaff, $avatarStaff,  $acc_id, $staf_id){
                $staffData = $this->staffRepo->getStaffById($staf_id)[0];
                extract($staffData);// gán các giá trị cho các key tương ứng với các biến
                $staff = new StaffModel(
                    $account_id, $fullname, $role_id, $genderStaff, $addressStaff, $staff_id, $entry_date, $is_active
                );
                $this->staffRepo->updateStaff($staff, $staff_id); 
                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $currentDateTime = date('Y-m-d H:i:s');
                $accountData = $this->accountRepo->getAccountById($acc_id);
                extract($accountData);
                if(trim($avatarStaff) != ""){
                    $account = new AccountModel(
                        $email, $password, $avatarStaff, $phoneNumber, $account_id, $created_at, $currentDateTime, $is_active
                    );
                    
                }else{
                    $account = new AccountModel(
                        $email, $password, $avatar, $phoneNumber, $account_id, $created_at, $currentDateTime, $is_active
                    );
                }
                echo "OK";

                $this->accountRepo->updateAccount($account, $account_id);
            // }
        }

        public function deleteStaff($staff_id, $account_id){
            $this->staffRepo->deleteStaff($staff_id);
            $this->accountRepo->deleteAccount($account_id);
            header("location: ../../../InternalManager/StaffManager");
        }

        public function getAllStaff(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->staffRepo->getAllStaff(), JSON_UNESCAPED_UNICODE);
        }

        public function getQuantityAllStaff(){
            return $this->staffRepo->getQuantityAllStaff();
        }

        public function getStaffById($id){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->staffRepo->getStaffById($id), JSON_UNESCAPED_UNICODE);
        }

        public function getQuantityStaffByRole($role_id){
            return $this->staffRepo->getQuantityStaffByRole($role_id);
        }

        public function getInfoStaff(){
            return $this->staffRepo->joinStaffAccountRole();
        }

        public function getInfoStaffById($account_id){
            return $this->staffRepo->joinStaffAccountRoleById($account_id);
        }
    }
?>