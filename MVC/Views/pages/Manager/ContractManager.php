<div class="filter-bar">
    <div class="search">
        <label for="">
            <input type="text" placeholder="Tìm kiếm..." id="search-filter">
            <i class="fi fi-rr-search"></i>
        </label>
    </div>
    <!-- <div class="add-customer">
        <button class="add-btn" title="Thêm khách hàng"><i class="fi fi-rr-plus"></i></button>
    </div> -->
    <div class="attendence">
        <a href="../InternalManager/TimesheetManager"><button class="attendence-btn" title="Chấm công">Chấm công</button></a>
    </div>
    <div class="attendence">
        <a href="../InternalManager/TimesheetManager"><button class="attendence-btn" title="Chấm công">Lương</button></a>
    </div>
</div>

<div class="details">
    <div class="customer-table">
        <div class="table-header">
            <h2>Danh sách hợp đồng</h2>
            <button id="btn-export-excel">Xuất Excel</button>
        </div>
        <table id="customer-table">
            <thead>
                <tr>
                    <td>Mã hợp đồng</td>
                    <td>Mã nhân viên</td>
                    <td>Họ tên</td>
                    <td>Ngày bắt đầu</td>
                    <td>Ngày kết thúc</td>
                    <td>Lương thỏa thuận</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>
<!-- <div class="modal hide">
<div class="modal-inner modal-add hide">
        <div class="modal-header">
            <p>Thêm hợp đồng</p>
            <i class="fi fi-rr-cross-small" id="closeIconAdd"></i>
        </div>
        <form action="../Customer/CreateCustomer" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="input-section">
                <label for="fullname_add_form" class="label-form">Họ và tên</label>
                <br>
                <input type="text" name="fullname_add_form" placeholder="Họ và tên..." class="fullname-add-form" autocomplete="off" id="fullname_add_form" required>
                <br>
                <span class="warning add-fullname-warning">Tên không chứa số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="birth_date_add_form" class="label-form">Ngày sinh</label>
                <br>
                <input type="date" name="birth_date_add_form" class="birth-date-add-form" required>
                <br>
                <span class="warning add-birth-date-warning">Bạn phải trên 13 tuổi</span>
            </div>
            <div class="input-section">
                <label for="phone_number_add_form" class="label-form">Số điện thoại</label>
                <br>
                <input type="text" name="phone_number_add_form" class="phone-number-add-form" placeholder="Số điện thoại..." autocomplete="off" id="phone_number_add_form" required>
                <br>
                <span class="warning add-phone-number-warning">Phải đủ 10 số và bắt đầu là 0</span>
            </div>
            <div class="input-section">
                <label for="email_add_form" class="label-form">Email</label>
                <br>
                <input type="email" name="email_add_form" class="email-add-form" placeholder="Email..." autocomplete="off" id="email_add_form" required>
                <br>
                <span class="warning add-email-warning">Email không đúng định dạng</span>
            </div>
            <div class="input-section">
                <label for="gender_add_form" class="label-form">Giới tính</label>
                <br>
                <select name="gender_add_form" class="gender-add-form">
                    <option value="-1">Giới tính</option>
                    <option value="0">Nam</option>
                    <option value="1">Nữ</option>
                </select>
                <br>
                <span class="warning add-gender-warning">Bạn phải chọn giới tính</span>
            </div>
            <div class="input-section">
                <label for="address_add_form" class="label-form">Địa chỉ</label>
                <br>
                <input type="text" name="address_add_form" placeholder="Địa chỉ..." required class="address-add-form" autocomplete="off" id="address_add_form">
            </div>
            <div class="input-section">
                <label for="password_add_form" class="label-form">Mật khẩu</label>
                <br>
                <input type="password" name="password_add_form" placeholder="Mật khẩu..." required class="password-add-form" autocomplete="off" id="password_add_form">
                <br>
                <span class="warning add-password-warning">Mật khẩu phải có chữ, số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="avatar_add_form" class="label-form">Ảnh đại diện</label>
                <br>
                <input type="file" class="custom-file-input avatar-add-form" name="avatar_add_form" autocomplete="off" required id="avatar_add_form">
                <br>
                <span class="warning add-avatar-warning">Định dạng ảnh phải là png, jpg, jpeg</span>
            </div>
            <div class="modal-footer">
                <div class="reset-btn" title="refresh">
                    <i class="fi fi-rr-refresh"></i>
                </div>
                <button class="confirm" id="confirmBtnAdd">Xác nhận thêm</button>
            </div>
        </form>
    </div>
</div> -->