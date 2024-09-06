<?php
    class Customer extends Controller{
        public $customerService;
        public function __construct(){
            $this->customerService = $this->service("CustomerService");
        }
        public function GetAccountByPhoneNumber(){
            $phoneNumber = $_POST["phone_number"];
            if($this->customerService->getAccountByPhoneNumber($phoneNumber) != null){
                echo "Số điện thoại đã tồn tại";
            }
        }
        public function GetAccountByEmail(){
            $email = $_POST["email"];
            if($this->customerService->getAccountByEmail($email) != null){
                echo "Email đã tồn tại";
            }
        }
        public function CreateCustomer(){
            $fullname = $_POST["fullname_add_form"];
            $birthDate = $_POST["birth_date_add_form"];
            $phoneNumber = $_POST["phone_number_add_form"];
            $email = $_POST["email_add_form"];
            $gender = $_POST["gender_add_form"];
            $address = $_POST["address_add_form"];
            $password = $_POST["password_add_form"];
            $target_dir = "Public/img/customerAvatar/"; // thư mục để lưu ảnh
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
            $this->customerService->createCustomer($fullname, $birthDate, $phoneNumber, $email, $gender, $address, $password, "avatar_".$phoneNumber.".".$file_extension);
            header("location: ../InternalManager/CustomerManager");
        }
        public function UpdateCustomer(){
            $fullname = $_POST["fullname_edit_form"];
            $birthDate = $_POST["birth_date_edit_form"];
            $phoneNumber = $_POST["phone_number_edit_form"];
            $email = $_POST["email_edit_form"];
            $gender = $_POST["gender_edit_form"];
            $address = $_POST["address_edit_form"];
            $password = $_POST["password_edit_form"];
            $account_id = $_POST["account_id"];
            $customer_id = $_POST["customer_id"];
            $this->customerService->updateCustomer($fullname, $birthDate, $phoneNumber, $email, $gender, $address, $password, $account_id, $customer_id);
            header("location: ../InternalManager/CustomerManager");
        }
        // public function DeleteCustomer(){
        //     $this->customerService->deleteCustomer();
        // }
        public function DeleteCustomer($customer_id, $account_id){
            $this->customerService->deleteCustomer($customer_id, $account_id);
        }
        public function GetAllCustomer(){
            $this->customerService->getAllCustomer();
        }
        public function GetCustomerById(){
            $this->customerService->GetCustomerById();
        }
        public function CalculateAverageAgeCustomer(){
            header('Content-Type: application/json');// chuyển đổi dữ liệu sang json
            echo json_encode($this->customerService->calculateAverageAgeCustomer(), JSON_UNESCAPED_UNICODE);
        }
    }
?>