<link rel="stylesheet" href="../Public/css/globals/globals.css">
<link rel="stylesheet" href="../Public/css/globals/components.css">
<link rel="stylesheet" href="../Public/css/globals/input-components.css">
<link rel="stylesheet" href="../Public/css/CustomerInfo/style.css">


<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/components/globals.js"></script>
<script src="../Public/scripts/CustomerInfo/script.js"></script>
<script src="../Public/scripts/CustomerInfo/load.js" defer></script>

<?php 
$loggedInAccount = $data["LoggedInAccount"];
$loggedInCustomer = $data["LoggedInCustomer"];

$avatar = $loggedInAccount["avatar"];
if(!isset($avatar)){
    $avatar="customerAvatar/_common/anon-user.jpg";
}
?>
<div class="body">
    <div class="hidden-info hidden">
        <div attrib="account_id" value="<?= $loggedInAccount["account_id"] ?>"> </div>
    </div>
    <div class="customer-info-form-wrapper">
        <div class="large-title">
            Thay đổi thông tin
        </div>
        <div class="avatar-info-wrapper">
            <div class="title">
                Ảnh cá nhân
            </div>
            <div class="avatar-img-wrapper">
                <img src="../Public/img/<?= $avatar ?>" alt="" srcset="">
                <div class="img-input-overlay">
                    <div class="overlay-message">
                        Chọn hình ảnh
                    </div>
                    <input name="input-thumbnail" type="file" accept="image/*" multiple="false" onchange="changeImage(this.files[0])">
                </div>
            </div>
        </div>
        <div class="input-info-wrapper">
            <div class="title">
                Thông tin tài khoản
            </div>
            <div class="c-input" id="input_email">
                <div class="input-label-wrapper">
                    <label for="input_password">Email</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input value="<?= $loggedInAccount["email"] ?>" class="input" name="input_email" type="text" placeholder="" onchange="enableEdit()"  onclick="(new InputElement(this.parentElement)).hideError()">
            </div>
            <div class="c-input" id="input_phone_number">
                <div class="input-label-wrapper">
                    <label for="input_phone_number">Số điện thoại</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input value="<?= $loggedInAccount["phone_number"] ?>" class="input" name="input_phone_number" type="text" placeholder="" onchange="enableEdit()"  onclick="(new InputElement(this.parentElement)).hideError()">
            </div>
            <div class="c-input" id="input_password">
                <div class="input-label-wrapper">
                    <label for="input_password">Mật khẩu</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input value="" class="input" name="input_password" type="password" placeholder="" onchange="enableEdit()"  onclick="(new InputElement(this.parentElement)).hideError()">
            </div>
            <div class="c-input" id="input_customer_fullname">
                <div class="input-label-wrapper">
                    <label for="input_customer_fullname">Họ và tên</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <input value="<?= $loggedInCustomer["customer_fullname"] ?>" class="input" name="input_customer_fullname" type="text" placeholder=""  onchange="enableEdit()"  onclick="(new InputElement(this.parentElement)).hideError()">
            </div>
            <div class="c-input" id="input_gender">
                <div class="input-label-wrapper">
                    <label for="input_gender">Giới tính</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <select name="input_gender" class="input" onchange="enableEdit()"  onclick="(new InputElement(this.parentElement)).hideError()">
                    <option value="0" <?php if($loggedInCustomer["gender"]==0) echo "selected" ?>>Nam</option>
                    <option value="1" <?php if($loggedInCustomer["gender"]==1) echo "selected" ?>>Nữ</option>
                </select>
            </div>
            <div class="c-input" id="input_address">
                <div class="input-label-wrapper">
                    <label for="input_address">Địa chỉ</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <textarea name="input_address" class="input" placeholder="" onchange="enableEdit()" onclick="(new InputElement(this.parentElement)).hideError()"><?= $loggedInCustomer["address"] ?></textarea>
            </div>
            <div class="info-edit-options">
                <div class="option save-info disabled" onclick="submitInfo(this)">
                    Lưu thông tin
                </div>
            </div>
        </div>
    </div>
</div>