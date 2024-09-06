<?php
    class App{
        protected $controller = "Home";// trang chủ
        protected $action = "SayHi"; // action load trang chủ
        protected $params = [];
        function __construct(){
            $arr = $this->UrlProcess();// gọi method tách url gán vào mảng

            // Xử lý controller
            if(file_exists("./MVC/Controllers/".$arr[0].".php")){// Kiểm tra xem file có tồn tại không
                $this->controller = $arr[0]; // nếu tồn tại thì gán nó vào controller
                unset($arr[0]);// bỏ khỏi arr để xuống dưới arr chỉ còn params
            }
            require_once "./MVC/Controllers/".$this->controller.".php";// nhờ gán vào $controller nên url không tồn tại thì nó cũng mặc định là Home
            $this->controller = new $this->controller;// gán giá trị mới cho $controller là 1 đối tượng 

            // Xử lý action
            if(isset($arr[1])){// nếu tồn tại biến action
                if(method_exists($this->controller,$arr[1])){ // nếu tồn tại method $arr[1] trong controller(hàm method_exists hiểu được controller do phía trên đã require file vào rồi)
                    $this->action = $arr[1]; // gán $arr[1] cho biến action
                }
                unset($arr[1]);// bỏ khỏi arr để xuống dưới arr chỉ còn params
            }

            // Xử lý params
            $this->params = $arr?array_values($arr):[];// nếu arr có tồn tại thì gán arr cho params, nếu không có thì gán mảng rỗng
            call_user_func_array([$this->controller, $this->action], $this->params);// Hàm này tạo đối tượng controller, chạy hàm action, tham số truyền vào là các param
            // call_user_func_array([$this->controller, $this->action], [$importData, $shipmentData]);
        }
        function UrlProcess(){
            if(isset($_GET['url'])){// Nếu tồn tại biến url đã đặt trong .htaccess
                return explode("/",filter_var(trim($_GET['url'],"/")));// tách từng phần tử từ url(bỏ dấu "/" đưa vào mảng)
            }
        }

    }
?>