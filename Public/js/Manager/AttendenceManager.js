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

fetch("../InternalManager/GetAllDataAttendance")
    .then((response) => response.json())
    .then((values) => {
        // Table
        values.attendances.forEach((value) => {
            var row = tbody.insertRow();

            var attendanceIdCell = row.insertCell();
            attendanceIdCell.textContent = value.attendance_id; // gán giá trị vào từng ô tương ứng cho bảng

            var staffFullnameCell = row.insertCell();
            staffFullnameCell.textContent = value.staff_fullname;

            var attendanceDateCell = row.insertCell();
            var date = new Date(value.date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            attendanceDateCell.textContent = formattedDate; // format lại ngày

            var statusCell = row.insertCell();
            var select = document.createElement("select");
            var option1 = document.createElement("option");
            option1.textContent = "Chưa điểm danh";
            option1.value = "Chưa điểm danh";
            var option2 = document.createElement("option");
            option2.textContent = "Có mặt";
            option2.value = "Có mặt";
            var option3 = document.createElement("option");
            option3.textContent = "Vắng mặt";
            option3.value = "Vắng mặt";
            var option4 = document.createElement("option");
            option4.textContent = "Trễ";
            option4.value = "Trễ";
            var option5 = document.createElement("option");
            option5.textContent = "Nghỉ phép";
            option5.value = "Nghỉ phép";
            option5.disabled = true;
            select.add(option1);
            select.add(option2);
            select.add(option3);
            select.add(option4);
            select.add(option5);
            if(value.status == "Chưa điểm danh"){
                option1.selected = true;
            }else if(value.status == "Có mặt"){
                option2.selected = true;
            }else if(value.status == "Vắng mặt"){
                option3.selected = true;
            }else if(value.status == "Trễ"){
                option4.selected = true;
            }else{
                option5.selected = true;
            }
            if(value.status != "Chưa điểm danh"){
                select.disabled = true;
            }
            select.addEventListener("change", function(){
                if (this.value !== "Chưa điểm danh") {
                    this.disabled = true;
                }
                var statusValue = this.value;
                var xhr = new XMLHttpRequest();
                xhr.open("POST", '../InternalManager/UpdateStatus', true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    console.log(value.attendance_id, statusValue);
                }
                xhr.send("attendance_id="+value.attendance_id+"&status="+statusValue);
            });
            statusCell.appendChild(select);

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
  