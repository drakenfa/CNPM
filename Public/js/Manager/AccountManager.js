var valueArr = {
    0: "Tổng số tài khoản",
    1: "Tài khoản nội bộ",
    2: "Tài khoản khách hàng",
    3: "Tài khoản bị khóa",
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

const cardBox = document.querySelector(".card-box");
const content = document.querySelector(".content-module");

const startDateFilter = document.querySelector("#start-date");
const endDateFilter = document.querySelector("#end-date");
const roleFilter = document.querySelector("#role-filter");
const searchFilter = document.querySelector("#search-filter");

const numbers = Array.from(document.querySelectorAll(".card .numbers"));
const cardNames = Array.from(document.querySelectorAll(".card .card-name"));
const tbody = document.querySelector(".details table tbody");
const userImage = document.querySelector(".topbar .user img");

var rowAccountId = document.querySelector(".row-data.row-account-id");
var rowFullname = document.querySelector(".row-data.row-fullname");
var rowPhoneNumber = document.querySelector(".row-data.row-phone-number");
var rowCustomerStaffId = document.querySelector(".row-data.row-customer-staff-id");
var rowEmail = document.querySelector(".row-data.row-email");
var rowRole = document.querySelector(".row-data.row-role");
var rowCreatedAt = document.querySelector(".row-data.row-created-at");
var rowUpdatedAt = document.querySelector(".row-data.row-updated-at");
fetch("../InternalManager/GetAllDataAccount")
    .then((response) => response.json())
    .then((values) => {
        var cardValues = Object.values(values.cardValue);
        numbers.forEach((number, i) => {
            number.textContent = cardValues[i]; // gán giá trị vào các thẻ
        });
        cardNames.forEach((name, i) => {
            name.textContent = valueArr[i]; // gán tên cho các thẻ
        });

        // Filter
        values.allRole.forEach((role) => {
            var option = document.createElement("option");
            option.value = role.role_name;
            option.text = role.role_name;
            roleFilter.appendChild(option); // gán giá trị các role vào combobox
        });

        // Table
        values.infoAccount.forEach((account) => {
            var row = tbody.insertRow();
            
            var accountIdCell = row.insertCell();
            accountIdCell.textContent = account.account_id; // gán giá trị vào từng ô tương ứng cho bảng
            
            var accountPhoneNumberCell = row.insertCell();
            accountPhoneNumberCell.textContent = account.phone_number;
            
            var accountEmailCell = row.insertCell();
            accountEmailCell.textContent = account.email;
            
            var fullnameCell = row.insertCell();
            fullnameCell.textContent = account.name;

            var roleCell = row.insertCell();
            roleCell.textContent = account.role_name;

            var createdAtCell = row.insertCell();
            createdAtCell.textContent = convertToDDMMYY_HHMMSS(account.created_at);

            var operation = row.insertCell();
            if(account.is_active == 0){
                row.style.opacity = "0.9";
                row.style.backgroundColor = "#ccc";
                row.style.color = "#000";
                var btns = `<div class="btns">
                <button class="info" id="info-${account.account_id}" title="Xem thông tin"><i class="fi fi-rr-info"></i></button>
                <button class="delete" style="background-color: var(--primary-color-green)" id="delete-${account.account_id}" title="Mở khóa tài khoản"><i class="fi fi-rr-lock-open-alt"></i></button></div>`;

            }else{
                var btns = `<div class="btns">
                <button class="info" id="info-${account.account_id}" title="Xem thông tin"><i class="fi fi-rr-info"></i></button>
                <button class="delete" style="background-color: var(--primary-color-red)" id="delete-${account.account_id}" title="Khóa tài khoản"><i class="fi fi-rr-lock"></i></button></div>`;
            }
            operation.insertAdjacentHTML("beforeend", btns);

            tbody.appendChild(row);
        });

        // // Gắn sự kiện click cho container cha (ví dụ: tbody)
        tbody.addEventListener("click", function (event) {
            var clickedElement = event.target;
            var deleteBtn = clickedElement.closest(".delete");
            var infoBtn = clickedElement.closest(".info");
            if (deleteBtn) {
                var accountId = deleteBtn.id.split("-")[1];
                var isActive;
                values.infoAccount.forEach((account) => {
                    if (account.account_id == accountId) {
                        isActive = account.is_active;
                        accountId = account.account_id;
                    }
                });
                if(isActive == "0"){
                    contentModalDelete.textContent =
                    "Bạn có chắc là mở khóa tài khoản có id " + accountId ;
                }else{
                    contentModalDelete.textContent =
                    "Bạn có chắc là khóa tài khoản có id " + accountId ;
                }
                deleteA.setAttribute(
                    "href",
                    "../Account/LockAndUnlockAccount/" + accountId
                );
                showModalDelete();
            }
            if (infoBtn) {
                var accountId = infoBtn.id.split("-")[1];
                values.infoAccount.forEach((account) => {
                    if (account.account_id == accountId) {
                        rowAccountId.textContent = account.account_id;
                        rowFullname.textContent = account.name;
                        rowPhoneNumber.textContent = account.phone_number;
                        rowEmail.textContent = account.email;
                        rowRole.textContent = account.role_name;
                        rowCustomerStaffId.textContent = account.id;    
                        rowCreatedAt.textContent = account.created_at;
                        rowUpdatedAt.textContent = account.updated_at;
                    }
                });
                showModalInfo();
            }
            
        });
    })
    .catch((error) => console.log("Error: ", error));

const modal = document.querySelector(".modal");
const closeIconDelete = document.querySelector("#closeIconDelete");
const closeBtnDelete = document.querySelector("#closeBtnDelete");
const closeIconInfo = document.querySelector("#closeIconInfo");
const closeBtnInfo = document.querySelector("#closeBtnInfo");
const closeIconEdit = document.querySelector("#closeIconEdit");
// const closeBtnEdit = document.querySelector("#closeBtnEdit");
const closeIconAdd = document.querySelector("#closeIconAdd");
// const closeBtnAdd = document.querySelector("#closeBtnAdd");

const modalInnerDelete = document.querySelector(".modal-inner.modal-delete");
const modalInnerInfo = document.querySelector(".modal-inner.modal-info");
const modalInnerEdit = document.querySelector(".modal-inner.modal-edit");

const contentModalDelete = document.querySelector(".content-delete");
const contentModalInfo = document.querySelector(".content-info");
const contentModalEdit = document.querySelector(".content-edit");
const deleteA = document.querySelector(".modal-footer a");


function hideModalDelete() {
    modal.classList.add("hide");
    modalInnerDelete.classList.add("hide");
}
function showModalDelete() {
    modal.classList.remove("hide");
    modalInnerDelete.classList.remove("hide");
}
function hideModalInfo() {
    modal.classList.add("hide");
    modalInnerInfo.classList.add("hide");
}
function showModalInfo() {
    modal.classList.remove("hide");
    modalInnerInfo.classList.remove("hide");
}
function hideModal() {
    modal.classList.add("hide");
    modalInnerDelete.classList.add("hide");
    modalInnerInfo.classList.add("hide");
    modalInnerEdit.classList.add("hide");
    refreshAddForm();
}

closeIconDelete.addEventListener("click", hideModalDelete);
closeBtnDelete.addEventListener("click", hideModalDelete);
closeIconInfo.addEventListener("click", hideModalInfo);
closeBtnInfo.addEventListener("click", hideModalInfo);

modal.addEventListener("click", hideModal);
modalInnerDelete.addEventListener("click", function (event) {
    event.stopPropagation();
});
modalInnerInfo.addEventListener("click", function (event) {
    event.stopPropagation();
});

const refreshBtn = document.querySelector(".reset-btn");
refreshBtn.addEventListener("click", function () {
    startDateFilter.value = "";
    endDateFilter.value = "";
    roleFilter.selectedIndex = 0;
    searchFilter.value = "";
    document.getElementById("start-date").max = null;
    document.getElementById("end-date").min = null;
});

const confirmAddBtn = document.getElementById("confirmBtnAdd");
const confirmEditBtn = document.getElementById("confirmBtnEdit");
const refreshEditBtn = document.querySelector(".modal-edit .reset-btn");
/* refresh add-form */
/* refresh edit-form */

function filterTable() {
    var trs = tbody.getElementsByTagName("tr");
    // Lấy giá trị lọc
    var roleFilterValue = roleFilter.value;
    var searchFilterValue = searchFilter.value.toLowerCase();
    var startDateString = document.getElementById("start-date").value;
    var endDateString = document.getElementById("end-date").value;

    for (var i = 0; i < trs.length; i++) {
        var roleTd = trs[i].getElementsByTagName("td")[4];

        var accountIdTd = trs[i].getElementsByTagName("td")[0];
        var accountPhoneTd = trs[i].getElementsByTagName("td")[1];
        var accountEmailTd = trs[i].getElementsByTagName("td")[2];
        var accountNameTd = trs[i].getElementsByTagName("td")[3];
        var accountCreatedAtTd = trs[i].getElementsByTagName("td")[5];
        if (
            roleTd &&
            accountIdTd &&
            accountNameTd &&
            accountPhoneTd &&
            accountEmailTd &&
            accountCreatedAtTd
        ) {
            // nếu tồn tại thì thay đổi tránh crash
            var roleValue = roleTd.textContent || roleTd.innerText;

            var roleMatch =
                roleFilterValue == "Vai trò" || //nếu mặc định thì sẽ hiển thị
                roleValue.indexOf(roleFilterValue) > -1; // nếu không chứa giá trị lọc thì ẩn
            var accountIdMatch =
                accountIdTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1; // so sánh giá trị trong bảng với giá trị lọc
            var accountNameMatch =
                accountNameTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var accountPhoneMatch =
                accountPhoneTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var accountEmailMatch =
                accountEmailTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            if (endDateString != "") {
                // nếu endDate được chọn thì max của startDate là endDate
                document.getElementById("start-date").max = endDateString;
            }
            if (startDateString != "") {
                // nếu startDate được chọn thì min của endDate là startDate
                document.getElementById("end-date").min = startDateString;
            }
            var bothDatePickersSelected = startDateString && endDateString; // cả 2 datePicker được chọn thì mới bắt đầu kiểm tra điều kiện lọc
            if (bothDatePickersSelected) {
                var createdAtMatch =
                    compareStartDate(
                        accountCreatedAtTd.textContent,
                        convertToDDMMYY_HHMMSS(startDateString)
                    ) &&
                    compareEndDate(
                        accountCreatedAtTd.textContent,
                        convertToDDMMYY_HHMMSS(endDateString)
                    );
            } else {
                createdAtMatch = true;
            }
            trs[i].style.display =
                roleMatch &&
                (accountIdMatch ||
                    accountNameMatch ||
                    accountPhoneMatch ||
                    accountEmailMatch) &&
                    createdAtMatch
                    ? ""
                    : "none";
        }
    }
}
function convertToDate(dateString) {
    const [day, month, year] = dateString.split("/");
    return new Date(year, month - 1, day);
}

function convertToDateTime(dateTimeString) {
    const [date, time] = dateTimeString.split(" ");
    const [day, month, year] = date.split("/");
    const [hour, minute, second] = time.split(":");
    return new Date(year, month - 1, day, hour, minute, second);
}

function compareStartDate(dateString1, dateString2) {
    // so sánh với startDate
    const date1 = convertToDateTime(dateString1);
    const date2 = convertToDateTime(dateString2);
    if (date1 >= date2 && dateString2 != "") {
        return true;
    } else {
        return false;
    }
}
function compareEndDate(dateString1, dateString2) {
    // so sánh với endDate
    const date1 = convertToDateTime(dateString1);
    const date2 = convertToDateTime(dateString2);
    if (date1 <= date2 && dateString2 != "") {
        return true;
    } else {
        return false;
    }
}

// function convertToDDMMYYYY(dateString) {
//     // convert sang định dạng dd/mm/yyyy
//     if (dateString != "") {
//         const [year, month, day] = dateString.split("-");
//         return `${day}/${month}/${year}`;
//     } else {
//         return "";
//     }
// }
function convertToDDMMYY_HHMMSS(dateTimeString) {
    if (dateTimeString != "") {
        const date = new Date(dateTimeString);
        const day = ("0" + date.getDate()).slice(-2);
        const month = ("0" + (date.getMonth() + 1)).slice(-2);
        const year = date.getFullYear().toString();
        const hours = ("0" + date.getHours()).slice(-2);
        const minutes = ("0" + date.getMinutes()).slice(-2);
        const seconds = ("0" + date.getSeconds()).slice(-2);
        return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
    } else {
        return "";
    }
}

function convertToDDMMYY(dateTimeString) {
    if (dateTimeString != "") {
        const date = new Date(dateTimeString);
        const day = ("0" + date.getDate()).slice(-2);
        const month = ("0" + (date.getMonth() + 1)).slice(-2);
        const year = date.getFullYear().toString();
        return `${day}/${month}/${year}`;
    } else {
        return "";
    }
}

// roleFilter.onchange = filterTable;
roleFilter.onchange = filterTable;
searchFilter.oninput = filterTable;
startDateFilter.onchange = filterTable;
endDateFilter.onchange = filterTable;
refreshBtn.onclick = filterTable;

// var contentAccount = document.querySelector('.details');
// setTimeout(function(){
//     // var opt = {
//     // margin: [10, 10, 10, 10],
//     // filename: 'Danh_sách_khách_hàng.pdf',
//     // image: { type: 'jpeg', quality: 0.98 },
//     // html2canvas: { scale: 0.5 }, // Giảm độ phân giải của hình ảnh
//     // jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
//     // };
//     html2pdf(contentAccount);
// },5000);
function deleteColumn(table, columnIndex) {
    [...table.rows].forEach((row) => {
      row.deleteCell(columnIndex);
    });
}
const accountTable = document.querySelector("#account-table");
const exportAccountTable = document.querySelector("#btn-export-excel");
exportAccountTable.addEventListener('click', () => {
    // Tạo một bản sao của bảng
    var clone = accountTable.cloneNode(true);
    // Xóa cột bạn không muốn xuất
    deleteColumn(clone, 7); // Xóa cột thứ 2
    setTimeout(function(){
        const wb = XLSX.utils.table_to_book(clone, {sheet: 'sheet-1'});
        XLSX.writeFile(wb, 'AccountTable.xlsx');
    }, 2000);
});
  