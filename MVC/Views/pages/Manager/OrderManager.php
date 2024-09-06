<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<div class="card-box">
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-seller"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-supplier-alt"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-user-gear"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-admin-alt"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-admin-alt"></i>
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
        <select name="" id="status-filter">
            <option value="Tình trạng">Tình trạng</option>
        </select>
    </div>
    <div>Ngày đặt đơn: </div>
    <div class="date-picker">
        <div class="start-date-picker">
            <label for="start-date">Từ:</label>
            <input type="date" name="" id="start-date" name="start-date" placeholder="Ngày đặt đơn">
        </div>
    </div>
    <div class="date-picker">
        <div class="end-date-picker">
            <label for="end-date">Đến:</label>
            <input type="date" name="" id="end-date" name="end-date" placeholder="Ngày kết thúc">
        </div>
    </div>
</div>


<div class="details">
    <div class="staff-table">
        <div class="table-header">
            <h2>Danh sách hóa đơn</h2>
        </div>
        <table>
            <thead>
                <tr>
                    <td>Mã đơn</td>
                    <td>Ngày đặt</td>
                    <td>Tổng tiền</td>
                    <td>Tracking Number</td>
                    <td>Tình trạng</td>
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
            <p>Hủy đơn hàng</p>
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
            <p>Chi tiết hóa đơn</p>
            <button class="next-page-btn">Trang kế tiếp (1/3)</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo"></i>
        </div>
        <div class="modal-body">
            <div class="info-section">
                <div class="row-section">
                    <label for="" class="row-name">Mã đơn</label>
                    <div class="row-data row-order-id"></div>
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
                    <label for="" class="row-name">Họ tên người nhận</label>
                    <div class="row-data row-receiver-name"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Email người nhận</label>
                    <div class="row-data row-email-of-receiver"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Số điện thoại người nhận</label>
                    <div class="row-data row-phone-number-of-receiver"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Địa chỉ</label>
                    <div class="row-data row-shipping-address"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày đặt</label>
                    <div class="row-data row-order-date"></div>
                </div>
                <div class="row-section" style="display: none;">
                    <label for="" class="row-name">Ngày ship</label>
                    <div class="row-data row-shipping-date"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã số</label>
                    <div class="row-data row-tracking-number"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Phương thức trả tiền</label>
                    <div class="row-data row-payment-method"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Tình trạng</label>
                    <div class="row-data row-status-of-order"></div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="close" id="closeBtnInfo">Đóng</button>
        </div>
    </div>
    <div class="modal-inner modal-note hide">
        <div class="modal-header">
            <p>Note</p>
            <button class="down-page-btn">Trang trước</button>
            <button >(2/3)</button>
            <button class="next-page-btn1">Trang kế tiếp</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo1"></i>
        </div>
        <div class="modal-body">
            <div class="note">
            <!-- Nội dung note -->
            <div class="row-section">
                    <div class="row-data row-note"></div>
                </div>
            </div>
            <!-- <div class="row-section">
                    <div class="row-data row-sku-id"></div>
                </div>
            </div> -->
        </div>
        <div class="modal-footer">
            <button class="close close-btn">Đóng</button>
        </div>
    </div>
    <div class="modal-inner modal-details hide">
        <div class="modal-header">
            <p>Details</p>
            <button class="down-page-btn1">Trang trước (3/3)</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo2"></i>
        </div>
        <div class="modal-body">
            <div class="details">
            <!-- Nội dung details -->
            <div class="staff-table1">
        <div class="table-header">
            <h2>Danh sách sản phẩm</h2>
        </div>
        <table>
            <thead>
                <tr>
                    <td>STT</td>
                    <td>SKU</td>
                    <td>Số lượng</td>
                    <td>Đơn giá</td>
                    <td>Màu</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
        </div>
        </div>
        <div class="modal-footer">
            <button class="close close-btn">Đóng</button>
        </div>
    </div>
    
    
    <!-- Sửa thông tin -->
    <div class="modal-inner modal-edit hide">
    <div class="modal-header">
            <p>Chuyển trạng thái đơn hàng</p>
            <i class="fi fi-rr-cross-small" id="closeIconDelete"></i>
        </div>
        <div class="modal-body">
            <p class="content-delete"></p>
            <div class="modal-footer">
                <a href="" class="delete-a"><button class="confirm" id="confirmBtnEdit">Xác nhận</button></a>
                <button class="close" id="closeBtnDelete">Hủy</button>
            </div>
        </div>
    </div>
    <div class="modal-inner modal-add hide">
        <div class="modal-header">
            <p>Thêm nhân viên</p>
            <i class="fi fi-rr-cross-small" id="closeIconAdd"></i>
        </div>
        <form action="../Staff/CreateStaff" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="input-section">
                <label for="fullname_add_form" class="label-form">Họ và tên</label>
                <br>
                <input type="text" name="fullname_add_form" placeholder="Họ và tên..." class="fullname-add-form" autocomplete="off" id="fullname_add_form">
                <br>
                <span class="warning add-fullname-warning">Tên không chứa số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="role_add_form" class="label-form">Chức vụ</label>
                <br>
                <select name="role_id_add_form" class="role-id-add-form">
                    <option value="-1">Chức vụ</option>
                </select>
                <br>
                <span class="warning add-role-warning">Bạn phải chọn chức vụ</span>
            </div>
            <div class="input-section">
                <label for="phone_number_add_form" class="label-form">Số điện thoại</label>
                <br>
                <input type="text" name="phone_number_add_form" class="phone-number-add-form" placeholder="Số điện thoại..." autocomplete="off" id="phone_number_add_form">
                <br>
                <span class="warning add-phone-number-warning">Phải đủ 10 số và bắt đầu là 0</span>
            </div>
            <div class="input-section">
                <label for="email_add_form" class="label-form">Email</label>
                <br>
                <input type="email" name="email_add_form" class="email-add-form" placeholder="Email..." autocomplete="off" id="email_add_form">
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