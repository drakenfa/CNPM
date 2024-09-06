<?php
    class SignUp extends Controller{
        public $accountService;
        public $customerService;
        public function __construct(){
            $this->accountService = $this->service("AccountService");
            $this->customerService = $this->service("CustomerService");
        }
        public function SayHi(){
            $this->view("SignIn",[
                "Page" => "SignIn/SignUp"
            ]);
        }
        public function CreateAccount(){
            //check thong tin
            $input_email = $_POST["input_email"];
            $input_phone = $_POST["input_phone_number"];
            $input_password = $_POST["input_password"];
            $input_confirm_password = $_POST["input_confirm_password"];
            
            if(!filter_var($input_email,FILTER_VALIDATE_EMAIL)||$input_password!=$input_confirm_password){
                header("Location: ../SignUp/?status=signup_invalid_input");
                return;
            }

            //kiem tra email ton tai chua
            if($this->accountService->accountRepo->getAccountByEmail($input_email)!=null){
                header("Location: ../SignUp/?status=signup_email_exists");
                return;
            }
            else if($this->accountService->accountRepo->getAccountByPhoneNumber($input_phone)!=null){
                header("Location: ../SignUp/?status=signup_phone_exists");
                return;
            }
            //very
            $signUpData = [
                "email"=>$input_email,
                "phone_number"=>$input_phone,
                "password" =>$input_password
            ];
            
            $_SESSION["signup_user_data"] = $signUpData;
            $result = $this->GenerateVerificationCode();
        }
        public function ResendVerificationCode(){
            $codeCreatedTime = $_SESSION["verification_code"]["time_created"];
            $resendStatus=[];
            if(time()-$codeCreatedTime>=30){
                $result = $this->GenerateVerificationCode();
                $resendStatus=["resend_status"=>"success"];
            }
            else{
                $resendStatus=["resend_status"=>"resend_too_soon"];
            }
            header('Content-Type: application/json');
            echo(json_encode($resendStatus));
        }
        private function GenerateVerificationCode(){
            $verification_code = substr(md5(rand()), 0, 6);

            $verificationData = [
                "time_created"=>time(),
                "code"=>$verification_code
            ];

            $_SESSION["verification_code"]= $verificationData;

            $userEmail = $_SESSION["signup_user_data"]["email"];
            $emailSubject = "Xác nhận email đăng ký tài khoản";
            $message = "
                Mã xác nhận email là: $verification_code.";
            
            return mail($userEmail,$emailSubject,$message);
        }
        public function VerifyAccount(){
            if($_SESSION["verification_code"]==null){
               header("Location: ../SignUp/");  
               return;
            }

            $codeCreatedTime = $_SESSION["verification_code"]["time_created"];
            if($codeCreatedTime!=null){
                if(time()-$codeCreatedTime>300){
                    unset($_SESSION["signup_user_data"]);
                    unset($_SESSION["verification_code"]); 
                    header("Location: ../SignUp/");
                    return;
                }
            }
            $code = $_SESSION["verification_code"]["code"];
            echo("code $code");

            $this->view("SignIn",[
                "Page" => "SignIn/FormWrapper",
                "Form" => "SignIn/VerifyAccount"
            ]);
        }
        public function DoVerifyEmail(){
            if(!isset($_SESSION["verification_code"])){
               header("Location: ../SignUp/");  
               return;
            }

            $codeCreatedTime = $_SESSION["verification_code"]["time_created"];
            if($codeCreatedTime!=null){
                if(time()-$codeCreatedTime>300){
                    header("Location: ../SignUp/VerifyAccount?status=timed_out");
                    return;
                }
            }
            else{
                header("Location: ../SignUp/");
                return;
            }
            $verification_code = $_POST["verification-code-input"];
            if($verification_code!= $_SESSION["verification_code"]["code"]){
                header("Location: ../SignUp/VerifyAccount?status=invalid_code");
                return;
            }
            else{
                $userData = $_SESSION["signup_user_data"];
                echo(var_dump($userData));
                $sql = "
                    INSERT INTO accounts(email,phone_number,password) VALUES ('".$userData["email"]."','".$userData["phone_number"]."','".$userData["password"]."')
                ";
                $this->accountService->accountRepo->set($sql);
                

                $newAccount = $this->accountService->accountRepo->getAccountByEmail($userData["email"]);
                

                $sql = "
                    INSERT INTO customers(account_id) VALUES ('".$newAccount["account_id"]."')
                ";
                $this->accountService->accountRepo->set($sql);
                
                
                unset($_SESSION["signup_user_data"]);
                unset($_SESSION["verification_code"]); 


                header("Location: ../SignIn/?status=verify_success");
                return;
            }
        }

        public function CheckEmailExist(){
            $userEmail = $_POST["user_email"];
            $userPhone = $_POST["user_phone_number"];

            //kiem tra email ton tai chua
            if($this->accountService->accountRepo->getAccountByEmail($userEmail)!=null){
                $returnStatus = ["exist_status"=>"email_exists"];
            }
            else if($this->accountService->accountRepo->getAccountByPhoneNumber($userPhone)!=null){
                $returnStatus = ["exist_status"=>"phone_exists"];
            }
            else{
                $returnStatus = ["exist_status"=>"non_exists"];
            }
            
            
            header('Content-Type: application/json');
            echo(json_encode($returnStatus));
        }
    }
?>