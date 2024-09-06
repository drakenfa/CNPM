<!-- <div class="card-box">
    <div class="card">
        <div>
            <div class="numbers"></div>
            <div class="card-name"></div>
        </div>
        <div class="icon-box">
            <i class="fi fi-rr-seller"></i>
        </div>
    </div> -->

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
    <div>Ngày xuất: </div>
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
            <h2>Danh sách phiếu xuất</h2>
        </div>
        <table>
            <thead>
                <tr>
                    <td>Mã phiếu xuất</td>
                    <td>Mã nhân viên</td>
                    <td>Mã hóa đơn</td>
                    <td>Ngày xuất</td>
                    <td>Thành tiền</td>
                    <td>Thao tác</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>

<div class="modal hide">
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
    <div class="modal-inner modal-details hide">
        <div class="modal-header">
            <p>Chi tiết phiếu xuất</p>
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
                    <td>EXD-Id</td>
                    <td>EX-Id</td>
                    <td>Shipment Id</td>
                    <td>Đơn giá</td>
                    <td>Số lượng</td>
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
    
</div>