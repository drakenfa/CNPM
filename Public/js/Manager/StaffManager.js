var valueArr = {
    0: "Nhân viên bán hàng",
    1: "Nhân viên kho",
    2: "Quản lý cửa hàng",
    3: "Quản trị viên",
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
const cardBox = document.querySelector(".card-box");
const content = document.querySelector(".content-module");

const startDateFilter = document.querySelector("#start-date");
const endDateFilter = document.querySelector("#end-date");
const roleFilter = document.querySelector("#role-filter");
const genderFilter = document.querySelector("#gender-filter");
const searchFilter = document.querySelector("#search-filter");

const numbers = Array.from(document.querySelectorAll(".card .numbers"));
const cardNames = Array.from(document.querySelectorAll(".card .card-name"));
const tbody = document.querySelector(".details table tbody");
const userImage = document.querySelector(".topbar .user img");
const accountIdPost = document.querySelector(".modal-edit .modal-footer .account_id");
const staffIdPost = document.querySelector(".modal-edit .modal-footer .staff_id");

var rowStaffId = document.querySelector(".row-data.row-staff-id");
var rowFullname = document.querySelector(".row-data.row-fullname");
var rowRole = document.querySelector(".row-data.row-role");
var rowPhoneNumber = document.querySelector(".row-data.row-phone-number");
var rowEmail = document.querySelector(".row-data.row-email");
var rowGender = document.querySelector(".row-data.row-gender");
var rowAddress = document.querySelector(".row-data.row-address");
var rowEntryDate = document.querySelector(".row-data.row-entry-date");
var avatarImage = document.querySelector(".modal-info .avatar-section .avatar-image");
fetch("../InternalManager/GetAllDataStaff")
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
        values.roleStaff.forEach((role) => {
            var option = document.createElement("option");
            option.value = role.role_name;
            option.text = role.role_name;
            var optionRoleAddForm = document.createElement("option");
            optionRoleAddForm.value = role.role_id;
            optionRoleAddForm.text = role.role_name;
            var optionRoleEditForm = document.createElement("option");
            optionRoleEditForm.value = role.role_id;
            optionRoleEditForm.text = role.role_name;
            roleIdAddForm.appendChild(optionRoleAddForm);
            roleIdEditForm.appendChild(optionRoleEditForm);
            roleFilter.appendChild(option); // gán giá trị các role vào combobox
        });
        var maleOption = document.createElement("option");
        maleOption.value = "Nam";
        maleOption.text = "Nam";
        var femaleOption = document.createElement("option");
        femaleOption.value = "Nữ";
        femaleOption.text = "Nữ";
        genderFilter.appendChild(maleOption); // gán giá trị các giới tính vào combobox
        genderFilter.appendChild(femaleOption);

        // Table
        values.infoStaff.forEach((staff) => {
            var row = tbody.insertRow();

            var staffIdCell = row.insertCell();
            staffIdCell.textContent = staff.staff_id; // gán giá trị vào từng ô tương ứng cho bảng

            var staffFullnameCell = row.insertCell();
            staffFullnameCell.textContent = staff.staff_fullname;

            var staffRoleCell = row.insertCell();
            staffRoleCell.textContent = staff.role_name;

            var staffPhoneNumberCell = row.insertCell();
            staffPhoneNumberCell.textContent = staff.phone_number;

            var staffEmailCell = row.insertCell();
            staffEmailCell.textContent = staff.email;

            var staffGenderCell = row.insertCell();
            if (staff.gender == 0) {
                staffGenderCell.textContent = "Nam";
            } else {
                staffGenderCell.textContent = "Nữ";
            }

            var staffAddressCell = row.insertCell();
            staffAddressCell.textContent = staff.address;

            var staffEntryDateCell = row.insertCell();
            var date = new Date(staff.entry_date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            staffEntryDateCell.textContent = formattedDate; // format lại ngày

            var operation = row.insertCell();
            var btns = `<div class="btns">
            <button class="info" id="info-${staff.staff_id}" title="Xem thông tin"><i class="fi fi-rr-info"></i></button>
            `;
            if (staff.role_name != "Admin") {
                btns += `<button class="edit" id="edit-${staff.staff_id}" title="Sửa thông tin"><i class="fi fi-rr-edit"></i></button>
                <button class="delete" id="delete-${staff.staff_id}" title="Xóa nhân viên"><i class="fi fi-rr-trash"></i></button></div>`;
            }
            operation.insertAdjacentHTML("beforeend", btns);

            tbody.appendChild(row);
        });

        // Gắn sự kiện click cho container cha (ví dụ: tbody)
        tbody.addEventListener("click", function (event) {
            var clickedElement = event.target;
            var deleteBtn = clickedElement.closest(".delete");
            var infoBtn = clickedElement.closest(".info");
            var editBtn = clickedElement.closest(".edit");
            if (deleteBtn) {
                var staffId = deleteBtn.id.split("-")[1];
                var staffFullname = "";
                var accountId = "";
                values.infoStaff.forEach((staff) => {
                    if (staff.staff_id == staffId) {
                        staffFullname = staff.staff_fullname;
                        accountId = staff.account_id;
                    }
                });
                contentModalDelete.textContent =
                    "Bạn có chắc là muốn xóa nhân viên " + staffFullname ;
                deleteA.setAttribute(
                    "href",
                    "../Staff/DeleteStaff/" + staffId + "/" + accountId
                );
                showModalDelete();
            }
            if (infoBtn) {
                var staffId = infoBtn.id.split("-")[1];
                values.infoStaff.forEach((staff) => {
                    if (staff.staff_id == staffId) {
                        rowStaffId.textContent = staff.staff_id;
                        rowFullname.textContent = staff.staff_fullname;
                        rowRole.textContent = staff.role_name;
                        rowPhoneNumber.textContent = staff.phone_number;
                        rowEmail.textContent = staff.email;
                        if (staff.gender == 0) {
                            rowGender.textContent = "Nam";
                        } else if (staff.gender == 1) {
                            rowGender.textContent = "Nữ";
                        }
                        rowAddress.textContent = staff.address;
                        avatarImage.setAttribute("src", "../Public/img/staffAvatar/"+staff.avatar);
                        var date = new Date(staff.entry_date);
                        var day = date.getDate();
                        var month = date.getMonth() + 1;
                        var year = date.getFullYear();
                        if (day < 10) day = "0" + day;
                        if (month < 10) month = "0" + month;
                        var formattedDate = day + "/" + month + "/" + year;
                        rowEntryDate.textContent = formattedDate;
                    }
                });
                showModalInfo();
            }
            if (editBtn) {
                var staffId = editBtn.id.split("-")[1];
                var staffFullname = "";
                values.infoStaff.forEach((staff) => {
                    if (staff.staff_id == staffId) {
                        staffFullname = staff.staff_fullname;
                        fullnameEditForm.value = staff.staff_fullname;
                        roleIdEditForm.selectedIndex = staff.role_id;
                        phoneNumberEditForm.value = staff.phone_number;
                        emailEditForm.value = staff.email;
                        accountIdPost.value = staff.account_id;
                        staffIdPost.value = staffId;
                        if (staff.gender == 0) {
                            genderEditForm.selectedIndex = 1;
                        } else if (staff.gender == 1) {
                            genderEditForm.selectedIndex = 2;
                        }
                        addressEditForm.value = staff.address;
                        passwordEditForm.value = staff.password;
                        // avatarEditForm.value = staff.avatar;

                        emailEditForm.addEventListener("keyup", function () {
                            var email = this.value;
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "../Staff/GetAccountByEmail", true);
                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                            xhr.onload = function () {
                                if (this.status == 200) {
                                    var response = this.responseText;
                                    response = response.trim();
                                    if (response == "Email đã tồn tại" && email != staff.email) {
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
                                confirmEditBtn.disabled = !(
                                    isPhoneNumberEditValid &&
                                    isEmailEditValid &&
                                    isFullnameEditValid &&
                                    isRoleEditValid &&
                                    isGenderEditValid &&
                                    isPasswordEditValid
                                );
                            };
                            xhr.send("email=" + email);
                        });

                        phoneNumberEditForm.addEventListener("keyup", function () {
                            var phone_number = this.value;
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "../Staff/GetAccountByPhoneNumber", true);
                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                            xhr.onload = function () {
                                if (this.status == 200) {
                                    var response = this.responseText;
                                    response = response.trim();
                                    if (response == "Số điện thoại đã tồn tại" && phone_number != staff.phone_number) {
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
                                confirmEditBtn.disabled = !(
                                    isPhoneNumberEditValid &&
                                    isEmailEditValid &&
                                    isFullnameEditValid &&
                                    isRoleEditValid &&
                                    isGenderEditValid &&
                                    isPasswordEditValid
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

const refreshBtn = document.querySelector(".reset-btn");
refreshBtn.addEventListener("click", function () {
    startDateFilter.value = "";
    endDateFilter.value = "";
    roleFilter.selectedIndex = 0;
    genderFilter.selectedIndex = 0;
    searchFilter.value = "";
    document.getElementById("start-date").max = null;
    document.getElementById("end-date").min = null;
});

const confirmAddBtn = document.getElementById("confirmBtnAdd");
const confirmEditBtn = document.getElementById("confirmBtnEdit");
const formAdd = document.querySelector(".modal-add .modal-body");
const refreshAddBtn = document.querySelector(".modal-add .reset-btn");
const refreshEditBtn = document.querySelector(".modal-edit .reset-btn");
/* refresh add-form */
const addressEditForm = document.querySelector(".address-edit-form");
function refreshEditForm() {
    fullnameEditForm.value = "";
    roleIdEditForm.selectedIndex = 0;
    phoneNumberEditForm.value = "";
    emailEditForm.value = "";
    genderEditForm.selectedIndex = 0;
    addressEditForm.value = "";
    passwordEditForm.value = "";
    emailEditForm.style.backgroundColor = "#ddd";
    phoneNumberEditForm.style.backgroundColor = "#ddd";
}
refreshEditBtn.addEventListener("click", refreshEditForm);
var isFullnameEditValid = true;
var isRoleEditValid = true;
var isGenderEditValid = true;
var isPasswordEditValid = true;
var isPhoneNumberEditValid = true;
var isEmailEditValid = true;

const fullnameEditForm = document.querySelector(".fullname-edit-form");
const editFullnameWarning = document.querySelector(".edit-fullname-warning");
fullnameEditForm.addEventListener("keyup", function (e) {
    var value = e.target.value;
    const regex =
        /^[a-zA-Z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]*$/; // chỉ cho phép chữ cái và khoảng trắng
    if (!regex.test(value)) {
        editFullnameWarning.style.opacity = "1";
        isFullnameEditValid = false;
    } else {
        editFullnameWarning.style.opacity = "0";
        isFullnameEditValid = true;
    }
    confirmEditBtn.disabled = !(
        isPhoneNumberEditValid &&
        isEmailEditValid &&
        isFullnameEditValid &&
        isRoleEditValid &&
        isGenderEditValid &&
        isPasswordEditValid
    );
});

const roleIdEditForm = document.querySelector(".role-id-edit-form");
const editRoleWarning = document.querySelector(".edit-role-warning");
roleIdEditForm.value = "-1";
roleIdEditForm.addEventListener("change", function (e) {
    if (this.value == "-1") {
        editRoleWarning.style.opacity = "1";
        isRoleEditValid = false;
    } else {
        editRoleWarning.style.opacity = "0";
        isRoleEditValid = true;
    }
    confirmEditBtn.disabled = !(
        isPhoneNumberEditValid &&
        isEmailEditValid &&
        isFullnameEditValid &&
        isRoleEditValid &&
        isGenderEditValid &&
        isPasswordEditValid
    );
});
const genderEditForm = document.querySelector(".gender-edit-form");
const editGenderWarning = document.querySelector(".edit-gender-warning");
genderEditForm.value = "-1";
genderEditForm.addEventListener("change", function (e) {
    if (this.value == "-1") {
        editGenderWarning.style.opacity = "1";
        isGenderEditValid = false;
    } else {
        editGenderWarning.style.opacity = "0";
        isGenderEditValid = true;
    }
    confirmEditBtn.disabled = !(
        isPhoneNumberEditValid &&
        isEmailEditValid &&
        isFullnameEditValid &&
        isRoleEditValid &&
        isGenderEditValid &&
        isPasswordEditValid
    );
});

const phoneNumberEditForm = document.querySelector(".phone-number-edit-form");
const editPhoneNumberWarning = document.querySelector(
    ".edit-phone-number-warning"
);
// phoneNumberEditForm.addEventListener("keyup", function () {
//     var phone_number = this.value;
//     var xhr = new XMLHttpRequest();
//     xhr.open("POST", "../Staff/GetAccountByPhoneNumber", true);
//     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//     xhr.onload = function () {
//         if (this.status == 200) {
//             var response = this.responseText;
//             response = response.trim();
//             if (response == "Số điện thoại đã tồn tại") {
//                 editPhoneNumberWarning.textContent = "Số điện thoại đã tồn tại";
//                 editPhoneNumberWarning.style.opacity = "1";
//                 isPhoneNumberEditValid = false;
//             } else {
//                 const regex = /^0\d{9}$/;
//                 if (!regex.test(phone_number)) {
//                     editPhoneNumberWarning.style.opacity = "1";
//                     editPhoneNumberWarning.textContent =
//                         "Phải đủ 10 số và bắt đầu là 0";
//                     isPhoneNumberEditValid = false;
//                 } else {
//                     editPhoneNumberWarning.style.opacity = "0";
//                     isPhoneNumberEditValid = true;
//                 }
//             }
//         }
//         confirmEditBtn.disabled = !(
//             isPhoneNumberEditValid &&
//             isEmailEditValid &&
//             isFullnameEditValid &&
//             isRoleEditValid &&
//             isGenderEditValid &&
//             isPasswordEditValid &&
//             isAvatarEditValid
//         );
//     };
//     xhr.send("phone_number=" + phone_number);
// });
const emailEditForm = document.querySelector(".email-edit-form");
const editEmailWarning = document.querySelector(".edit-email-warning");
// emailEditForm.addEventListener("keyup", function () {
//     var email = this.value;
//     var xhr = new XMLHttpRequest();
//     xhr.open("POST", "../Staff/GetAccountByEmail", true);
//     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//     xhr.onload = function () {
//         if (this.status == 200) {
//             var response = this.responseText;
//             response = response.trim();
//             if (response == "Email đã tồn tại") {
//                 editEmailWarning.textContent = "Email đã tồn tại";
//                 editEmailWarning.style.opacity = "1";
//                 isEmailEditValid = false;
//             } else {
//                 const checkEmail =
//                     /^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
//                 if (!checkEmail.test(email)) {
//                     editEmailWarning.style.opacity = "1";
//                     editEmailWarning.textContent = "Email không đúng định dạng";
//                     isEmailEditValid = false;
//                 } else {
//                     editEmailWarning.style.opacity = "0";
//                     isEmailEditValid = true;
//                 }
//             }
//         }
//         confirmEditBtn.disabled = !(
//             isPhoneNumberEditValid &&
//             isEmailEditValid &&
//             isFullnameEditValid &&
//             isRoleEditValid &&
//             isGenderEditValid &&
//             isPasswordEditValid &&
//             isAvatarEditValid
//         );
//     };
//     xhr.send("email=" + email);
// });

const passwordEditForm = document.querySelector(".password-edit-form");
const editPasswordWarning = document.querySelector(".edit-password-warning");
passwordEditForm.addEventListener("keyup", function (e) {
    const checkLetter = /[a-zA-Z]/;
    const checkNumber = /[0-9]/;
    const checkSpecialCharacter = /[^a-zA-Z0-9]/;

    if (
        checkSpecialCharacter.test(e.target.value) &&
        checkLetter.test(e.target.value) &&
        checkNumber.test(e.target.value) &&
        this.value.length > 6
    ) {
        editPasswordWarning.style.opacity = "0";
        isPasswordEditValid = true;
    } else {
        editPasswordWarning.style.opacity = "1";
        editPasswordWarning.textContent =
            "Phải có 7 ký tự, có chữ thường, chữ hoa, số và ký tự đặc biệt";
        isPasswordEditValid = false;
    }

    confirmEditBtn.disabled = !(
        isPhoneNumberEditValid &&
        isEmailEditValid &&
        isFullnameEditValid &&
        isRoleEditValid &&
        isGenderEditValid &&
        isPasswordEditValid
    );
});

// const avatarEditForm = document.querySelector(".avatar-edit-form");
// const editAvatarWarning = document.querySelector(".edit-avatar-warning");
// avatarEditForm.addEventListener("change", function (event) {
//     const regex = /\.(png|jpg|jpeg)$/i;
//     var selectedFile = event.target.files[0];
//     if (!regex.test(selectedFile.name)) {
//         editAvatarWarning.style.opacity = "1";
//         isAvatarEditValid = false;
//     } else {
//         editAvatarWarning.style.opacity = "0";
//         isAvatarEditValid = true;
//     }
//     confirmEditBtn.disabled = !(
//         isPhoneNumberEditValid &&
//         isEmailEditValid &&
//         isFullnameEditValid &&
//         isRoleEditValid &&
//         isGenderEditValid &&
//         isPasswordEditValid &&
//         isAvatarEditValid
//     );
// });
/* refresh edit-form */
const addressAddForm = document.querySelector(".address-add-form");
function refreshAddForm() {
    fullnameAddForm.value = "";
    roleIdAddForm.selectedIndex = 0;
    phoneNumberAddForm.value = "";
    emailAddForm.value = "";
    genderAddForm.selectedIndex = 0;
    addressAddForm.value = "";
    passwordAddForm.value = "";
    avatarAddForm.value = "";
    emailAddForm.style.backgroundColor = "#ddd";
    phoneNumberAddForm.style.backgroundColor = "#ddd";
}
refreshAddBtn.addEventListener("click", refreshAddForm);
var isFullnameAddValid = true;
var isRoleAddValid = false;
var isGenderAddValid = false;
var isPasswordAddValid = true;
var isAvatarAddValid = true;
var isPhoneNumberAddValid = true;
var isEmailAddValid = true;

const fullnameAddForm = document.querySelector(".fullname-add-form");
const addFullnameWarning = document.querySelector(".add-fullname-warning");
fullnameAddForm.addEventListener("keyup", function (e) {
    var value = e.target.value;
    const regex =
        /^[a-zA-Z áàảãạÁÀẢÃẠăắằặẳẵĂẮẰẲẴẶâấầẩẫậÂẤẦẨẪẬéèẻẽẹÉÈẺẼẸêếềểễệÊẾỂỄỆíìỉĩịÍÌỈĨỊúùủũụÚÙỦŨỤưứừửữựƯỨỪỬỮỰóòỏõọÓÒỎÕỌôốồổỗộÔỐỒỔỖỘơớờởỡợƠỚỜỞỠỢđĐýỳỷỹỵÝỲỶỸỴ]*$/; // chỉ cho phép chữ cái và khoảng trắng
    if (!regex.test(value)) {
        addFullnameWarning.style.opacity = "1";
        isFullnameAddValid = false;
    } else {
        addFullnameWarning.style.opacity = "0";
        isFullnameAddValid = true;
    }
    confirmAddBtn.disabled = !(
        isPhoneNumberAddValid &&
        isEmailAddValid &&
        isFullnameAddValid &&
        isRoleAddValid &&
        isGenderAddValid &&
        isPasswordAddValid &&
        isAvatarAddValid
    );
});
const roleIdAddForm = document.querySelector(".role-id-add-form");
const addRoleWarning = document.querySelector(".add-role-warning");
roleIdAddForm.value = "-1";
roleIdAddForm.addEventListener("change", function (e) {
    if (this.value == "-1") {
        addRoleWarning.style.opacity = "1";
        isRoleAddValid = false;
    } else {
        addRoleWarning.style.opacity = "0";
        isRoleAddValid = true;
    }
    confirmAddBtn.disabled = !(
        isPhoneNumberAddValid &&
        isEmailAddValid &&
        isFullnameAddValid &&
        isRoleAddValid &&
        isGenderAddValid &&
        isPasswordAddValid &&
        isAvatarAddValid
    );
});
const genderAddForm = document.querySelector(".gender-add-form");
const addGenderWarning = document.querySelector(".add-gender-warning");
genderAddForm.value = "-1";
genderAddForm.addEventListener("change", function (e) {
    if (this.value == "-1") {
        addGenderWarning.style.opacity = "1";
        isGenderAddValid = false;
    } else {
        addGenderWarning.style.opacity = "0";
        isGenderAddValid = true;
    }
    confirmAddBtn.disabled = !(
        isPhoneNumberAddValid &&
        isEmailAddValid &&
        isFullnameAddValid &&
        isRoleAddValid &&
        isGenderAddValid &&
        isPasswordAddValid &&
        isAvatarAddValid
    );
});
const passwordAddForm = document.querySelector(".password-add-form");
const addPasswordWarning = document.querySelector(".add-password-warning");
passwordAddForm.addEventListener("keyup", function (e) {
    const checkLetter = /[a-zA-Z]/;
    const checkNumber = /[0-9]/;
    const checkSpecialCharacter = /[^a-zA-Z0-9]/;

    if (
        checkSpecialCharacter.test(e.target.value) &&
        checkLetter.test(e.target.value) &&
        checkNumber.test(e.target.value) &&
        this.value.length > 6
    ) {
        addPasswordWarning.style.opacity = "0";
        isPasswordAddValid = true;
    } else {
        addPasswordWarning.style.opacity = "1";
        addPasswordWarning.textContent =
            "Phải có 7 ký tự, có chữ thường, chữ hoa, số và ký tự đặc biệt";
        isPasswordAddValid = false;
    }

    confirmAddBtn.disabled = !(
        isPhoneNumberAddValid &&
        isEmailAddValid &&
        isFullnameAddValid &&
        isRoleAddValid &&
        isGenderAddValid &&
        isPasswordAddValid &&
        isAvatarAddValid
    );
});
const avatarAddForm = document.querySelector(".avatar-add-form");
const addAvatarWarning = document.querySelector(".add-avatar-warning");
avatarAddForm.addEventListener("change", function (event) {
    const regex = /\.(png|jpg|jpeg)$/i;
    var selectedFile = event.target.files[0];
    if (!regex.test(selectedFile.name)) {
        addAvatarWarning.style.opacity = "1";
        isAvatarAddValid = false;
    } else {
        addAvatarWarning.style.opacity = "0";
        isAvatarAddValid = true;
    }
    confirmAddBtn.disabled = !(
        isPhoneNumberAddValid &&
        isEmailAddValid &&
        isFullnameAddValid &&
        isRoleAddValid &&
        isGenderAddValid &&
        isPasswordAddValid &&
        isAvatarAddValid
    );
});

const phoneNumberAddForm = document.querySelector(".phone-number-add-form");
const addPhoneNumberWarning = document.querySelector(
    ".add-phone-number-warning"
);
phoneNumberAddForm.addEventListener("keyup", function () {
    var phone_number = this.value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../Staff/GetAccountByPhoneNumber", true);
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
            isFullnameAddValid &&
            isRoleAddValid &&
            isGenderAddValid &&
            isPasswordAddValid &&
            isAvatarAddValid
        );
    };
    xhr.send("phone_number=" + phone_number);
});
const emailAddForm = document.querySelector(".email-add-form");
const addEmailWarning = document.querySelector(".add-email-warning");
emailAddForm.addEventListener("keyup", function () {
    var email = this.value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../Staff/GetAccountByEmail", true);
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
            isFullnameAddValid &&
            isRoleAddValid &&
            isGenderAddValid &&
            isPasswordAddValid &&
            isAvatarAddValid
        );
    };
    xhr.send("email=" + email);
});

function filterTable() {
    var trs = tbody.getElementsByTagName("tr");
    // Lấy giá trị lọc
    var roleFilterValue = roleFilter.value;
    var genderFilterValue = genderFilter.value;
    var searchFilterValue = searchFilter.value.toLowerCase();
    // var startDate = new Date(document.getElementById("start-date").value);
    // var endDate = new Date(document.getElementById("end-date").value);
    var startDateString = document.getElementById("start-date").value;
    var endDateString = document.getElementById("end-date").value;

    for (var i = 0; i < trs.length; i++) {
        var roleTd = trs[i].getElementsByTagName("td")[2]; // lấy ra giá trị từng cột
        var genderTd = trs[i].getElementsByTagName("td")[5];

        var staffCodeTd = trs[i].getElementsByTagName("td")[0];
        var staffNameTd = trs[i].getElementsByTagName("td")[1];
        var staffPhoneTd = trs[i].getElementsByTagName("td")[3];
        var staffEmailTd = trs[i].getElementsByTagName("td")[4];
        var staffAddressTd = trs[i].getElementsByTagName("td")[6];

        var entryDateTd = trs[i].getElementsByTagName("td")[7];

        if (
            roleTd &&
            genderTd &&
            staffCodeTd &&
            staffNameTd &&
            staffPhoneTd &&
            staffEmailTd &&
            staffAddressTd &&
            entryDateTd
        ) {
            // nếu tồn tại thì thay đổi tránh crash
            var roleValue = roleTd.textContent || roleTd.innerText;
            var genderValue = genderTd.textContent || genderTd.innerText;

            var roleMatch =
                roleFilterValue == "Chức vụ" ||
                roleValue.indexOf(roleFilterValue) > -1;
            var genderMatch =
                genderFilterValue == "Giới tính" || //nếu mặc định thì sẽ hiển thị
                genderValue.indexOf(genderFilterValue) > -1; // nếu không chứa giá trị lọc thì ẩn
            var staffCodeMatch =
                staffCodeTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1; // so sánh giá trị trong bảng với giá trị lọc
            var staffNameMatch =
                staffNameTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var staffPhoneMatch =
                staffPhoneTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var staffEmailMatch =
                staffEmailTd.textContent
                    .toLowerCase()
                    .indexOf(searchFilterValue) > -1;
            var staffAddressMatch =
                staffAddressTd.textContent
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
                var entryDateMatch =
                    compareStartDate(
                        entryDateTd.textContent,
                        convertToDDMMYYYY(startDateString)
                    ) &&
                    compareEndDate(
                        entryDateTd.textContent,
                        convertToDDMMYYYY(endDateString)
                    );
            } else {
                entryDateMatch = true;
            }
            trs[i].style.display =
                roleMatch &&
                genderMatch &&
                (staffCodeMatch ||
                    staffNameMatch ||
                    staffPhoneMatch ||
                    staffEmailMatch ||
                    staffAddressMatch) &&
                entryDateMatch
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
roleFilter.onchange = filterTable;
genderFilter.onchange = filterTable;
searchFilter.oninput = filterTable;
startDateFilter.onchange = filterTable;
endDateFilter.onchange = filterTable;
refreshBtn.onclick = filterTable;


function deleteColumn(table, columnIndex) {
    [...table.rows].forEach((row) => {
      row.deleteCell(columnIndex);
    });
}
const customerTable = document.querySelector("#staff-table");
const exportCustomerTable = document.querySelector("#btn-export-excel");
exportCustomerTable.addEventListener('click', () => {
    var clone = customerTable.cloneNode(true);

    deleteColumn(clone, 8); // Xóa cột thứ 8
    setTimeout(function(){
        const wb = XLSX.utils.table_to_book(clone, {sheet: 'sheet-1'});
        XLSX.writeFile(wb, 'StaffTable.xlsx');
    }, 2000);
});
  