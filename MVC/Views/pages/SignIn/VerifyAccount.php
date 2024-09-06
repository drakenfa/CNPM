<link rel="stylesheet" href="../Public/css/SignIn/VerifyAccount/style.css">

<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/SignIn/VerifyAccount/script.js" defer></script>

<div class="body">
    <form action="../SignUp/DoVerifyEmail" method="post" enctype="multipart/form-data" class="email-verification-form">
        <div class="title">
            Xác nhận email
        </div>        
        <hr class="form-separation">
        <div class="form-content-wrapper">
            <div class="form-message">
                Mã xác nhận đã được gửi tới email <?=$_SESSION["signup_user_data"]["email"]?>. Vui lòng kiểm tra email, mã sẽ hết hạn trong vòng 5 phút.
            </div>
            <div class="c-input" id="input-verification-code">
                <div class="input-label-wrapper">
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input class="input" type="text" name="verification-code-input" id="verification-code-input" class="code-input" maxlength="6" placeholder="Nhập mã xác nhận" autocomplete="off" onclick="(new InputElement(this.parentElement)).hideError()">
            </div>
        </div>
        <hr class="form-separation">
        <div class="form-bottom-wrapper">
            <div class="submit-wrapper">
                <input id="code-submit" type="submit" value="Xác nhận email">
                <input id="resend-submit" type="button" value="Gửi lại mã" onclick="doResendVerificationCode()">
            </div>
            <a href="../SignUp/">Quay lại trang đăng nhập</a>
        </div>
    </form>
</div>