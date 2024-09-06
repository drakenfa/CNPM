<link rel="stylesheet" href="../Public/css/SignIn/ForgotPassword/style.css">

<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/SignIn/ForgotPassword/send_email_script.js" defer></script>

<div class="body">
    <form action="../SignIn/SendVerificationEmail" method="post" enctype="multipart/form-data" class="forgot-password-form input-form">
        <div class="title">
            Quên mật khẩu
        </div>
        <hr class="form-separation">
        <div class="form-content-wrapper">
            <div class="form-message">
                Nhập Email của tài khoản để gửi mã xác nhận
            </div>
            <br>
            <div class="c-input" id="input_email">
                <div class="input-label-wrapper">
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input autocomplete="off" class="input" type="text" name="input_email" placeholder="Nhập Email" onclick="(new InputElement(this.parentElement)).hideError()" autocomplete="off">
            </div>
        </div>
        <hr class="form-separation">
        <div class="form-bottom-wrapper">
            <div class="submit-wrapper">
                <input type="submit" value="Gửi">
            </div>
            <div class="form-bottom-options">
                <a class="option" href="../SignIn/">Quay lại đăng nhập</a>
            </div>
        </div>
    </form>
</div>