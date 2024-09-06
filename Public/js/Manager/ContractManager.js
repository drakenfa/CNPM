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

fetch("../InternalManager/GetAllDataContract")
    .then((response) => response.json())
    .then((values) => {
        // Table
        values.contractData.forEach((value) => {
            var row = tbody.insertRow();

            var contractIdCell = row.insertCell();
            contractIdCell.textContent = value.contract_id; // gán giá trị vào từng ô tương ứng cho bảng

            var staffIdCell = row.insertCell();
            staffIdCell.textContent = value.staff_id;

            var staffFullnameCell = row.insertCell();
            staffFullnameCell.textContent = value.staff_fullname;

            var startDateCell = row.insertCell();
            var date = new Date(value.start_date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            startDateCell.textContent = formattedDate; // format lại ngày

            var endDateCell = row.insertCell();
            var date = new Date(value.end_date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            endDateCell.textContent = formattedDate; // format lại ngày

            var salaryCell = row.insertCell();
            salaryCell.textContent = value.salary;

            tbody.appendChild(row);
        });
        
    })
    .catch((error) => console.log("Error: ", error));


function filterTable() {
    var trs = tbody.getElementsByTagName("tr");
    var searchFilterValue = searchFilter.value.toLowerCase();

    for (var i = 0; i < trs.length; i++) {
        var staffNameTd = trs[i].getElementsByTagName("td")[1];

        if (
            staffNameTd
        ) {
            var staffNameMatch =
                staffNameTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;

            trs[i].style.display =
                    staffNameMatch
                    ? ""
                    : "none";
        }
    }
}

searchFilter.oninput = filterTable;
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

// const modal = document.querySelector(".modal");
// const closeIconAdd = document.querySelector("#closeIconAdd");
// const modalInnerAdd = document.querySelector(".modal-inner.modal-add");
// const contentModalAdd = document.querySelector(".content-add");
// const btnAdd = document.querySelector(".add-btn");
// btnAdd.addEventListener("click", showModalAdd);
// function hideModalAdd() {
//     modal.classList.add("hide");
//     modalInnerAdd.classList.add("hide");
//     refreshAddForm();
// }
// function showModalAdd() {
//     modal.classList.remove("hide");
//     modalInnerAdd.classList.remove("hide");
// }
// function hideModal() {
//     modal.classList.add("hide");
//     modalInnerAdd.classList.add("hide");
// }
// closeIconAdd.addEventListener("click", hideModalAdd);
// modal.addEventListener("click", hideModal);
// modalInnerAdd.addEventListener("click", function (event) {
//     event.stopPropagation();
// });
// const formAdd = document.querySelector(".modal-add .modal-body");
// const refreshAddBtn = document.querySelector(".modal-add .reset-btn");