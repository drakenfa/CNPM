<?php
    class Staff extends Controller{
        public $staffService;
        public $accountService;
        public function __construct(){
            $this->staffService = $this->service("StaffService");
            $this->accountService = $this->service("AccountService");
        }
        public function GetAccountByPhoneNumber(){
            $phoneNumber = $_POST["phone_number"];
            if($this->staffService->getAccountByPhoneNumber($phoneNumber) != null){
                echo "Số điện thoại đã tồn tại";
            }
        }
        
        public function GetAccountByEmail(){
            $email = $_POST["email"];
            if($this->staffService->getAccountByEmail($email) != null){
                echo "Email đã tồn tại";
            }
        }

        public function CreateStaff(){
            $fullname = $_POST["fullname_add_form"];
            $role_id = $_POST["role_id_add_form"];
            $phoneNumber = $_POST["phone_number_add_form"];
            $email = $_POST["email_add_form"];
            $gender = $_POST["gender_add_form"];
            $address = $_POST["address_add_form"];
            $password = $_POST["password_add_form"];
            $target_dir = "Public/img/staffAvatar/"; // thư mục để lưu ảnh
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }            
            $file_name = $_FILES["avatar_add_form"]["name"];
            $file_tmp = $_FILES["avatar_add_form"]["tmp_name"];
            $file_extension = pathinfo(basename($file_name), PATHINFO_EXTENSION); // lấy đuôi file
            $target_file = $target_dir . "avatar_".$phoneNumber.".".$file_extension; // đường dẫn đầy đủ của file
            if (move_uploaded_file($file_tmp, $target_file)) {
                echo "Ảnh ". htmlspecialchars(basename($file_name)). " đã được tải lên thành công.";
            } else {
                echo "Có lỗi xảy ra khi tải lên ảnh.";
            }
            $this->staffService->createStaff($fullname, $role_id, $phoneNumber, $email, $gender, $address, $password, "avatar_".$phoneNumber.".".$file_extension);
            header("location: ../InternalManager/StaffManager");
        }
        public function UpdateStaff(){
            $fullname = $_POST["fullname_edit_form"];
            $role_id = $_POST["role_id_edit_form"];
            $phoneNumber = $_POST["phone_number_edit_form"];
            $email = $_POST["email_edit_form"];
            $gender = $_POST["gender_edit_form"];
            $address = $_POST["address_edit_form"];
            $password = $_POST["password_edit_form"];
            $account_id = $_POST["account_id"];
            $staff_id = $_POST["staff_id"];
            $this->staffService->updateStaff($fullname, $role_id, $phoneNumber, $email, $gender, $address, $password, $account_id, $staff_id);
            header("location: ../InternalManager/StaffManager");
        }
        public function UpdateStaffHaveAvatar(){
            $fullname = $_POST["fullname_edit_form"];
            $phoneNumber = $_POST["phone_number_edit_form"];
            $email = $_POST["email_edit_form"];
            $gender = $_POST["gender_edit_form"];
            $address = $_POST["address_edit_form"];
            // $avatar = $_POST['avatar_edit_form'];
            $account_id = $_POST['account_id'];
            $staff_id = $_POST['staff_id'];

            $target_dir = "Public/img/staffAvatar/"; // thư mục để lưu ảnh
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }            
            $file_name = $_FILES["avatar_edit_form"]["name"];
            $file_tmp = $_FILES["avatar_edit_form"]["tmp_name"];
            $file_extension = pathinfo(basename($file_name), PATHINFO_EXTENSION); // lấy đuôi file
            echo $file_extension;
            $target_file = $target_dir . "avatar_".$phoneNumber.".".$file_extension; // đường dẫn đầy đủ của file
            if (move_uploaded_file($file_tmp, $target_file)) {
                echo "Ảnh ". htmlspecialchars(basename($file_name)). " đã được tải lên thành công.";
            } else {
                echo "Có lỗi xảy ra khi tải lên ảnh.";
            }
            if(trim($file_name) != ""){
                $this->staffService->updateStaffHaveAvatar($fullname, $phoneNumber, $email, $gender, $address, "avatar_".$phoneNumber.".".$file_extension, $account_id, $staff_id);
            }else{
                $accountAvatar = $this->accountService->getAccountById($account_id)[0]['avatar'];
                $this->staffService->updateStaffHaveAvatar($fullname, $phoneNumber, $email, $gender, $address, $accountAvatar,$account_id, $staff_id);
            }
            header("location: ../InternalManager/PersonalInfoManager");
        }
        public function DeleteStaff($staff_id, $account_id){
            $this->staffService->deleteStaff($staff_id, $account_id);
        }
        public function GetAllStaff(){
            $this->staffService->getAllStaff();
        }
        public function GetStaffById($id){
            $this->staffService->getStaffById($id);
        }
        public function GetInfoStaff(){
            $this->staffService->getInfoStaff();
        }
    }
?>