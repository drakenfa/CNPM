const supplierIdPost = document.querySelector(".modal-edit .modal-footer .supplier_id");

const cardBox = document.querySelector(".card-box");
const content = document.querySelector(".content-module");

const searchFilter = document.querySelector("#search-filter");

const numbers = Array.from(document.querySelectorAll(".card .numbers"));
const cardNames = Array.from(document.querySelectorAll(".card .card-name"));
const tbody = document.querySelector(".details table tbody");
const userImage = document.querySelector(".topbar .user img");

var rowSupplierId = document.querySelector(".row-data.row-supplier-id");
var rowSupplierName = document.querySelector(".row-data.row-supplier-name");
var rowAddress = document.querySelector(".row-data.row-address");
var rowPhoneNumber = document.querySelector(".row-data.row-phone-number");
var rowEmail = document.querySelector(".row-data.row-email");
fetch("../InternalManager/GetAllDataSupplier")
    .then((response) => response.json())
    .then((values) => {
        // Table
        values.infoSupplier.forEach((supplier) => {
            var row = tbody.insertRow();

            var supplierIdCell = row.insertCell();
            supplierIdCell.textContent = supplier.supplier_id; // gán giá trị vào từng ô tương ứng cho bảng

            var supplierNameCell = row.insertCell();
            supplierNameCell.textContent = supplier.supplier_name;

            var supplierAddressCell = row.insertCell();
            supplierAddressCell.classList.add("supplier-address");
            supplierAddressCell.textContent = supplier.address_of_supplier;

            var supplierPhoneNumberCell = row.insertCell();
            supplierPhoneNumberCell.classList.add("supplier-phone-number")
            supplierPhoneNumberCell.textContent = supplier.phone_number_of_supplier;

            var supplierEmailCell = row.insertCell();
            supplierEmailCell.textContent = supplier.email_of_supplier;

            var operation = row.insertCell();
            var btns = `<div class="btns">
            <button class="info" id="info-${supplier.supplier_id}" title="Xem thông tin"><i class="fi fi-rr-info"></i></button>
            `;
            btns += `<button class="edit" id="edit-${supplier.supplier_id}" title="Sửa thông tin"><i class="fi fi-rr-edit"></i></button>
            <button class="delete" id="delete-${supplier.supplier_id}" title="Xóa khách hàng"><i class="fi fi-rr-trash"></i></button></div>`;
            
            operation.insertAdjacentHTML("beforeend", btns);

            tbody.appendChild(row);
        });

        // // Gắn sự kiện click cho container cha (ví dụ: tbody)
        tbody.addEventListener("click", function (event) {
            var clickedElement = event.target;
            var deleteBtn = clickedElement.closest(".delete");
            var infoBtn = clickedElement.closest(".info");
            var editBtn = clickedElement.closest(".edit");
            if (deleteBtn) {
                var supplierId = deleteBtn.id.split("-")[1];
                var supplierName = "";
                values.infoSupplier.forEach((supplier) => {
                    if (supplier.supplier_id == supplierId) {
                        supplierName = supplier.supplier_name;
                    }
                });
                contentModalDelete.textContent =
                    "Bạn có chắc là muốn xóa nhà cung cấp " + supplierName ;
                deleteA.setAttribute(
                    "href",
                    "../Supplier/DeleteSupplier/" + supplierId
                );
                showModalDelete();
            }
            if (infoBtn) {
                var supplierId = infoBtn.id.split("-")[1];
                values.infoSupplier.forEach((supplier) => {
                    if (supplier.supplier_id == supplierId) {
                        rowSupplierId.textContent = supplier.supplier_id;
                        rowSupplierName.textContent = supplier.supplier_name;
                        rowPhoneNumber.textContent = supplier.phone_number_of_supplier;
                        rowEmail.textContent = supplier.email_of_supplier;
                        rowAddress.textContent = supplier.address_of_supplier;
                    }
                });
                showModalInfo();
            }
            if (editBtn) {
                var supplierId = editBtn.id.split("-")[1];
                values.infoSupplier.forEach((supplier) => {
                    if (supplier.supplier_id == supplierId) {
                        supplierNameEditForm.value = supplier.supplier_name;
                        phoneNumberEditForm.value = supplier.phone_number_of_supplier;
                        emailEditForm.value = supplier.email_of_supplier;
                        supplierIdPost.value = supplier.supplier_id;
                        addressEditForm.value = supplier.address_of_supplier;

                        emailEditForm.addEventListener("keyup", function () {
                            var email = this.value;
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "../Supplier/GetSupplierByEmail", true);
                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                            xhr.onload = function () {
                                if (this.status == 200) {
                                    var response = this.responseText;
                                    response = response.trim();
                                    if (response == "Email đã tồn tại" && email != supplier.email_of_supplier) {
                                        editEmailWarning.textContent = "Email đã tồn tại";
                                        editEmailWarning.style.opacity = "1";
                                        isEmailEditValid = false;
                                    } else {
                                        const checkEmail =
                                            /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                                        if (!checkEmail.test(email)) {
                                            editEmailWarning.style.opacity = "1";
                                            editEmailWarning.textContent = "Email không đúng định dạng";
                                            isEmailEditValid = false;
                                        } else {
                                            editEmailWarning.style.opacity = "0";
                                            isEmailEditValid = true;
                                        }
                                    }
                                }
                                confirmAddBtn.disabled = !(
                                    isPhoneNumberAddValid &&
                                    isEmailAddValid &&
                                    isSupplierNameAddValid &&
                                    isAddressAddValid
                                );
                            };
                            xhr.send("email=" + email);
                        });

                        phoneNumberEditForm.addEventListener("keyup", function () {
                            var phone_number = this.value;
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "../Supplier/GetSupplierByPhoneNumber", true);
                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                            xhr.onload = function () {
                                if (this.status == 200) {
                                    var response = this.responseText;
                                    response = response.trim();
                                    if (response == "Số điện thoại đã tồn tại" && phone_number != supplier.phone_number_of_supplier) {
                                        editPhoneNumberWarning.textContent = "Số điện thoại đã tồn tại";
                                        editPhoneNumberWarning.style.opacity = "1";
                                        isPhoneNumberEditValid = false;
                                    } else {
                                        const regex = /^0\d{9}$/;
                                        if (!regex.test(phone_number)) {
                                            editPhoneNumberWarning.style.opacity = "1";
                                            editPhoneNumberWarning.textContent =
                                                "Phải đủ 10 số và bắt đầu là 0";
                                            isPhoneNumberEditValid = false;
                                        } else {
                                            editPhoneNumberWarning.style.opacity = "0";
                                            isPhoneNumberEditValid = true;
                                        }
                                    }
                                }
                                confirmAddBtn.disabled = !(
                                    isPhoneNumberAddValid &&
                                    isEmailAddValid &&
                                    isSupplierNameAddValid &&
                                    isAddressAddValid
                                );
                            };
                            xhr.send("phone_number=" + phone_number);
                        });
                    }
                });
                showModalEdit();
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
const modalInnerAdd = document.querySelector(".modal-inner.modal-add");

const contentModalDelete = document.querySelector(".content-delete");
const contentModalInfo = document.querySelector(".content-info");
const contentModalEdit = document.querySelector(".content-edit");
const contentModalAdd = document.querySelector(".content-add");
const deleteA = document.querySelector(".modal-footer a");

const btnAdd = document.querySelector(".add-btn");
btnAdd.addEventListener("click", showModalAdd);

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
function hideModalEdit() {
    modal.classList.add("hide");
    modalInnerEdit.classList.add("hide");
}
function showModalEdit() {
    modal.classList.remove("hide");
    modalInnerEdit.classList.remove("hide");
}
function hideModalAdd() {
    modal.classList.add("hide");
    modalInnerAdd.classList.add("hide");
    refreshAddForm();
}
function showModalAdd() {
    modal.classList.remove("hide");
    modalInnerAdd.classList.remove("hide");
}
function hideModal() {
    modal.classList.add("hide");
    modalInnerDelete.classList.add("hide");
    modalInnerInfo.classList.add("hide");
    modalInnerEdit.classList.add("hide");
    modalInnerAdd.classList.add("hide");
    refreshAddForm();
}

closeIconDelete.addEventListener("click", hideModalDelete);
closeBtnDelete.addEventListener("click", hideModalDelete);
closeIconInfo.addEventListener("click", hideModalInfo);
closeBtnInfo.addEventListener("click", hideModalInfo);
closeIconEdit.addEventListener("click", hideModalEdit);
// closeBtnEdit.addEventListener("click", hideModalEdit);
closeIconAdd.addEventListener("click", hideModalAdd);
// closeBtnAdd.addEventListener("click", hideModalAdd);
modal.addEventListener("click", hideModal);
modalInnerDelete.addEventListener("click", function (event) {
    event.stopPropagation();
});
modalInnerInfo.addEventListener("click", function (event) {
    event.stopPropagation();
});
modalInnerEdit.addEventListener("click", function (event) {
    event.stopPropagation();
});
modalInnerAdd.addEventListener("click", function (event) {
    event.stopPropagation();
});

const confirmAddBtn = document.getElementById("confirmBtnAdd");
const confirmEditBtn = document.getElementById("confirmBtnEdit");
const formAdd = document.querySelector(".modal-add .modal-body");
const refreshAddBtn = document.querySelector(".modal-add .reset-btn");
const refreshEditBtn = document.querySelector(".modal-edit .reset-btn");
/* refresh add-form */
const addressEditForm = document.querySelector(".address-edit-form");
function refreshEditForm() {
    phoneNumberEditForm.value = "";
    emailEditForm.value = "";
    addressEditForm.value = "";
    supplierNameEditForm.value = "";
    emailEditForm.style.backgroundColor = "#ddd";
    phoneNumberEditForm.style.backgroundColor = "#ddd";
}
refreshEditBtn.addEventListener("click", refreshEditForm);
var isSupplierNameEditValid = true;
var isAddressEditValid = true;
var isPhoneNumberEditValid = true;
var isEmailEditValid = true;

const supplierNameEditForm = document.querySelector(".supplier-name-edit-form");
const editSupplierNameWarning = document.querySelector(".edit-supplier-name-warning");
supplierNameEditForm.addEventListener("keyup", function (e) {
    var value = e.target.value;
    const regex =
        /^[0-9a-zA-Z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]*$/; // chỉ cho phép chữ cái và khoảng trắng
    if (!regex.test(value)) {
        editSupplierNameWarning.style.opacity = "1";
        isSupplierNameEditValid = false;
    } else {
        editSupplierNameWarning.style.opacity = "0";
        isSupplierNameEditValid = true;
    }
    confirmEditBtn.disabled = !(
        isPhoneNumberEditValid &&
        isEmailEditValid &&
        isSupplierNameEditValid &&
        isAddressEditValid
    );
});

const phoneNumberEditForm = document.querySelector(".phone-number-edit-form");
const editPhoneNumberWarning = document.querySelector(
    ".edit-phone-number-warning"
);
const emailEditForm = document.querySelector(".email-edit-form");
const editEmailWarning = document.querySelector(".edit-email-warning");

/* refresh edit-form */
const addressAddForm = document.querySelector(".address-add-form");
function refreshAddForm() {
    supplierNameAddForm.value = "";
    phoneNumberAddForm.value = "";
    emailAddForm.value = "";
    addressAddForm.value = "";
    emailAddForm.style.backgroundColor = "#ddd";
    phoneNumberAddForm.style.backgroundColor = "#ddd";
}
refreshAddBtn.addEventListener("click", refreshAddForm);
var isSupplierNameAddValid = true;
var isAddressAddValid = true;
var isPhoneNumberAddValid = true;
var isEmailAddValid = true;

const supplierNameAddForm = document.querySelector(".supplier_name_add_form");
const addSupplierNameWarning = document.querySelector(".add-supplier-name-warning");
supplierNameAddForm.addEventListener("keyup", function (e) {
    var value = e.target.value;
    const regex =
        /^[0-9a-zA-Z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]*$/; // chỉ cho phép chữ cái và khoảng trắng
    if (!regex.test(value)) {
        addSupplierNameWarning.style.opacity = "1";
        isSupplierNameAddValid = false;
    } else {
        addSupplierNameWarning.style.opacity = "0";
        isSupplierNameAddValid = true;
    }
    confirmAddBtn.disabled = !(
        isPhoneNumberAddValid &&
        isEmailAddValid &&
        isSupplierNameAddValid &&
        isAddressAddValid
    );
});

const phoneNumberAddForm = document.querySelector(".phone-number-add-form");
const addPhoneNumberWarning = document.querySelector(
    ".add-phone-number-warning"
);
phoneNumberAddForm.addEventListener("keyup", function () {
    var phone_number = this.value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../Supplier/GetSupplierByPhoneNumber", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onload = function () {
        if (this.status == 200) {
            var response = this.responseText;
            response = response.trim();
            if (response == "Số điện thoại đã tồn tại") {
                addPhoneNumberWarning.textContent = "Số điện thoại đã tồn tại";
                addPhoneNumberWarning.style.opacity = "1";
                isPhoneNumberAddValid = false;
            } else {
                const regex = /^0\d{9}$/;
                if (!regex.test(phone_number)) {
                    addPhoneNumberWarning.style.opacity = "1";
                    addPhoneNumberWarning.textContent =
                        "Phải đủ 10 số và bắt đầu là 0";
                    isPhoneNumberAddValid = false;
                } else {
                    addPhoneNumberWarning.style.opacity = "0";
                    isPhoneNumberAddValid = true;
                }
            }
        }
        confirmAddBtn.disabled = !(
            isPhoneNumberAddValid &&
            isEmailAddValid &&
            isSupplierNameAddValid &&
            isAddressAddValid
        );
    };
    xhr.send("phone_number=" + phone_number);
});
const emailAddForm = document.querySelector(".email-add-form");
const addEmailWarning = document.querySelector(".add-email-warning");
emailAddForm.addEventListener("keyup", function () {
    var email = this.value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../Supplier/GetSupplierByEmail", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onload = function () {
        if (this.status == 200) {
            var response = this.responseText;
            response = response.trim();
            if (response == "Email đã tồn tại") {
                addEmailWarning.textContent = "Email đã tồn tại";
                addEmailWarning.style.opacity = "1";
                isEmailAddValid = false;
            } else {
                const checkEmail =
                    /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                if (!checkEmail.test(email)) {
                    addEmailWarning.style.opacity = "1";
                    addEmailWarning.textContent = "Email không đúng định dạng";
                    isEmailAddValid = false;
                } else {
                    addEmailWarning.style.opacity = "0";
                    isEmailAddValid = true;
                }
            }
        }
        confirmAddBtn.disabled = !(
            isPhoneNumberAddValid &&
            isEmailAddValid &&
            isSupplierNameAddValid &&
            isAddressAddValid
        );
    };
    xhr.send("email=" + email);
});

function filterTable() {
    var trs = tbody.getElementsByTagName("tr");
    // Lấy giá trị lọc
    // var genderFilterValue = genderFilter.value;
    var searchFilterValue = searchFilter.value.toLowerCase();
    // var startDateString = document.getElementById("start-date").value;
    // var endDateString = document.getElementById("end-date").value;

    for (var i = 0; i < trs.length; i++) {
        var supplierCodeTd = trs[i].getElementsByTagName("td")[0];
        var supplierNameTd = trs[i].getElementsByTagName("td")[1];
        var supplierAddressTd = trs[i].getElementsByTagName("td")[2];
        var supplierPhoneTd = trs[i].getElementsByTagName("td")[3];
        var supplierEmailTd = trs[i].getElementsByTagName("td")[4];

        if (
            supplierCodeTd &&
            supplierNameTd &&
            supplierAddressTd &&
            supplierPhoneTd &&
            supplierEmailTd
        ) {
            var supplierCodeMatch =
                supplierCodeTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1; // so sánh giá trị trong bảng với giá trị lọc
            var supplierNameMatch =
                supplierNameTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var supplierPhoneMatch =
                supplierPhoneTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var supplierEmailMatch =
                supplierEmailTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var supplierAddressMatch =
                supplierAddressTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            trs[i].style.display =
                (supplierCodeMatch ||
                    supplierNameMatch ||
                    supplierPhoneMatch ||
                    supplierEmailMatch ||
                    supplierAddressMatch)
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

function deleteColumn(table, columnIndex) {
    [...table.rows].forEach((row) => {
      row.deleteCell(columnIndex);
    });
}
const customerTable = document.querySelector("#supplier-table");
const exportCustomerTable = document.querySelector("#btn-export-excel");
exportCustomerTable.addEventListener('click', () => {
    var clone = customerTable.cloneNode(true);

    deleteColumn(clone, 5); // Xóa cột thứ 8
    setTimeout(function(){
        const wb = XLSX.utils.table_to_book(clone, {sheet: 'sheet-1'});
        XLSX.writeFile(wb, 'SupplierTable.xlsx');
    }, 2000);
});