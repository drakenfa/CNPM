<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Techshop</title>
        <meta http-equiv="Cache-Control" content="max-age=3600, must-revalidate" />
        <link rel="stylesheet" href="../Public/css/globals/globals.css">
        <link rel="stylesheet" href="../Public/css/components/header.css">
        <link rel="stylesheet" href="../Public/css/global/common.css">
        <link rel="stylesheet" href="../Public/css/Checkout/Checkout.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <?php require_once "./MVC/Views/blocks/header.php" ?>
 
        <div class="inline">
            <a href="/web-ban-hang/Home/" class="backhome-2">Trang chủ -></a>
        </div>
        <span class="inline" >
            <a href="http://localhost/web-ban-hang/Shopcart/" class="inline-3">Giỏ hàng -> </br></a>
        </span>
        <span class="inline">
            Thanh toán </br>
        </span>
        <div class="container">
    <div class="gio-1">
       Thông tin nhận hàng
    </div>

</div>
        <div class="shop-cart" id="cart">
            <div class="cart">
                <form  method="post" class="modal-body" enctype="multipart/form-data" id="create">
                <label  id="total_money" name="total_money" style="display:none"></label><br>
                <label>Họ tên người nhận </label> <label style="color: red;">*</label> <br>
                <input class="input1" id="name" name="name"> <br>
                <label>Số điện thoại</label><label style="color: red;">*</label> <br>
                <input class="input1" id="phone_number" name="phone_number"> <br>
                <label>Địa chỉ</label><label style="color: red;">*</label> <br>
                <input class="input1" id="address" name="address"> <br>
                <label>Email</label><label style="color: red;">*</label> <br>
                <input class="input1" id="email" name="email"> <br>
                <label>Note</label> <br>
                <input class="input2" id="note" name="note"></br>
                <label for="shipping" style="margin-right:190px ;">Vận chuyển: </label>
                    <select id="shipping_method" name="shipping_method"> </br>
                    <option value="express">Express</option></br>

                    <!-- Các tùy chọn khác nếu cần -->
                    </select> </br>

                    <label for="payment" style="margin-right:169px ;">Phương thức thanh toán:</label>
                    <select id="payment_method" name="payment_method">
                    <option value="COD">COD</option>
                    <!-- Các tùy chọn khác nếu cần -->
                    </select> </br>
                    <label class="b">Mã tra cứu</label> 
                    <!-- Hidden input field to submit the tracking_number value -->
                    <input type="hidden" name="tracking_number" id="tracking_number_hidden">

                    <!-- Disabled input field for display -->
                    <input class="C .no-change" id="tracking_number_display" disabled>
                    <input type="submit" value="Submit" style="display:none">
                    </form>
            </div>
            <div class="right">
                <div class="Shop" >
                    <div class="Shop-content">
                        <div></div>
                        <!-- <div class="temp-money" >Tạm tính</div> 
                        <div class="value-temp-money" id="temp-money">100 000đ</div> 
                        <div class="fee-money" >Phí vận chuyển</div> 
                        <div class="value-fee" id="fee"> 50 000đ</div> 
                        <div class="total-money"> Thành tiền</div>
                        <div class="value-total-money" >160 000 đ</div> -->
                    </div>
                </div>
                <div class="Total" style="margin-top: 50px;">
                    <div class="Total-header"> </div>
                    <div class="Total-content">
                        <div class="temp-money" >Tạm tính</div> 
                        <div class="value-temp-money" id="temp-money">100 000đ</div> 
                        <div class="total-money"> Thành tiền</div>
                        <div class="value-total-money" >160 000 đ</div>
                    </div>
                    <!-- <a href="/web-ban-hang/Signin/" class="Total-footer">
                        Thanh toán<br>
                        <span class="help">Đăng nhập để tiếp tục</span>
                    </a>  -->
                    <div  class="Total-footer" id ="Total-footer">
                        <!-- Thanh toán<br> -->
                        <span class="help" >Thanh toán</span>
                    </div>   
                    <span style="margin-top: 10px;">Nhấn thanh toán đồng nghĩa với bạn đồng ý với chúng tôi</span>
                    <span style="margin-top: 10px; color:blue; " >Điều khoản và điều kiện</span>
                </div>
            </div>
        </div>
        <div id="personalInfoForm" style="display: none;">
    <!-- Form nhập thông tin cá nhân sẽ được thêm vào đây -->
    <!-- Ví dụ: -->
    <form action="../Order/CreateOrder" method="post" class="modal-body" enctype="multipart/form-data">
        <label for="name">Họ tên:</label>
        <input type="text" id="name" name="name"><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email"><br>
        <label for="phone_number">Số điện thoại:</label>
        <input type="phone_number" id="phone_number" name="phone_number"><br>
        <label for="address">Địa chỉ:</label>
        <input type="address" id="address" name="address"><br>
        <label for="note">Ghi chú:</label>
        <input type="note" id="note" name="note"><br>
        <!-- Thêm các trường thông tin khác cần nhập -->
        <input type="submit" value="Submit">
    </form>
</div>
        <?php require_once "./MVC/Views/pages/".$data["Page"].".php" ?>
    </body>
        <script src="../Public/scripts/Checkout/script.js"></script>
</html>
