<div class="filter-bar">
    <div class="search">
        <label for="">
            <input type="text" placeholder="Tìm kiếm..." id="search-filter">
            <i class="fi fi-rr-search"></i>
        </label>
    </div>
    <div class="reset" title="refresh">
        <button class="reset-btn"><i class="fi fi-rr-refresh"></i></button>
    </div>
    <div class="combobox-filter">
        <select name="" id="month-filter">
            <option value="0">Tháng</option>
        </select>
    </div>
    <div class="combobox-filter">
        <select name="" id="year-filter">
            <option value="0">Năm</option>
        </select>
    </div>
    <div class="attendence">
        <a href="../InternalManager/AttendenceManager"><button class="attendence-btn" title="Điểm danh">Điểm danh</button></a>
    </div>
    <div class="attendence">
        <a href="../InternalManager/TimesheetManager"><button class="attendence-btn" title="Chấm công">Chấm công</button></a>
    </div>
    <div class="attendence">
        <a href="../InternalManager/ContractManager"><button class="attendence-btn" title="Hợp đồng">Hợp đồng</button></a>
    </div>
</div>

<div class="details">
    <div class="customer-table">
        <div class="table-header">
            <h2>Danh sách lương</h2>
            <button id="btn-export-excel">Xuất Excel</button>
        </div>
        <table id="customer-table">
            <thead>
                <tr>
                    <td>Mã nhân viên</td>
                    <td>Họ tên</td>
                    <td>Mã hợp đồng</td>
                    <td>Tháng</td>
                    <td>Năm</td>
                    <td>Lương thỏa thuận</td>
                    <td>Lương thực nhận</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>

<div class="modal hide">
    <!-- Xóa nhân viên -->
    <div class="modal-inner modal-delete hide">
        <div class="modal-header">
            <p>Xóa khách hàng</p>
            <i class="fi fi-rr-cross-small" id="closeIconDelete"></i>
        </div>
        <div class="modal-body">
            <p class="content-delete"></p>
            <div class="modal-footer">
                <a href="" class="delete-a"><button class="confirm" id="confirmBtnDelete">Xác nhận</button></a>
                <button class="close" id="closeBtnDelete">Hủy</button>
            </div>
        </div>
        
    </div>
    <!-- Xem thông tin-->
    <div class="modal-inner modal-info hide">
        <div class="modal-header">
            <p>Thông tin</p>
            <i class="fi fi-rr-cross-small" id="closeIconInfo"></i>
        </div>
        <div class="modal-body">
            <div class="info-section">
                <div class="row-section">
                    <label for="" class="row-name">Mã khách hàng</label>
                    <div class="row-data row-customer-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Họ và tên</label>
                    <div class="row-data row-fullname"></div>
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
                    <label for="" class="row-name">Giới tính</label>
                    <div class="row-data row-gender"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Địa chỉ</label>
                    <div class="row-data row-address"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày sinh</label>
                    <div class="row-data row-birth-date"></div>
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
    <!-- Sửa thông tin -->
    <div class="modal-inner modal-edit hide">
        <div class="modal-header">
            <p>Sửa khách hàng</p>
            <i class="fi fi-rr-cross-small" id="closeIconEdit"></i>
        </div>
        <form action="../Customer/UpdateCustomer" method="post" class="modal-body">
            <div class="input-section">
                <label for="fullname_edit_form" class="label-form">Họ và tên</label>
                <br>
                <input type="text" name="fullname_edit_form" placeholder="Họ và tên..." class="fullname-edit-form" autocomplete="off" id="fullname_edit_form" required>
                <br>
                <span class="warning edit-fullname-warning">Tên không chứa số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="birth_date_edit_form" class="label-form">Ngày sinh</label>
                <br>
                <input type="date" name="birth_date_edit_form" class="birth-date-edit-form" required>
                <br>
                <span class="warning edit-birth-date-warning">Bạn phải trên 13 tuổi</span>
            </div>
            <div class="input-section">
                <label for="phone_number_edit_form" class="label-form">Số điện thoại</label>
                <br>
                <input type="text" name="phone_number_edit_form" class="phone-number-edit-form" placeholder="Số điện thoại..." autocomplete="off" id="phone_number_edit_form" required>
                <br>
                <span class="warning edit-phone-number-warning">Phải đủ 10 số và bắt đầu là 0</span>
            </div>
            <div class="input-section">
                <label for="email_edit_form" class="label-form">Email</label>
                <br>
                <input type="email" name="email_edit_form" class="email-edit-form" autocomplete="off" id="email_edit_form" placeholder="Email..." required>
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
                <label for="password_edit_form" class="label-form">Mật khẩu</label>
                <br>
                <input type="password" name="password_edit_form" placeholder="Mật khẩu..." required class="password-edit-form" autocomplete="off" id="password_edit_form">
                <br>
                <span class="warning edit-password-warning">Mật khẩu phải có chữ, số và ký tự đặc biệt</span>
            </div>
            <div class="modal-footer">
                <div class="reset-btn" title="refresh">
                    <i class="fi fi-rr-refresh"></i>
                </div>
                <input type="text" name="account_id" style="display: none" class="account_id">
                <input type="text" name="customer_id" style="display: none" class="customer_id">
                <button class="confirm" id="confirmBtnEdit">Xác nhận sửa</button>
            </div>
        </form>
    </div>
    <div class="modal-inner modal-add hide">
        <div class="modal-header">
            <p>Thêm khách hàng</p>
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
</div>
