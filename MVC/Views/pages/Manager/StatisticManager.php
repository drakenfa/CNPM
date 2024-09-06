<div class="top-bar-buttons">
    <button class="export-statistic active">Hàng đã xuất</button>
    <button class="import-statistic">Hàng đã nhập</button>
    <button class="profit-statistic">Lợi nhuận</button>
    <button class="salary-statistic">Lương</button>
    <button class="business-situation">Tình hình kinh doanh</button>
</div>

<div class="chart-container export-chart" style="position: relative; height: 50vh; width: 100vw">
    <div class="filter-chart filter-chart-export">
        <label for="">Tháng</label>
        <input type="radio" name="option-export" id="month-export" checked style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Quý</label>
        <input type="radio" name="option-export" id="quarter-export" style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Năm:</label>
        <select name="" id="year-export">
            
        </select>
    </div>
    <canvas id="export"></canvas>
    <button id="download-export-chart">Xuất PDF</button>
</div>
<div class="chart-container import-chart hide" style="position: relative; height: 50vh; width: 100vw">
    <div class="filter-chart filter-chart-import">
        <label for="">Tháng</label>
        <input type="radio" name="option-import" id="month-import" checked style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Quý</label>
        <input type="radio" name="option-import" id="quarter-import" style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Năm:</label>
        <select name="" id="year-import">
            
        </select>
    </div>
    <canvas id="import"></canvas>
    <button id="download-import-chart">Xuất PDF</button>
</div>
<div class="chart-container profit-chart hide" style="position: relative; height: 50vh; width: 100vw">
    <div class="filter-chart filter-chart-profit">
        <label for="">Tháng</label>
        <input type="radio" name="option-profit" id="month-profit" style="margin-left: 5px" checked>
        <div class="ml-mr-20"></div>
        <label for="">Quý</label>
        <input type="radio" name="option-profit" id="quarter-profit" style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Năm:</label>
        <select name="" id="year-profit">
            
        </select>
    </div>
    <canvas id="profit"></canvas>
    <button id="download-profit-chart">Xuất PDF</button>
</div>
<div class="chart-container salary-chart hide" style="position: relative; height: 50vh; width: 100vw">
    <div class="filter-chart filter-chart-salary">
        <label for="">Tháng</label>
        <input type="radio" name="option" id="month-salary" checked style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Quý</label>
        <input type="radio" name="option" id="quarter-salary" style="margin-left: 5px">
        <div class="ml-mr-20"></div>
        <label for="">Năm:</label>
        <select name="" id="year-salary">
            
        </select>
    </div>
    <canvas id="salary"></canvas>
    <button id="download-salary-chart">Xuất PDF</button>
</div>
<div class="chart-container business-situation hide" style="position: relative; height: 50vh; width: 100vw; top: 200px;">
    <div class="filter-chart date-picker">
        <div class="start-date-picker">
            <label for="start-date">Từ:</label>
            <input type="date" name="" id="start-date" name="start-date" placeholder="Ngày bắt đầu">
        </div>
        <div class="end-date-picker">
            <label for="end-date">Đến:</label>
            <input type="date" name="" id="end-date" name="end-date" placeholder="Ngày kết thúc">
        </div>
        <div class="combobox">
            <select name="" id="option-product">
                <option value="all-product">Tất cả sản phẩm</option>
                <option value="category">Loại sản phẩm</option>
            </select>
            <select name="" id="category" class="hide">
                 
            </select>
        </div>
    </div>
    <div id="business-situation" style="position: relative; height: 50vh; width: 60vw; top: 30px;">
        <p class="title-statistic">Thống kê tình hình kinh doanh của cửa hàng trong khoảng thời gian</p>
        <div class="value-container">
            <div class="number-of-product">
                <p class="title-statistic">Số lượng sản phẩm</p>
                <div class="number-of-product-value">
                    _ _ _
                </div>
            </div>
            <div class="revenue-of-products">
                <p class="title-statistic">Doanh thu</p>
                <div class="revenue-value">
                    _ _ _
                </div>
            </div>
            <div class="profit-of-products">
                <p class="title-statistic">Lợi nhuận</p>
                <div class="profit-value">
                    _ _ _
                </div>
            </div>
        </div>
    </div>
    <div class="details">
    <div class="customer-table">
        <div class="table-header">
            <h2>Bảng số liệu</h2>
        </div>
        <table id="customer-table">
            <thead>
                <tr>
                    <td>STT</td>
                    <td>Tên sản phẩm</td>
                    <td>Loại sản phẩm</td>
                    <td>Giá nhập</td>
                    <td>Giá bán</td>
                    <td>Số lượng</td>
                    <td>Ngày xuất bán</td>
                    <td>Lợi nhuận</td>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
