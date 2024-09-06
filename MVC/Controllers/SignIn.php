<?php
    class SignIn extends Controller{
        public $accountService;
        public $customerService;
        public function __construct(){
            $this->accountService = $this->service("AccountService");
            $this->customerService = $this->service("CustomerService");
        }
        public function SayHi(){
            $this->view("SignIn",[
                "Page" => "SignIn/SignIn"
            ]);
        }

        public function CheckSignIn(){
            $input_login_details = $_POST["input_username"];
            $input_password = $_POST["input_password"];
            $input_remember_password = $_POST["input_remember_password"];
            
            $logged_in_customer_account = $this->accountService->checkForAccount($input_login_details,$input_password);
            if($logged_in_customer_account==null){
                $url = "../SignIn/?status=login_failed";
                header("Location: ".$url);
                return;
            }
            
            else{
                if($input_remember_password){
                    setcookie("remember_username",$input_login_details,0,"../SignIn/");
                    setcookie("remember_password",$input_password,0,"../SignIn/");
                }
                else{
                    setcookie("remember_username", null, time()-3600);
                    setcookie("remember_password", null, time()-3600);
                }
                $_SESSION["logged_in_customer"] = $this->customerService->getCustomerByAccountId($logged_in_customer_account["account_id"]);
                $account = json_decode($this->accountService->getAccountByEmail($input_login_details), true);
                $_SESSION["role_id"] = $this->accountService->getRoleByAccountId($account['account_id']);
                $_SESSION["account_id"] = $account['account_id'];
                $_SESSION["logged_in_account"] = $account;

                // echo "role: ".$_SESSION["role_id"];
                if($_SESSION["role_id"] == 5){
                    $url = "../Home/";
                    header("Location: ".$url);
                    return;
                }else{
                    header("Location: ../InternalManager/PersonalInfoManager");
                    return;
                }
            }
        }

        public function LogOut(){
            unset($_SESSION["logged_in_customer"]);
            unset($_SESSION["role_id"]);
            unset($_SESSION["account_id"]);
            unset($_SESSION["logged_in_account"]);

            $url = "../Home/";
            header("Location: ".$url);
            return;
        }

        public function ForgotPassword(){
            $uri = parse_url($_SERVER['REQUEST_URI']);
            if(isset($uri["query"])){            
                parse_str($uri["query"],$urlParams);
            }
            
            if(!isset($urlParams["action"])){
                $this->view("SignIn",[
                   "Page" => "SignIn/FormWrapper",
                   "Form" => "SignIn/ForgotPassword/EmailInput"
                ]);
                return;
            }
            if($_SESSION["password_change_user_data"]==null){
                header("Location: ../SignIn/");
                return;
            }
            $verification_data = $_SESSION["password_change_verification_code"];
            if($verification_data==null){                    
                header("Location: ../SignIn/");
                return;
            }

            if(time() - $verification_data["time_created"] > 300){     
                unset($_SESSION["password_change_verification_code"]);   
                unset($_SESSION["password_change_user_data"]);   
                header("Location: ../SignIn/ForgotPassword?status=verification_timed_out");
                return;
            }

            $action = $urlParams["action"];
            if($action == "ConfirmEmail"){
                if($verification_data["is_verified"]){
                    header("Location: ../SignIn/ForgotPassword?action=ChangePassword");
                    return;
                }
                $this->view("SignIn",[
                    "Page" => "SignIn/FormWrapper",
                    "Form" => "SignIn/ForgotPassword/ConfirmEmail"
                ]);
            }
            else if($action=="ChangePassword"){
                if(!$verification_data["is_verified"]){
                    header("Location: ../SignIn/ForgotPassword?action=ConfirmEmail");
                    return;
                }
                $this->view("SignIn",[
                    "Page" => "SignIn/FormWrapper",
                    "Form" => "SignIn/ForgotPassword/ChangePassword"
                ]);
                return;
            }
        }

        public function SendVerificationEmail(){
            $email = $_POST["input_email"];
            if($email==null){
                header("Location: ../SignIn/");
            }
            $account = $this->accountService->accountRepo->getAccountByEmail($email);
            if($account==null){
                header("Location: ../SignIn/ForgotPassword?status=email_not_exist");
                return;
            }
            $_SESSION["password_change_user_data"]=["email"=>$email];

            $this->GenerateVerificationCode();

            $code = $_SESSION["password_change_verification_code"]["code"];
            header("Location: ../SignIn/ForgotPassword?action=ConfirmEmail&code=$code");
        }

        private function GenerateVerificationCode(){
            $verification_code = substr(md5(rand()), 0, 6);

            $verificationData = [
                "time_created"=>time(),
                "code"=>$verification_code,
                "is_verified"=>false
            ];

            $_SESSION["password_change_verification_code"]= $verificationData;

            $userEmail = $_SESSION["password_change_user_data"]["email"];
            $emailSubject = "Xác nhận đổi mật khẩu";
            $message = "
                Đã có yêu cầu đổi mật khẩu tải khoản của bạn.
                Mã xác nhận email là: $verification_code.";
            
            return mail($userEmail,$emailSubject,$message);
        }

        public function VerifyCode(){
            $verificationCode = $_POST["input-verification-code"];
            
            if(!isset($_SESSION["password_change_verification_code"])){
                header("Location: ../SignIn/");
                return;
            }
            $verificationData = $_SESSION["password_change_verification_code"];
            $userData = $_SESSION["password_change_user_data"];

            if(time() - $verificationData["time_created"] > 300){
                unset($_SESSION["password_change_verification_code"]);
                unset($_SESSION["password_change_user_data"]);
                header("Location: ../SignIn/ForgotPassword?status=verification_timed_out");
                return;
            }

            if($verificationData["code"]!=$verificationCode){
                header("Location: ../SignIn/ForgotPassword?action=ConfirmEmail&status=invalid_code");
                return;
            }
            else{
                $_SESSION["password_change_verification_code"]["is_verified"]=true;
                
                var_dump($_SESSION["password_change_verification_code"]);
                header("Location: ../SignIn/ForgotPassword?action=ChangePassword");
                return;
            }
        }

        public function ChangePassword(){
            if(!isset($_SESSION["password_change_verification_code"])){
                header("Location: ../SignIn/");
                return;
            }
            $newPassword = $_POST["input_new_password"];
            if(!isset($newPassword)){
                header("Location: ../SignIn/ForgotPassword?action=ChangePassword");
                return;
            }
            
            $email = $_SESSION["password_change_user_data"]["email"];
            $this->accountService->changeAccountPassword($email,$newPassword);

            
            unset($_SESSION["password_change_verification_code"]);
            unset($_SESSION["password_change_user_data"]);

            header("Location: ../SignIn/?status=change_password_success");
            return;
        }
    }
?>