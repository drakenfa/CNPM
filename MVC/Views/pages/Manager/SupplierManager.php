<div class="filter-bar">
    <div class="search">
        <label for="">
            <input type="text" placeholder="Tìm kiếm..." id="search-filter">
            <i class="fi fi-rr-search"></i>
        </label>
    </div>
    <div class="add-customer">
        <button class="add-btn" title="Thêm khách hàng"><i class="fi fi-rr-plus"></i></button>
    </div>
</div>


<div class="details">
    <div class="supplier-table">
        <div class="table-header">
            <h2>Danh sách nhà cung cấp</h2>
            <button id="btn-export-excel">Xuất Excel</button>
        </div>
        <table id="supplier-table">
            <thead>
                <tr>
                    <td>Mã nhà cung cấp</td>
                    <td>Tên nhà cung cấp</td>
                    <td>Địa chỉ</td>
                    <td>Số điện thoại</td>
                    <td>Email</td>
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
            <p>Xóa nhân viên</p>
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
                    <label for="" class="row-name">Mã nhà cung cấp</label>
                    <div class="row-data row-supplier-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Tên nhà cung cấp</label>
                    <div class="row-data row-supplier-name"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Địa chỉ</label>
                    <div class="row-data row-address"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Số điện thoại</label>
                    <div class="row-data row-phone-number"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Email</label>
                    <div class="row-data row-email"></div>
                </div>
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
        <form action="../Supplier/UpdateSupplier" method="post" class="modal-body">
            <div class="input-section">
                <label for="supplier_name_edit_form" class="label-form">Họ và tên</label>
                <br>
                <input type="text" name="supplier_name_edit_form" placeholder="Họ và tên..." class="supplier-name-edit-form" autocomplete="off" id="supplier_name_edit_form" required>
                <br>
                <span class="warning edit-supplier-name-warning">Tên không chứa ký tự đặc biệt</span>
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
                <label for="address_edit_form" class="label-form">Địa chỉ</label>
                <br>
                <input type="text" name="address_edit_form" placeholder="Địa chỉ..." required class="address-edit-form" autocomplete="off" id="address_edit_form">
            </div>
            <div class="modal-footer">
                <div class="reset-btn" title="refresh">
                    <i class="fi fi-rr-refresh"></i>
                </div>
                <input type="text" name="supplier_id" style="display: none" class="supplier_id">
                <button class="confirm" id="confirmBtnEdit">Xác nhận sửa</button>
            </div>
        </form>
    </div>
    <div class="modal-inner modal-add hide">
        <div class="modal-header">
            <p>Thêm nhà cung cấp</p>
            <i class="fi fi-rr-cross-small" id="closeIconAdd"></i>
        </div>
        <form action="../Supplier/CreateSupplier" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="input-section">
                <label for="supplier_name_add_form" class="label-form">Tên nhà cung cấp</label>
                <br>
                <input type="text" name="supplier_name_add_form" placeholder="Tên nhà cung cấp..." class="supplier_name_add_form" autocomplete="off" id="supplier_name_add_form" required>
                <br>
                <span class="warning add-supplier-name-warning">Tên không chứa ký tự đặc biệt</span>
            </div>
            <div class="input-section">
                <label for="address_add_form" class="label-form">Địa chỉ</label>
                <br>
                <input type="text" name="address_add_form" class="address-add-form" required placeholder="Địa chỉ...">
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
            <div class="modal-footer">
                <div class="reset-btn" title="refresh">
                    <i class="fi fi-rr-refresh"></i>
                </div>
                <button class="confirm" id="confirmBtnAdd">Xác nhận thêm</button>
            </div>
        </form>
    </div>
</div>