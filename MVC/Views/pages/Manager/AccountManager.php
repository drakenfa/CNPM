<div class="card-box">
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-user"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-users-alt"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-team-check-alt"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-lock"></i>
        </div>
    </div>
</div>
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
        <select name="" id="role-filter">
            <option value="Vai trò">Vai trò</option>
        </select>
    </div>
    <div>Ngày tạo: </div>
    <div class="date-picker">
        <div class="start-date-picker">
            <label for="start-date">Từ:</label>
            <input type="date" name="" id="start-date" name="start-date" placeholder="Ngày bắt đầu">
        </div>
        <div class="end-date-picker">
            <label for="end-date">Đến:</label>
            <input type="date" name="" id="end-date" name="end-date" placeholder="Ngày kết thúc">
        </div>
    </div>
</div>


<div class="details">
    <div class="customer-table">
        <div class="table-header">
            <h2>Danh sách tài khoản</h2>
            <button id="btn-export-excel">Xuất Excel</button>
        </div>
        <table id="customer-table">
            <thead>
                <tr>
                    <td>Mã tài khoản</td>
                    <td>Số điện thoại</td>
                    <td>Email</td>
                    <td>Họ tên</td>
                    <td>Vai trò</td>
                    <td>Ngày tạo</td>
                    <td>Thao tác</td>
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
            <p>Khóa tài khoản</p>
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
                    <label for="" class="row-name">Mã tài khoản</label>
                    <div class="row-data row-account-id"></div>
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
                    <label for="" class="row-name">Họ và tên</label>
                    <div class="row-data row-fullname"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Vai trò</label>
                    <div class="row-data row-role"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã khách hàng/nhân viên</label>
                    <div class="row-data row-customer-staff-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày tạo</label>
                    <div class="row-data row-created-at"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày sửa đổi</label>
                    <div class="row-data row-updated-at"></div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="close" id="closeBtnInfo">Đóng</button>
        </div>
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
