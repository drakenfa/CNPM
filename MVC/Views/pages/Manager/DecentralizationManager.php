<div class="filter-bar">
    <div class="update">
        <a href="../InternalManager/DecentralizationManager"><button class="update-btn" title="Cập nhật">Cập nhật dữ liệu</button></a>
    </div>
    <div class="add-customer">
        <button class="add-btn" title="Thêm chức vụ"><i class="fi fi-rr-plus"></i></button>
    </div>
</div>

<div class="details">
    <div class="decentralization-table">
        <div class="table-header">
            <h2>Bảng phân quyền</h2>
        </div>
        <table>
            <thead>
                <tr>
                    <td>Chức vụ / Module</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>

<div class="modal hide">
    <div class="modal-inner modal-add hide">
        <div class="modal-header">
            <p>Thêm chức vụ</p>
            <i class="fi fi-rr-cross-small" id="closeIconAdd"></i>
        </div>
        <form action="../Role/CreateRole" method="post" class="modal-body" enctype="multipart/form-data">
            <div class="input-section">
                <label for="role_name_add_form" class="label-form">Tên chức vụ</label>
                <br>
                <input type="text" name="role_name_add_form" class="role-name-add-form" placeholder="Tên chức vụ..." autocomplete="off" id="role_name_add_form" required>
                <br>
                <span class="warning add-role-name-warning">Tên chức vụ bị trùng</span>
            </div>
            <div class="modal-footer">
                <button class="confirm" id="confirmBtnAdd">Xác nhận thêm</button>
            </div>
        </form>
    </div>
    <div class="modal-inner modal-delete hide">
        <div class="modal-header">
            <p>Xóa chức vụ</p>
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
</div>