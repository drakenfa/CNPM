const supplierIdPost = document.querySelector(".modal-edit .modal-footer .supplier_id");    

const searchFilter = document.querySelector("#search-filter");
const reasonFilter = document.querySelector("#reason-filter");
const statusFilter = document.querySelector("#status-filter");
const tbody = document.querySelector(".details table tbody");

fetch("../InternalManager/GetAllDataLeaveApplication")
    .then((response) => response.json())
    .then((values) => {
        // Table
        values.leaveApplications.forEach((leaveApplication) => {
            var row = tbody.insertRow();

            var leaveApplicationIdCell = row.insertCell();
            leaveApplicationIdCell.textContent = leaveApplication.leave_application_id; // gán giá trị vào từng ô tương ứng cho bảng

            var staffFullname = row.insertCell();
            staffFullname.textContent = leaveApplication.staff_fullname;

            var startDate = row.insertCell();
            var date = new Date(leaveApplication.start_date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            startDate.textContent = formattedDate;

            var endDate = row.insertCell();
            var date = new Date(leaveApplication.end_date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            endDate.textContent = formattedDate;

            var reason = row.insertCell();
            reason.textContent = leaveApplication.reason;

            var status = row.insertCell();
            if(leaveApplication.status == 0){
                status.textContent = "Chờ duyệt";
            }else if(leaveApplication.status == 1){
                status.textContent = "Đã duyệt";
            }

            var operation = row.insertCell();
            if(leaveApplication.status == 0){
                var btns = `<div class="btns">
                <button class="approve" id="approve-${leaveApplication.leave_application_id}" title="Duyệt đơn"><i class="fi fi-rr-memo-circle-check"></i></button></div>
                `;
            }else{
                var btns = `<div class="btns">
                <button class="approved" id="approve-${leaveApplication.leave_application_id}" title="Đã duyệt đơn"><i class="fi fi-rr-memo-circle-check"></i></button></div>
                `;
            }
            
            operation.insertAdjacentHTML("beforeend", btns);
            tbody.appendChild(row);
        });
        // // Gắn sự kiện click cho container cha (ví dụ: tbody)
        tbody.addEventListener("click", function (event) {
            var clickedElement = event.target;
            var approveBtn = clickedElement.closest(".approve");
            if (approveBtn) {
                var leaveApplicationId = approveBtn.id.split("-")[1];
                var staffName = "";
                values.leaveApplications.forEach((leaveApplication) => {
                    if (leaveApplication.leave_application_id == leaveApplicationId) {
                        staffName = leaveApplication.staff_fullname;
                    }
                });
                contentModalApprove.textContent =
                    "Bạn có chắc là muốn duyệt đơn xin nghỉ cho nhân viên " + staffName ;
                approveA.setAttribute(
                    "href",
                    "../LeaveApplication/ApproveApplication/" + leaveApplicationId
                );
                showModalApprove();
            }
        });
    })
    .catch((error) => console.log("Error: ", error));

const modal = document.querySelector(".modal");
const closeIconApprove = document.querySelector("#closeIconApprove");
const closeBtnApprove = document.querySelector("#closeBtnApprove");
const modalInnerApprove = document.querySelector(".modal-inner.modal-approve");

const contentModalApprove = document.querySelector(".content-approve");
const approveA = document.querySelector(".modal-footer a");

function hideModalApprove() {
    modal.classList.add("hide");
    modalInnerApprove.classList.add("hide");
}
function showModalApprove() {
    modal.classList.remove("hide");
    modalInnerApprove.classList.remove("hide");
}
function hideModal() {
    modal.classList.add("hide");
    modalInnerApprove.classList.add("hide");
}

closeIconApprove.addEventListener("click", hideModalApprove);
closeBtnApprove.addEventListener("click", hideModalApprove);

modal.addEventListener("click", hideModal);
modalInnerApprove.addEventListener("click", function (event) {
    event.stopPropagation();
});
const refreshBtn = document.querySelector(".reset-btn");
refreshBtn.addEventListener("click", function () {
    statusFilter.selectedIndex = 0;
    reasonFilter.selectedIndex = 0;
    searchFilter.value = "";
});

// const confirmAddBtn = document.getElementById("confirmBtnAdd");
// const confirmEditBtn = document.getElementById("confirmBtnEdit");
// const formAdd = document.querySelector(".modal-add .modal-body");
// const refreshAddBtn = document.querySelector(".modal-add .reset-btn");
// const refreshEditBtn = document.querySelector(".modal-edit .reset-btn");
// /* refresh add-form */
// const addressEditForm = document.querySelector(".address-edit-form");
// function refreshEditForm() {
//     phoneNumberEditForm.value = "";
//     emailEditForm.value = "";
//     addressEditForm.value = "";
//     supplierNameEditForm.value = "";
//     emailEditForm.style.backgroundColor = "#ddd";
//     phoneNumberEditForm.style.backgroundColor = "#ddd";
// }
// refreshEditBtn.addEventListener("click", refreshEditForm);
// var isSupplierNameEditValid = true;
// var isAddressEditValid = true;
// var isPhoneNumberEditValid = true;
// var isEmailEditValid = true;

// const supplierNameEditForm = document.querySelector(".supplier-name-edit-form");
// const editSupplierNameWarning = document.querySelector(".edit-supplier-name-warning");
// supplierNameEditForm.addEventListener("keyup", function (e) {
//     var value = e.target.value;
//     const regex =
//         /^[0-9a-zA-Z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]*$/; // chỉ cho phép chữ cái và khoảng trắng
//     if (!regex.test(value)) {
//         editSupplierNameWarning.style.opacity = "1";
//         isSupplierNameEditValid = false;
//     } else {
//         editSupplierNameWarning.style.opacity = "0";
//         isSupplierNameEditValid = true;
//     }
//     confirmEditBtn.disabled = !(
//         isPhoneNumberEditValid &&
//         isEmailEditValid &&
//         isSupplierNameEditValid &&
//         isAddressEditValid
//     );
// });

// const phoneNumberEditForm = document.querySelector(".phone-number-edit-form");
// const editPhoneNumberWarning = document.querySelector(
//     ".edit-phone-number-warning"
// );
// const emailEditForm = document.querySelector(".email-edit-form");
// const editEmailWarning = document.querySelector(".edit-email-warning");

// /* refresh edit-form */
// const addressAddForm = document.querySelector(".address-add-form");
// function refreshAddForm() {
//     supplierNameAddForm.value = "";
//     phoneNumberAddForm.value = "";
//     emailAddForm.value = "";
//     addressAddForm.value = "";
//     emailAddForm.style.backgroundColor = "#ddd";
//     phoneNumberAddForm.style.backgroundColor = "#ddd";
// }
// refreshAddBtn.addEventListener("click", refreshAddForm);
// var isSupplierNameAddValid = true;
// var isAddressAddValid = true;
// var isPhoneNumberAddValid = true;
// var isEmailAddValid = true;

// const supplierNameAddForm = document.querySelector(".supplier_name_add_form");
// const addSupplierNameWarning = document.querySelector(".add-supplier-name-warning");
// supplierNameAddForm.addEventListener("keyup", function (e) {
//     var value = e.target.value;
//     const regex =
//         /^[0-9a-zA-Z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]*$/; // chỉ cho phép chữ cái và khoảng trắng
//     if (!regex.test(value)) {
//         addSupplierNameWarning.style.opacity = "1";
//         isSupplierNameAddValid = false;
//     } else {
//         addSupplierNameWarning.style.opacity = "0";
//         isSupplierNameAddValid = true;
//     }
//     confirmAddBtn.disabled = !(
//         isPhoneNumberAddValid &&
//         isEmailAddValid &&
//         isSupplierNameAddValid &&
//         isAddressAddValid
//     );
// });

// const phoneNumberAddForm = document.querySelector(".phone-number-add-form");
// const addPhoneNumberWarning = document.querySelector(
//     ".add-phone-number-warning"
// );
// phoneNumberAddForm.addEventListener("keyup", function () {
//     var phone_number = this.value;
//     var xhr = new XMLHttpRequest();
//     xhr.open("POST", "../Supplier/GetSupplierByPhoneNumber", true);
//     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//     xhr.onload = function () {
//         if (this.status == 200) {
//             var response = this.responseText;
//             response = response.trim();
//             if (response == "Số điện thoại đã tồn tại") {
//                 addPhoneNumberWarning.textContent = "Số điện thoại đã tồn tại";
//                 addPhoneNumberWarning.style.opacity = "1";
//                 isPhoneNumberAddValid = false;
//             } else {
//                 const regex = /^0\d{9}$/;
//                 if (!regex.test(phone_number)) {
//                     addPhoneNumberWarning.style.opacity = "1";
//                     addPhoneNumberWarning.textContent =
//                         "Phải đủ 10 số và bắt đầu là 0";
//                     isPhoneNumberAddValid = false;
//                 } else {
//                     addPhoneNumberWarning.style.opacity = "0";
//                     isPhoneNumberAddValid = true;
//                 }
//             }
//         }
//         confirmAddBtn.disabled = !(
//             isPhoneNumberAddValid &&
//             isEmailAddValid &&
//             isSupplierNameAddValid &&
//             isAddressAddValid
//         );
//     };
//     xhr.send("phone_number=" + phone_number);
// });
// const emailAddForm = document.querySelector(".email-add-form");
// const addEmailWarning = document.querySelector(".add-email-warning");
// emailAddForm.addEventListener("keyup", function () {
//     var email = this.value;
//     var xhr = new XMLHttpRequest();
//     xhr.open("POST", "../Supplier/GetSupplierByEmail", true);
//     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//     xhr.onload = function () {
//         if (this.status == 200) {
//             var response = this.responseText;
//             response = response.trim();
//             if (response == "Email đã tồn tại") {
//                 addEmailWarning.textContent = "Email đã tồn tại";
//                 addEmailWarning.style.opacity = "1";
//                 isEmailAddValid = false;
//             } else {
//                 const checkEmail =
//                     /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
//                 if (!checkEmail.test(email)) {
//                     addEmailWarning.style.opacity = "1";
//                     addEmailWarning.textContent = "Email không đúng định dạng";
//                     isEmailAddValid = false;
//                 } else {
//                     addEmailWarning.style.opacity = "0";
//                     isEmailAddValid = true;
//                 }
//             }
//         }
//         confirmAddBtn.disabled = !(
//             isPhoneNumberAddValid &&
//             isEmailAddValid &&
//             isSupplierNameAddValid &&
//             isAddressAddValid
//         );
//     };
//     xhr.send("email=" + email);
// });

function filterTable() {
    var trs = tbody.getElementsByTagName("tr");
    // Lấy giá trị lọc
    var reasonFilterValue = reasonFilter.value;
    var statusFilterValue = statusFilter.value;
    var searchFilterValue = searchFilter.value.toLowerCase();

    for (var i = 0; i < trs.length; i++) {
        var applicationCodeTd = trs[i].getElementsByTagName("td")[0];
        var staffNameTd = trs[i].getElementsByTagName("td")[1];
        var reasonTd = trs[i].getElementsByTagName("td")[4];
        var statusTd = trs[i].getElementsByTagName("td")[5];

        if (
            applicationCodeTd &&
            staffNameTd &&
            reasonTd &&
            statusTd
        ) {
            var applicationCodeMatch =
            applicationCodeTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1; // so sánh giá trị trong bảng với giá trị lọc
            var staffNameMatch =
                staffNameTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var reasonValue = reasonTd.textContent || reasonTd.innerText;
            var statusValue = statusTd.textContent || statusTd.innerText;
            var reasonSelectMatch =
            reasonFilterValue == "0" || //nếu mặc định thì sẽ hiển thị
            reasonValue.indexOf(reasonFilterValue) > -1; // nếu không chứa giá trị lọc thì ẩn
            var statusSelectMatch =
            statusFilterValue == "0" || //nếu mặc định thì sẽ hiển thị
            statusValue.indexOf(statusFilterValue) > -1; // nếu không chứa giá trị lọc thì ẩn
            trs[i].style.display = reasonSelectMatch && statusSelectMatch &&
                (applicationCodeMatch ||
                    staffNameMatch)
                    ? ""
                    : "none";
        }
    }
}
function convertToDate(dateString) {
    const [day, month, year] = dateString.split("/");
    return new Date(year, month - 1, day);
}
function compareStartDate(dateString1, dateString2) {
    // so sánh với startDate
    const date1 = convertToDate(dateString1);
    const date2 = convertToDate(dateString2);
    if (date1 >= date2 && dateString2 != "") {
        return true;
    } else {
        return false;
    }
}
function compareEndDate(dateString1, dateString2) {
    // so sánh với endDate
    const date1 = convertToDate(dateString1);
    const date2 = convertToDate(dateString2);
    if (date1 <= date2 && dateString2 != "") {
        return true;
    } else {
        return false;
    }
}

function convertToDDMMYYYY(dateString) {
    // convert sang định dạng dd/mm/yyyy
    if (dateString != "") {
        const [year, month, day] = dateString.split("-");
        return `${day}/${month}/${year}`;
    } else {
        return "";
    }
}
searchFilter.oninput = filterTable;
reasonFilter.onchange = filterTable;
statusFilter.onchange = filterTable;
refreshBtn.onclick = filterTable;