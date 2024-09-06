<link rel="stylesheet" href="../Public/css/SignIn/SignUp/style.css">
<link rel="stylesheet" href="../Public/css/globals/input-components.css">

<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/SignIn/SignUp/script.js" defer></script>
<div class="body two-subpanels">
    <div class="subpanel left-panel">
        <!-- <div class="widget-wrapper">
            <div class="widget">
                <div class="widget">
                </div>
            </div>
        </div> -->
        <div class="background-image-wrapper">
            <img src="../Public/img/web_icons/shop_background.png" alt="" srcset="">
        </div>
    </div>
    <div class="subpanel right-panel">
        <div class="sign-up-form-wrapper">
            <div class="form-title">
                <div class="shop-name-display">
                    <div class="logo-wrapper">
                        <img src="../Public/img/logo/logo.png" width="100px" height="100px" alt="">
                    </div>
                    <div class="shop-name">
                        Techshop
                    </div>    
                </div>
                <div class="form-title-message">
                    Đăng ký
                </div>
            </div>
            <div class="form-message">

            </div>
            <form class="sign-up-form" action="#" method="post">
                <div class="c-input" id="input_email">
                    <div class="input-label-wrapper">
                        <label for="input_email">Email</label>
                        <div class="input-error-message">
                            
                        </div>    
                    </div>
                    <input class="input" autocomplete="off" name="input_email" type="text" placeholder="Nhập email" onclick="(new InputElement(this.parentElement)).hideError()">
                </div>
                <div class="c-input" id="input_phone_number">
                    <div class="input-label-wrapper">
                        <label for="input_email">Số điện thoại</label>
                        <div class="input-error-message">
                            
                        </div>    
                    </div>
                    <input class="input" autocomplete="off" name="input_phone_number" type="text" placeholder="Nhập số điện thoại" onclick="(new InputElement(this.parentElement)).hideError()">
                </div>
                <div class="c-input" id="input_password">
                    <div class="input-label-wrapper">
                        <label for="input_password">Mật khẩu</label>
                        <div class="input-error-message">
                            
                        </div>
                    </div>
                    <input class="input" name="input_password" type="password" autocomplete="off" placeholder="Nhập mật khẩu" onclick="(new InputElement(this.parentElement)).hideError()">
                </div>
                <div class="c-input" id="input_confirm_password">
                    <div class="input-label-wrapper">
                        <label for="input_confirm_password">Nhập lại mật khẩu</label>
                        <div class="input-error-message">
                            
                        </div>  
                    </div>  
                    <input class="input" name="input_confirm_password" type="password" autocomplete="off" placeholder="Nhập lại mật khẩu" onclick="(new InputElement(this.parentElement)).hideError()">
                </div>
                <input type="button" value="Tạo tài khoản" onclick="processSignUp()">            
            </form>
            <div class="sign-up-bottom-options">
                Đã có tài khoản?
                <a href="../SignIn/">Đăng nhập</a>
            </div>
        </div>
    </div>
</div>