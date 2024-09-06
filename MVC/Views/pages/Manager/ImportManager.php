<div class="filter-bar">
    <div class="add-staff">
        <button class="add-btn" title="Thêm nhân viên"><i class="fi fi-rr-plus"></i></button>
    </div>
    <div class="reset" title="refresh">
        <button class="reset-btn"><i class="fi fi-rr-refresh"></i></button>
    </div>
    <div>Ngày nhập: </div>
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
    <div class="staff-table">
        <div class="table-header">
            <h2>Danh sách nhân viên</h2>
            <!-- <button id="btn-export-excel">Xuất Excel</button> -->
        </div>
        <table id="staff-table">
            <thead>
                <tr>
                    <td>Mã đơn nhập</td>
                    <td>Mã nhân viên </td>
                    <td>Ngày nhập</td>
                    <td>Thao tác</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>

<div class="modal hide ">
    <!-- Xóa nhân viên -->    <div class="modal-inner modal-info hide">
        <div class="modal-header">
            <p>Thông tin</p>
            <button >(1/2)</button>
            <button class="next-page-btn">Trang kế tiếp</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo"></i>
        </div>
        <div class="modal-body">
            <div class="info-section">
                <div class="input-section">
                    <div class="combobox-filter">
                        <select name="" id="supplier-filter">
                            <option value="Chọn nhà cung cấp">Chọn nhà cung cấp</option>
                        </select>
                    </div>
                    <br>
                    <!-- <input type="text" name="fullname_add_form" placeholder="Nhà cung cấp..." class="fullname-add-form" readonly autocomplete="off" id="fullname_add_form">
                    <br> -->
                </div>
                <div class="input-section">
                    <div class="combobox-filter">
                        <select name="" id="category-filter">
                            <option value="Chọn loại hàng">Chọn loại hàng</option>
                        </select>
                    </div>
                    <br>
                    <!-- <input type="text" name="fullname_add_form" placeholder="Loại..." class="fullname-add-form" readonly autocomplete="off" id="fullname_add_form">
                    <br> -->
                </div>
                <div class="input-section">
                    <div class="combobox-filter">
                        <select name="" id="brand-filter">
                            <option value="Chọn hãng">Chọn hãng</option>
                            <option value="1">1</option>
                        </select>
                    </div>
                    <br>
                    <!-- <input type="text" name="fullname_add_form" placeholder="Hãng" class="fullname-add-form" readonly autocomplete="off" id="fullname_add_form">
                    <br> -->
                </div>
                <div class="input-section">
                    <div class="combobox-filter">
                        <select name="" id="product-filter">
                            <option value="Chọn sản phẩm">Chọn sản phẩm</option>
                        </select>
                    </div>
                    <br>
                </div>
                <div class="input-section">
                    <div class="combobox-filter">
                        <select name="" id="sku-filter">
                            <option value="Chọn màu">Chọn màu</option>
                        </select>
                    </div>
                    <br>
                </div>
                <div class="input-section">
                        <input type="text" name="skuname" id="skuname"placeholder="SKUCODE..." class="fullname-edit-form" style=""  readonly>
                        <br>
                </div>
                <div class="input-section">
                        <label for="price" class="label-form">Đơn giá</label>
                        <br>
                        <input type="number" name="price" placeholder="Đơn giá..." class="fullname-edit-form" autocomplete="off" id="price" min="1">
                        <br>
                </div>
                <div class="input-section">
                        <label for="price" class="label-form">Số lượng</label>
                        <br>
                        <input type="number" name="number" placeholder="Số lượng..." class="fullname-edit-form" autocomplete="off" id="number" min="1">
                        <br>
                </div>
                
            </div>
            
            <div class="avatar-section">
                
            </div>
        </div>
        <div class="modal-footer">
            <button class="add" id="add">Thêm</button>
            <button class="create" id="create">Tạo</button>
            <button class="close" id="closeBtnInfo">Đóng</button>
        </div>
    </div>
    <div class="modal-inner modal-import hide">
        <div class="modal-header">
            <p>Chi tiết phiếu nhập</p>
            <button >(2/2)</button>
            <button class="down-page-btn">Trang trước</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo2"></i>
        </div>
        <div class="modal-body">
            <div class="imports">
                <div class="staff-table2">
                    <div class="table-header">
                        <h2>Danh sách sản phẩm</h2>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <td>STT</td>
                            <td>Mã Sku</td>
                            <td>Mã NCC</td>
                            <td>Đơn giá</td>
                            <td>Số lượng nhập</td>
                        </tr>
                        </thead>
                        <tbody>
                
                        </tbody>
                    </table>
                </div>
        </div>
        </div>
        <div class="modal-footer">
            <button class="close close-btn">Đóng</button>
            <button class="reset1 reset1-btn">Reset</button>
        </div> 
    </div>
    <div class="modal-inner modal-details hide">
        <div class="modal-header">
            <p>Chi tiết phiếu nhập</p>
            <!-- //<button class="down-page-btn1">Trang trước (3/3)</button> -->
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
                    <td>Mã lô</td>
                    <td>Mã đơn</td>
                    <td>Mã Sku</td>
                    <td>Mã NCC</td>
                    <td>Đơn giá</td>
                    <td>SL</td>
                    <td>Còn lại</td>
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
    <!-- Xem thông tin-->
    <div class="modal-inner modal-info hide">
        <div class="modal-header">
            <p>Thông tin</p>
            <i class="fi fi-rr-cross-small" id="closeIconInfo"></i>
        </div>
        <div class="modal-body">
            <div class="info-section">
                <div class="row-section">
                    <label for="" class="row-name">Mã nhân viên</label>
                    <div class="row-data row-staff-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Họ và tên</label>
                    <div class="row-data row-fullname"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Chức vụ</label>
                    <div class="row-data row-role"></div>
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
                    <label for="" class="row-name">Ngày vào làm</label>
                    <div class="row-data row-entry-date"></div>
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
            <p>Sửa nhân viên</p>
            <i class="fi fi-rr-cross-small" id="closeIconEdit"></i>
        </div>
        <form action="../Staff/UpdateStaff" method="post" class="modal-body">
            <div class="input-section">
                <label for="fullname_edit_form" class="label-form">Họ và tên</label>
                <br>
                <input type="text" name="fullname_edit_form" placeholder="Họ và tên..." class="fullname-edit-form" autocomplete="off" id="fullname_edit_form">
                <br>
                <span class="warning edit-fullname-warning">Tên không chứa số và ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="role_edit_form" class="label-form">Chức vụ</label>
                <br>
                <select name="role_id_edit_form" class="role-id-edit-form" id="role_edit_form">
                    <option value="-1">Chức vụ</option>
                </select>
                <br>
                <span class="warning edit-role-warning">Bạn phải chọn chức vụ</span>
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
                <input type="text" name="staff_id" style="display: none" class="staff_id">
                <button class="confirm" id="confirmBtnEdit">Xác nhận sửa</button>
            </div>
        </form>
    </div>
</div>
<div class="modal-inner modal-delete hide">
        <div class="modal-header">
            <p>Tạo đơn hàng</p>
            <i class="fi fi-rr-cross-small" id="closeIconDelete"></i>
        </div>
        <div class="modal-body">
            <p class="content-delete">
                Xác nhận tạo đơn hàng
            </p>
            <div class="modal-footer">
                <a href="" class="delete-a"><button class="confirm" id="confirmBtnDelete">Xác nhận</button></a>
                <button class="close" id="closeBtnDelete">Hủy</button>
            </div>
        </div>
    </div>