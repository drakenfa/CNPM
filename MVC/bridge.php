<?php
    require_once "./MVC/Core/App.php";
    require_once "./MVC/Core/Controller.php";// Để cho các controller hiểu class Controler và extends
    require_once "./MVC/Core/DB.php";// gọi DB.php ngay đây sẽ giúp tất cả các file trong folder MVC hiểu được DB.php (hay)
    require_once "./MVC/Core/Service.php";// đưa file Service ra ngoài để các Service có thể thấy vào extends
?>  