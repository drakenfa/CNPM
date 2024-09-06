<?php
    class CustomerInfo extends Controller{
        public $customerService;
        public function __construct(){
            $this->customerService = $this->service("CustomerService");
        }
        public function SayHi(){
            $loggedInCustomer = $_SESSION["logged_in_customer"];
            $loggedInAccount = $_SESSION["logged_in_account"];

            if(!(isset($loggedInAccount)||isset($loggedInCustomer))){
                header("Location: ../SignIn/");
                return;
            }

            $this->view("master",[
                "Page" => "CustomerInfo/CustomerInfo",
                "LoggedInCustomer"=>$loggedInCustomer,
                "LoggedInAccount"=>$loggedInAccount
            ]);

            unset($loggedInAccount);
            unset($loggedInCustomer);
        }

        public function ChangeCustomerInfo(){
            if(!isset($_SESSION["logged_in_customer"]) || !isset($_POST)){
                echo(json_encode(["status"=>"failed"]));
                return;
            }
            $accountID = $_SESSION["logged_in_account"]["account_id"];
            $customerID = $_SESSION["logged_in_customer"]["customer_id"];

            $phoneNumber = $_POST["phone_number"];
            $address = $_POST["address"];
            $password = $_POST["password"];
            $gender = $_POST["gender"];
            $fullname = $_POST["customer_fullname"];
            $email = $_POST["email"];

            $accountInputs = [];


            $returnCode = [];
            $checkSQL = "SELECT accounts.account_id from accounts where accounts.email = '$email' and not accounts.account_id = $accountID";
            if(count($this->customerService->customerRepo->get($checkSQL))>0){
                array_push($returnCode,["status"=>"email_exists"]);
            }

            $checkSQL = "SELECT accounts.account_id from accounts where accounts.phone_number = '$phoneNumber' and not accounts.account_id = $accountID";
            if(count($this->customerService->customerRepo->get($checkSQL))>0){
                array_push($returnCode,["status"=>"phone_number_exists"]);
            }
            if(count($returnCode)>0){
                echo(json_encode($returnCode));
                return;
            }

            if($email!='null'){
                array_push($accountInputs,"accounts.email='$email'");
            }
            if($phoneNumber!='null'){
                array_push($accountInputs,"accounts.phone_number='$phoneNumber'");
            }
            if($password!='null'){
                array_push($accountInputs,"accounts.password='$password'");
            }

            unset($checkSQL);
            
            if(count($accountInputs)>0){
                $sql = "UPDATE accounts SET ".implode(",",$accountInputs)." WHERE accounts.account_id = $accountID";
    
                $this->customerService->customerRepo->set($sql);
            }

            unset($accountInputs);

            $customerInputs = [];
            
            if($address!='null'){
                array_push($customerInputs,"customers.address='$address'");
            }
            if($gender!='null'){
                array_push($customerInputs,"customers.gender='$gender'");
            }
            if($fullname!='null'){
                array_push($customerInputs,"customers.customer_fullname='$fullname'");
            }

            if(count($customerInputs)>0){
                $sql = "UPDATE customers SET ".implode(",",$customerInputs)." WHERE customers.account_id = $accountID";
    
                $this->customerService->customerRepo->set($sql);
            }


            unset($customerInputs);
            unset($sql);
            
            array_push($returnCode,["status"=>"success"]);
            echo(json_encode($returnCode));
            return;
        }
    }
?>