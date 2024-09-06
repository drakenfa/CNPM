var valueArr = {
    0: "Tổng số khách hàng",
    1: "Khách hàng Nam",
    2: "Khách hàng Nữ",
    3: "Độ tuổi trung bình",
};
var thTables = {
    0: "Mã nhân viên",
    1: "Họ tên",
    2: "Chức vụ",
    3: "Số điện thoại",
    4: "Email",
    5: "Giới tính",
    6: "Địa chỉ",
    7: "Ngày vào làm",
    8: "Thao tác",
};
var columnNames = {
    0: "staff_id",
    1: "staff_fullname",
    2: "staff_email",
    3: "phone_number",
    4: "staff_email",
    5: "gender",
    6: "address",
    7: "entry_date",
};
const accountIdPost = document.querySelector(".modal-edit .modal-footer .account_id");
const customerIdPost = document.querySelector(".modal-edit .modal-footer .customer_id");

const cardBox = document.querySelector(".card-box");
const content = document.querySelector(".content-module");

const startDateFilter = document.querySelector("#start-date");
const endDateFilter = document.querySelector("#end-date");
const monthFilter = document.querySelector("#month-filter");
const yearFilter = document.querySelector("#year-filter");
const searchFilter = document.querySelector("#search-filter");

const numbers = Array.from(document.querySelectorAll(".card .numbers"));
const cardNames = Array.from(document.querySelectorAll(".card .card-name"));
const tbody = document.querySelector(".details table tbody");
const userImage = document.querySelector(".topbar .user img");

fetch("../InternalManager/GetAllDataSalary")
    .then((response) => response.json())
    .then((values) => {
        values.allMonth.forEach((value) => {
            var monthOption = document.createElement("option");
            monthOption.value = value.month;
            monthOption.text = value.month;
            monthFilter.appendChild(monthOption);
        });
        values.allYear.forEach((value) => {
            var yearOption = document.createElement("option");
            yearOption.value = value.year;
            yearOption.text = value.year;
            yearFilter.appendChild(yearOption);
        });
        

        // Table
        values.salaryData.forEach((value) => {
            var row = tbody.insertRow();

            var staffIdCell = row.insertCell();
            staffIdCell.textContent = value.staff_id; // gán giá trị vào từng ô tương ứng cho bảng

            var staffFullnameCell = row.insertCell();
            staffFullnameCell.textContent = value.staff_fullname;

            var contractIdCell = row.insertCell();
            contractIdCell.textContent = value.contract_id;

            var monthCell = row.insertCell();
            monthCell.textContent = value.month;

            var yearCell = row.insertCell();
            yearCell.textContent = value.year;

            var salaryCell = row.insertCell();
            salaryCell.textContent = value.salary;

            var totalSalaryCell = row.insertCell();
            totalSalaryCell.textContent = value.total_salary;

            tbody.appendChild(row);
        });
        
    })
    .catch((error) => console.log("Error: ", error));


const refreshBtn = document.querySelector(".reset-btn");
refreshBtn.addEventListener("click", function () {
    monthFilter.selectedIndex = 0;
    yearFilter.selectedIndex = 0;
    searchFilter.value = "";
});


function filterTable() {
    var trs = tbody.getElementsByTagName("tr");
    // Lấy giá trị lọc
    var monthFilterValue = monthFilter.value;
    var yearFilterValue = yearFilter.value;
    var searchFilterValue = searchFilter.value.toLowerCase();

    for (var i = 0; i < trs.length; i++) {
        var staffIdTd = trs[i].getElementsByTagName("td")[0];
        var staffNameTd = trs[i].getElementsByTagName("td")[1];
        var contractIdTd = trs[i].getElementsByTagName("td")[2];
        var monthTd = trs[i].getElementsByTagName("td")[3];
        var yearTd = trs[i].getElementsByTagName("td")[4];
        var salaryTd = trs[i].getElementsByTagName("td")[5];
        var totalSalaryTd = trs[i].getElementsByTagName("td")[6];

        if (
            staffIdTd &&
            staffNameTd &&
            contractIdTd &&
            monthTd &&
            yearTd &&
            salaryTd &&
            totalSalaryTd
        ) {
            // nếu tồn tại thì thay đổi tránh crash
            var monthValue = monthTd.textContent || monthTd.innerText;
            var monthMatch =
                monthFilterValue == "0" || //nếu mặc định thì sẽ hiển thị
                monthValue.indexOf(monthFilterValue) > -1; // nếu không chứa giá trị lọc thì ẩn

            var yearValue = yearTd.textContent || yearTd.innerText;
            var yearMatch =
                yearFilterValue == "0" || //nếu mặc định thì sẽ hiển thị
                yearValue.indexOf(yearFilterValue) > -1; // nếu không chứa giá trị lọc thì ẩn
            
            var staffIdMatch =
                staffIdTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1; // so sánh giá trị trong bảng với giá trị lọc
            var staffNameMatch =
                staffNameTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;

            var contractIdMatch =
                contractIdTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            trs[i].style.display =
                monthMatch &&
                (staffIdMatch ||
                    staffNameMatch ||
                    contractIdMatch) &&
                yearMatch
                    ? ""
                    : "none";
        }
    }
}

// roleFilter.onchange = filterTable;
monthFilter.onchange = filterTable;
yearFilter.onchange = filterTable;
searchFilter.oninput = filterTable;
refreshBtn.onclick = filterTable;

// var contentCustomer = document.querySelector('.details');
// setTimeout(function(){
//     // var opt = {
//     // margin: [10, 10, 10, 10],
//     // filename: 'Danh_sách_khách_hàng.pdf',
//     // image: { type: 'jpeg', quality: 0.98 },
//     // html2canvas: { scale: 0.5 }, // Giảm độ phân giải của hình ảnh
//     // jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
//     // };
//     html2pdf(contentCustomer);
// },5000);
function deleteColumn(table, columnIndex) {
    [...table.rows].forEach((row) => {
      row.deleteCell(columnIndex);
    });
}
const customerTable = document.querySelector("#customer-table");
const exportCustomerTable = document.querySelector("#btn-export-excel");
exportCustomerTable.addEventListener('click', () => {
    // Tạo một bản sao của bảng
    var clone = customerTable.cloneNode(true);
    // Xóa cột bạn không muốn xuất
    setTimeout(function(){
        const wb = XLSX.utils.table_to_book(clone, {sheet: 'sheet-1'});
        XLSX.writeFile(wb, 'SalaryTable.xlsx');
    }, 2000);
});
  