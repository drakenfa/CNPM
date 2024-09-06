<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Techshop</title>
        <meta http-equiv="Cache-Control" content="max-age=3600, must-revalidate" />
        <link rel="stylesheet" href="../Public/css/components/header.css">
        <link rel="stylesheet" href="../Public/css/global/common.css">
        
        <link rel="stylesheet" href="../Public/css/globals/globals.css">
        <link rel="stylesheet" href="../Public/css/Shopcart/Shopcart.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <?php require_once "./MVC/Views/blocks/header.php" ?>
        <div class="no-item-icon" id="no-item">
            <i class="fa-solid fa-bag-shopping"></i></br>
            <span>Không có sản phẩm nào trong giỏ hàng</span></br>
            <a href="../Home/" class="backhome">Về trang chủ</a>
        </div>
        <div id="container">
            <div class="inline" >
                <a href="../Home/" class="backhome-2">Trang chủ -></a>
            </div>
            <span class="inline" id="container-1">
                Giỏ hàng </br>
            </span>
        </div>
        <div class="container" id="container-2">
    <div class="gio-1">
        Giỏ hàng
    </div>
    <div class="reset" id="reset-button">
        <button>
            Xóa tất cả
        </button>
    </div>
</div>
        <div class="shop-cart" id="cart">
            <div class="cart">
                <div class="cart-header">
                    <div class="header1"></div>
                    <div class="header2">Đơn giá</div>
                    <div class="header2">Số lượng</div>
                    <div class="header2 header4">Thành tiền</div>
                </div>
                <div class="cart-content">

                </div>
                <div class="cart-footer">

                </div>
            </div>
            <div class="Total">
                <div class="Total-header"> Thanh Toán</div>
                <div class="Total-content">
                    <div class="temp-money" >Tạm tính</div> 
                    <div class="value-temp-money" id="temp-money">đ</div> 
                    <div class="total-money"> Thành tiền</div>
                    <div class="value-total-money"></div>
                </div>
                <!-- <a href="/web-ban-hang/Signin/" class="Total-footer">
                    Thanh toán<br>
                    <span class="help">Đăng nhập để tiếp tục</span>
                </a>  -->
                <div  class="Total-footer" id ="Total-footer">
                    <!-- Thanh toán<br> -->
                    <a class="help" href="../Signin/">Đăng nhập để tiếp tục</a>
                </div>                 
            </div>
        </div>
        <div id="personalInfoForm" style="display: none;">
    <!-- <form action="../Order/CreateOrder" method="post" class="modal-body" enctype="multipart/form-data">
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
        <input type="submit" value="Submit">
    </form> -->
</div>
        <?php require_once "./MVC/Views/pages/".$data["Page"].".php" ?>
    </body>
        <script src="../Public/scripts/Shopcart/script2.js"> </script>
</html>
