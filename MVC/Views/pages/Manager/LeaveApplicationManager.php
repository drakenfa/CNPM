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
        <select name="" id="reason-filter">
            <option value="0">Lý do</option>
            <option value="Lý do cá nhân">Lý do cá nhân</option>
            <option value="Ốm đau, thai sản">Ốm đau, thai sản</option>
        </select>
        <select name="" id="status-filter">
            <option value="0">Trạng thái</option>
            <option value="Chờ duyệt">Chờ duyệt</option>
            <option value="Đã duyệt">Đã duyệt</option>
        </select>
    </div>
    <div class="leave-application">
        <a href="../InternalManager/StaffManager"><button class="leave-btn" title="Nhân viên">Nhân viên</button></a>
    </div>
</div>
<div class="details">
    <div class="supplier-table">
        <div class="table-header">
            <h2>Danh sách đơn xin nghỉ</h2>
        </div>
        <table>
            <thead>
                <tr>
                    <td>Mã đơn xin</td>
                    <td>Tên nhân viên</td>
                    <td>Ngày bắt đầu</td>
                    <td>Ngày kết thúc</td>
                    <td>Lý do</td>
                    <td>Trạng thái</td>
                    <td>Duyệt đơn</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>


<div class="modal hide">
    <!-- Xóa nhân viên -->
    <div class="modal-inner modal-approve hide">
        <div class="modal-header">
            <p>Xóa khách hàng</p>
            <i class="fi fi-rr-cross-small" id="closeIconApprove"></i>
        </div>
        <div class="modal-body">
            <p class="content-approve"></p>
            <div class="modal-footer">
                <a href="" class="approve-a"><button class="confirm" id="confirmBtnApprove">Xác nhận</button></a>
                <button class="close" id="closeBtnApprove">Hủy</button>
            </div>
        </div>
    </div>
</div>