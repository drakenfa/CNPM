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

fetch("../InternalManager/GetAllDataPersonalInfoStaff/"+sessionStorage.getItem("account_id")+"/"+sessionStorage.getItem("staff_id"))
    .then((response) => response.json())
    .then((values) => {
        // Table
        var i = 1;
        values.selfSalary.forEach((value) => {
            
            var row = tbody.insertRow();

            var sttCell = row.insertCell();
            sttCell.textContent = i; // gán giá trị vào từng ô tương ứng cho bảng
            i++;

            var contractIdCell = row.insertCell();
            contractIdCell.textContent = value.contract_id; // gán giá trị vào từng ô tương ứng cho bảng

            var monthCell = row.insertCell();
            monthCell.textContent = value.month;

            var yearCell = row.insertCell();
            yearCell.textContent = value.year;

            var totalSalaryCell = row.insertCell();
            totalSalaryCell.textContent = value.total_salary;

            tbody.appendChild(row);
        });
        
    })
    .catch((error) => console.log("Error: ", error));




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
  