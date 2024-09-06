<link rel="stylesheet" href="../Public/css/SignIn/ForgotPassword/style.css">

<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/SignIn/ForgotPassword/change_password_script.js" defer></script>

<div class="body">
    <form action="../SignIn/ChangePassword" method="post" enctype="multipart/form-data" class="forgot-password-form input-form">
        <div class="title">
            Đổi mật khẩu
        </div>
        <hr class="form-separation">
        <div class="form-content-wrapper">
            <div class="form-message">
                Nhập mật khẩu mới cho tài khoản
            </div>
            <br>
            <div class="c-input" id="input_new_password">
                <div class="input-label-wrapper">
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input autocomplete="off" class="input" type="password" name="input_new_password" placeholder="Nhập mật khẩu mới" onclick="(new InputElement(this.parentElement)).hideError()" autocomplete="off">
            </div>
        </div>
        <hr class="form-separation">
        <div class="form-bottom-wrapper">
            <div class="submit-wrapper">
                <input type="submit" value="Đổi mật khẩu">
            </div>
        </div>
    </form>
</div>