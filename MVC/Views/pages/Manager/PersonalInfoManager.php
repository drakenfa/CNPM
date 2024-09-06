<div class="card-box">
    <div class="card">
        <div class="content">
            <div class="personal-info">
                <div class="icon-in-box">
                    <i class="fi fi-rr-overview"></i>
                </div>
                <span class="title">Xem thông tin</span>
            </div>
            <div class="edit-personal-info">
                <div class="icon-in-box">
                    <i class="fi fi-rr-edit"></i>
                </div>
                <span class="title">Sửa thông tin</span>
            </div>
        </div>
        <!-- <div class="icon-box">
            <i class="fi fi-rr-user"></i>
        </div> -->
    </div>
    <div class="card">
        <div class="content">
            <div class="leave">
                <div class="icon-in-box">
                    <i class="fi fi-rr-clipboard"></i>
                </div>
                <span class="title">Xin nghỉ phép</span>
            </div>
            <div class="sick">
                <div class="icon-in-box">
                    <i class="fi fi-rr-person-pregnant"></i>
                </div>
                <span class="title">Xin nghỉ ốm đau, thai sản</span>
            </div>
        </div>
        <!-- <div class="icon-box">
            <i class="fi fi-rr-document"></i>
        </div> -->
    </div>
    <div class="card">
    <div class="content">
            <div class="retire">
                <div class="icon-in-box">
                    <i class="fi fi-rr-house-leave"></i>
                </div>
                <span class="title">Xin từ chức</span>
            </div>
            <a href="../InternalManager/SelfSalaryManager" class="self-salary" style="text-decoration: none; color: #000;">
                <div class="icon-in-box">
                    <i class="fi fi-rr-user-salary"></i>
                </div>
                <span class="title">Lương cá nhân</span>
            </a>
        </div>
    </div>
    
    <div class="card">
        <div class="content">
            <div class="change-password">
                <div class="icon-in-box">
                    <i class="fi fi-rr-lock"></i>
                </div>
                <span class="title">Đổi mật khẩu</span>
            </div>
            <a href="Logout" class="logout">
                <div class="sick">
                    <div class="icon-in-box">
                        <i class="fi fi-rr-power"></i>
                    </div>
                    <span class="title">Đăng xuất</span>
                </div>
            </a>
        </div>
        <!-- <div class="icon-box">
            <i class="fi fi-rr-document"></i>
        </div> -->
    </div>
</div>

<div class="modal hide">
<div class="modal-inner modal-change-password hide">
        <div class="modal-header">
            <p>Đổi mật khẩu</p>
            <i class="fi fi-rr-cross-small" id="closeIconChangePassword"></i>
        </div>
        <form action="../Account/ChangePassword" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="input-section">
                <label for="old_password_form" class="label-form">Mật khẩu cũ</label>
                <br>
                <input type="password" name="old_password_form" placeholder="Mật khẩu cũ..." class="old_password_form" autocomplete="off" id="old_password_form" required>
                <br>
                <span class="warning old-password-warning">Mật khẩu không đúng</span>
            </div>
            <div class="input-section">
                <label for="new_password_form" class="label-form">Mật khẩu mới</label>
                <br>
                <input type="password" name="new_password_form" class="new_password_form" required placeholder="Mật khẩu mới...">
                <br>
                <span class="warning new-password-warning">Phải có 7 ký tự, có chữ thường, chữ hoa, số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="confirm_password_form" class="label-form">Xác nhận mật khẩu</label>
                <br>
                <input type="password" name="confirm_password_form" class="confirm_password_form" placeholder="Xác nhận mật khẩu..." autocomplete="off" id="confirm_password_form" required>
                <br>
                <span class="warning confirm-password-warning">Mật khẩu không khớp</span>
            </div>
            <div class="modal-footer">
                <div class="reset-btn" title="refresh">
                    <i class="fi fi-rr-refresh"></i>
                </div>
                <button class="confirm" id="confirmBtnChangePassword">Xác nhận thêm</button>
                <input type="text" name="account_id" style="display: none" class="account_id">
            </div>
        </form>
    </div>
    <div class="modal-inner modal-info hide">
        <div class="modal-header">
            <p>Thông tin cá nhân</p>
            <i class="fi fi-rr-cross-small" id="closeIconInfo"></i>
        </div>
        <div class="modal-body">
            <div class="info-section">
                <div class="row-section">
                    <label for="" class="row-name">Họ tên</label>
                    <div class="row-data row-fullname"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Chức vụ</label>
                    <div class="row-data row-role"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã nhân viên</label>
                    <div class="row-data row-staff-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã tài khoản</label>
                    <div class="row-data row-account-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Giới tính</label>
                    <div class="row-data row-gender"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Địa chỉ</label>
                    <div class="row-data row-address"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày vào làm</label>
                    <div class="row-data row-entry-date"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Số điện thoại</label>
                    <div class="row-data row-phone-number"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Email</label>
                    <div class="row-data row-email"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày tạo tài khoản</label>
                    <div class="row-data row-created-at"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày sửa đổi</label>
                    <div class="row-data row-updated-at"></div>
                </div>
            </div>
            
            <div class="avatar-section">
                <img src="" alt="" class="avatar-image">
            </div>
        </div>
        <div class="modal-footer">
            <button class="close" id="closeBtnInfo">Đóng</button>
        </div>
    </div>
    <div class="modal-inner modal-edit hide">
        <div class="modal-header">
            <p>Sửa thông tin cá nhân</p>
            <i class="fi fi-rr-cross-small" id="closeIconEdit"></i>
        </div>
        <form action="../Staff/UpdateStaffHaveAvatar" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="input-section">
                <label for="fullname_edit_form" class="label-form">Họ và tên</label>
                <br>
                <input type="text" name="fullname_edit_form" placeholder="Họ và tên..." class="fullname-edit-form" autocomplete="off" id="fullname_edit_form">
                <br>
                <span class="warning edit-fullname-warning">Tên không chứa số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="phone_number_edit_form" class="label-form">Số điện thoại</label>
                <br>
                <input type="text" name="phone_number_edit_form" class="phone-number-edit-form" placeholder="Số điện thoại..." autocomplete="off" id="phone_number_edit_form">
                <br>
                <span class="warning edit-phone-number-warning">Phải đủ 10 số và bắt đầu là 0</span>
            </div>
            <div class="input-section">
                <label for="email_edit_form" class="label-form">Email</label>
                <br>
                <input type="email" name="email_edit_form" class="email-edit-form" autocomplete="off" id="email_edit_form" placeholder="Email...">
                <br>
                <span class="warning edit-email-warning">Email không đúng định dạng</span>
            </div>
            <div class="input-section">
                <label for="gender_edit_form" class="label-form">Giới tính</label>
                <br>
                <select name="gender_edit_form" class="gender-edit-form" id="gender_edit_form">
                    <option value="-1">Giới tính</option>
                    <option value="0">Nam</option>
                    <option value="1">Nữ</option>
                </select>
                <br>
                <span class="warning edit-gender-warning">Bạn phải chọn giới tính</span>
            </div>
            <div class="input-section">
                <label for="address_edit_form" class="label-form">Địa chỉ</label>
                <br>
                <input type="text" name="address_edit_form" placeholder="Địa chỉ..." required class="address-edit-form" autocomplete="off" id="address_edit_form">
            </div>
            <div class="input-section">
                <label for="avatar_edit_form" class="label-form">Ảnh đại diện</label>
                <br>
                <input type="file" class="custom-file-input avatar-edit-form" name="avatar_edit_form" autocomplete="off" id="avatar_edit_form">
                <br>
                <span class="warning edit-avatar-warning">Định dạng ảnh phải là png, jpg, jpeg</span>
            </div>
            <div class="modal-footer">
                <div class="reset-btn" title="refresh">
                    <i class="fi fi-rr-refresh"></i>
                </div>
                <input type="text" name="account_id" style="display: none" class="account_id">
                <input type="text" name="staff_id" style="display: none" class="staff_id">
                <button class="confirm" id="confirmBtnEdit">Xác nhận sửa</button>
            </div>
        </form>
    </div>
    
<div class="modal-inner modal-leave-application hide">
        <div class="modal-header">
            <p>Đơn nghỉ phép</p>
            <i class="fi fi-rr-cross-small" id="closeIconLeaveApplication"></i>
        </div>
        <form action="../LeaveApplication/ApproveLeaveApplication" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="date-picker">
                <div class="start-date-picker">
                    <label for="start-date">Từ:</label>
                    <input type="date" name="start_date" id="leave-start-date" name="start-date" placeholder="Ngày bắt đầu" required>
                </div>
                <div class="end-date-picker">
                    <label for="end-date">Đến:</label>
                    <input type="date" name="end_date" id="leave-end-date" name="end-date" placeholder="Ngày kết thúc" required>
                </div>
            </div>
            
            <div class="row-section" style="margin-top: 20px">
                <label for="" class="row-name">Lý do: cá nhân</label>
                <div class="row-data row-phone-number"></div>
            </div>
            <div class="modal-footer">
                <button class="confirm" id="confirmBtnLeaveSubmit">Xác nhận thêm</button>
                <input type="text" name="staff_id_leave" style="display: none" class="staff_id_leave">
            </div>
        </form>
    </div>
    <div class="modal-inner modal-sick-application hide">
        <div class="modal-header">
            <p>Đơn nghỉ phép</p>
            <i class="fi fi-rr-cross-small" id="closeIconSickApplication"></i>
        </div>
        <form action="../LeaveApplication/ApproveSickApplication" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="date-picker">
                <div class="start-date-picker">
                    <label for="start-date">Từ:</label>
                    <input type="date" name="start_date" id="sick-start-date" name="start-date" placeholder="Ngày bắt đầu" required>
                </div>
                <div class="end-date-picker">
                    <label for="end-date">Đến:</label>
                    <input type="date" name="end_date" id="sick-end-date" name="end-date" placeholder="Ngày kết thúc" required>
                </div>
            </div>
            
            <div class="row-section" style="margin-top: 20px">
                <label for="" class="row-name">Lý do: Ốm đau, thai sản</label>
                <div class="row-data row-phone-number"></div>
            </div>
            <div class="modal-footer">
                <button class="confirm" id="confirmBtnSickSubmit">Xác nhận thêm</button>
                <input type="text" name="staff_id_sick" style="display: none" class="staff_id_sick">
            </div>
        </form>
    </div>
    <div class="modal-inner modal-demist-application hide">
        <div class="modal-header">
            <p>Xin thôi việc</p>
            <i class="fi fi-rr-cross-small" id="closeIconDemistApplication"></i>
        </div>
        <form action="../LeaveApplication/ApproveDemistApplication" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="date-picker">
                <div class="start-date-picker" style=" display:none;">
                    <label for="start-date">Từ:</label>
                    <input type="date" name="start_date" id="demist-start-date" name="start-date">
                </div>
            </div>
            <div class="row-section">
                <label for="" class="row-name">Bạn có chắc chắn muốn nộp đơn thôi việc?</label>
                <div class="row-data row-phone-number"></div>
            </div>
            <div class="modal-footer">
                <button class="confirm" id="confirmBtnDemistSubmit">Xác nhận</button>
                <input type="text" name="staff_id_demist" style="display: none" class="staff_id_demist">
            </div>
        </form>
    </div>
</div>