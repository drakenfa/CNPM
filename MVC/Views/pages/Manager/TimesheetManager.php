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
        <a href="../InternalManager/SalaryManager"><button class="attendence-btn" title="Lương">Lương</button></a>
    </div>
    <div class="attendence">
        <a href="../InternalManager/ContractManager"><button class="attendence-btn" title="Hợp đồng">Hợp đồng</button></a>
    </div>
</div>

<div class="details">
    <div class="customer-table">
        <div class="table-header">
            <h2>Danh sách chấm công</h2>
            <button id="btn-export-excel">Xuất Excel</button>
        </div>
        <table id="customer-table">
            <thead>
                <tr>
                    <td>Mã chấm công</td>
                    <td>Mã nhân viên</td>
                    <td>Họ tên</td>
                    <td>Tháng</td>
                    <td>Năm</td>
                    <td>Ngày làm việc</td>
                    <td>Ngày vắng</td>
                    <td>Nghỉ có phép</td>
                    <td>Ngày trễ</td>
                    <td>Lương thực nhận</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>

