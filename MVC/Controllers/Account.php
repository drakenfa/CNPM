<?php
    class Account extends Controller{
        public $accountService;
        public function __construct(){
            $this->accountService = $this->service("AccountService");
        }
        public function SayHi(){
            $this->view("loginSignUp", [
                "Page" => "LoginSignUp"
            ]);
        }
        public function CreateAccount($phoneNumber, $password){
            $this->accountService->createAccount($phoneNumber, $password);
        }
        public function UpdateAccount(){
            $this->accountService->updateAccount();
        }
        public function LockAndUnlockAccount($id){
            $this->accountService->lockAndUnlockAccount($id);
            header("location: ../../InternalManager/AccountManager");
        }
        public function GetAllAccount(){
            $this->accountService->getAllAccount();
        }
        public function GetAccountById($id){
            $this->accountService->getAccountById($id);
        }
        public function GetAccountByPhoneNumber($phoneNumber){
            echo $this->accountService->getAccountByPhoneNumber($phoneNumber);
        }
        public function GetAccountByEmail($email){
            echo $this->accountService->getAccountByEmail($email);
        }
        public function GetRoleByAccountId($account_id){
            $this->accountService->getRoleByAccountId($account_id);
        }
        public function ChangePassword(){
            $password = $_POST['confirm_password_form'];
            $account_id = $_POST['account_id'];
            $this->accountService->changePassword($password, $account_id);
            header("location: ../InternalManager/PersonalInfoManager");
        }
    }
?>