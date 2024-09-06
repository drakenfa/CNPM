// // Khởi tạo đối tượng jsPDF
// var doc = new window.jspdf.jsPDF();

// // Thêm nội dung
// doc.text('Hello world!', 10, 10);

// // Lưu file PDF
// doc.save('sample.pdf');
var accountIdPost = document.querySelector(".account_id");
accountIdPost.value = sessionStorage.getItem("account_id");
var accountIdPostEdit = document.querySelector(".modal-edit .account_id");
accountIdPostEdit.value = sessionStorage.getItem("account_id");
var staffIdPost = document.querySelector(".staff_id");
staffIdPost.value = sessionStorage.getItem("staff_id");
var staffIdLeavePost = document.querySelector(".staff_id_leave");
staffIdLeavePost.value = sessionStorage.getItem("staff_id");
var staffIdSickPost = document.querySelector(".staff_id_sick");
staffIdSickPost.value = sessionStorage.getItem("staff_id");
var staffIdDemistPost = document.querySelector(".staff_id_demist");
staffIdDemistPost.value = sessionStorage.getItem("staff_id");
const changePasswordBtn = document.querySelector(".change-password");

fetch(
    "../InternalManager/GetAllDataPersonalInfoStaff/" +
        sessionStorage.getItem("account_id")+"/"+sessionStorage.getItem("staff_id")
)
    .then((response) => response.json())
    .then((values) => {
        console.log(values.personalInfoStaff[0].staff_fullname);
    })
    .catch((error) => console.log("Error: ", error));

const modal = document.querySelector(".modal");
const closeIconChangePassword = document.querySelector("#closeIconChangePassword");

const modalInnerChangePassword = document.querySelector(".modal-inner.modal-change-password");

changePasswordBtn.addEventListener("click", showModalChangePassword);
function hideModalChangePassword() {
    modal.classList.add("hide");
    modalInnerChangePassword.classList.add("hide");
    modalInnerInfo.classList.add("hide");
    refreshChangePasswordForm();
}
function showModalChangePassword() {
    modal.classList.remove("hide");
    modalInnerChangePassword.classList.remove("hide");
}
function hideModal() {
    modal.classList.add("hide");
    modalInnerChangePassword.classList.add("hide");
    modalInnerEdit.classList.add("hide");
    refreshChangePasswordForm();
    refreshEditForm();
}

closeIconChangePassword.addEventListener("click", hideModalChangePassword);
modal.addEventListener("click", hideModal);
modalInnerChangePassword.addEventListener("click", function (event) {
    event.stopPropagation();
});

const confirmChangePasswordBtn = document.getElementById("confirmBtnChangePassword");
const formChangePassword = document.querySelector(".modal-change-password .modal-body");
const refreshChangePasswordBtn = document.querySelector(".modal-change-password .reset-btn");

/* refresh edit-form */
const newPasswordForm = document.querySelector(".new_password_form");
const newPasswordWarning = document.querySelector(
    ".new-password-warning"
);
function refreshChangePasswordForm() {
    oldPasswordForm.value = "";
    confirmPasswordForm.value = "";
    newPasswordForm.value = "";
    confirmPasswordForm.style.backgroundColor = "#ddd";
    oldPasswordWarning.style.opacity = "0";
    newPasswordWarning.style.opacity = "0";
    confirmPasswordWarning.style.opacity = "0";
}
refreshChangePasswordBtn.addEventListener("click", refreshChangePasswordForm);
var isOldPasswordValid = true;
var isNewPasswordValid = true;
var isConfirmPasswordValid = true;

const oldPasswordForm = document.querySelector(".old_password_form");
const oldPasswordWarning = document.querySelector(
    ".old-password-warning"
);

var oldPasswordValue = "";
oldPasswordForm.addEventListener("keyup", function (e) {
    oldPasswordValue = e.target.value;
    fetch(
        "../Account/GetAccountById/" +
            sessionStorage.getItem("account_id")
    )
        .then((response) => response.json())
        .then((values) => {
            if(oldPasswordValue !== ""){
                if(oldPasswordValue === values.password){
                    oldPasswordWarning.style.opacity = "0";
                    isOldPasswordValid = true;
                }else{
                    oldPasswordWarning.style.opacity = "1";
                    isOldPasswordValid = false;
                }
            }else{
                oldPasswordWarning.style.opacity = "0";
            }    
        })
        .catch((error) => console.log("Error: ", error));
    confirmChangePasswordBtn.disabled = !(
        isConfirmPasswordValid &&
        isOldPasswordValid &&
        isNewPasswordValid
    );
});
var newPasswordValue = "";
newPasswordForm.addEventListener("keyup", function (e) {
    const checkLetter = /[a-zA-Z]/;
    const checkNumber = /[0-9]/;
    const checkSpecialCharacter = /[^a-zA-Z0-9]/;
    newPasswordValue = e.target.value;
    if(newPasswordValue === ""){
        newPasswordWarning.style.opacity = "0";
    }else{
        if (
            checkSpecialCharacter.test(newPasswordValue) &&
            checkLetter.test(newPasswordValue) &&
            checkNumber.test(newPasswordValue) &&
            this.value.length > 6
        ) {
            newPasswordWarning.style.opacity = "0";
            isNewPasswordValid = true;
        } else {
            newPasswordWarning.style.opacity = "1";
            newPasswordWarning.textContent =
                "Phải có 7 ký tự, có chữ thường, chữ hoa, số và ký tự đặc biệt";
            isNewPasswordValid = false;
        }
    }
    
    confirmChangePasswordBtn.disabled = !(
        isConfirmPasswordValid &&
        isOldPasswordValid &&
        isNewPasswordValid
    );
});

const confirmPasswordForm = document.querySelector(".confirm_password_form");
const confirmPasswordWarning = document.querySelector(
    ".confirm-password-warning"
);
confirmPasswordForm.addEventListener("keyup", function () {
    var confirmPassword = this.value;
    if(confirmPassword == ""){
        confirmPasswordWarning.style.opacity = "0";
    }else{
        if (confirmPassword != newPasswordValue) {
            confirmPasswordWarning.textContent = "Mật khẩu không khớp";
            confirmPasswordWarning.style.opacity = "1";
            isConfirmPasswordValid = false;
        } else {
            confirmPasswordWarning.style.opacity = "0";
            isConfirmPasswordValid = true;
        }
    }
    
    confirmChangePasswordBtn.disabled = !(
        isConfirmPasswordValid &&
        isOldPasswordValid &&
        isNewPasswordValid
    );
});


const closeIconLeaveApplication = document.querySelector("#closeIconLeaveApplication");

const modalInnerLeaveApplication = document.querySelector(".modal-inner.modal-leave-application");
const confirmSubmitLeaveBtn = document.getElementById("confirmBtnLeaveSubmit");
const formLeaveApplication = document.querySelector(".modal-leave-application .modal-body");
function hideModalLeaveApplication() {
    modal.classList.add("hide");
    modalInnerLeaveApplication.classList.add("hide");
    startDateLeaveInput.value = "";
    endDateLeaveInput.value = "";
}
function showModalLeaveApplication() {
    modal.classList.remove("hide");
    modalInnerLeaveApplication.classList.remove("hide");
}
closeIconLeaveApplication.addEventListener("click", hideModalLeaveApplication);
modalInnerLeaveApplication.addEventListener("click", function (event) {
    event.stopPropagation();
});
const leaveBtn = document.querySelector(".leave");
leaveBtn.addEventListener("click", showModalLeaveApplication);

var tomorrow = new Date();
tomorrow.setDate(tomorrow.getDate() + 1); // Thêm 1 ngày vào ngày hiện tại
var dd = String(tomorrow.getDate()).padStart(2, '0');
var mm = String(tomorrow.getMonth() + 1).padStart(2, '0'); // Lưu ý: getMonth() trả về từ 0 (tháng 1) đến 11 (tháng 12)
var yyyy = tomorrow.getFullYear();

tomorrow = yyyy + '-' + mm + '-' + dd;
document.getElementById("leave-start-date").setAttribute("min", tomorrow);
document.getElementById("leave-end-date").setAttribute("min", tomorrow);
var startDateLeaveInput = document.getElementById("leave-start-date");
var endDateLeaveInput = document.getElementById("leave-end-date");

// Cập nhật giá trị tối thiểu của end-date mỗi khi start-date thay đổi
startDateLeaveInput.addEventListener("change", function(){
    endDateLeaveInput.min = startDateLeaveInput.value;
});
endDateLeaveInput.addEventListener("change", function(){
    startDateLeaveInput.max = endDateLeaveInput.value;
});

const closeIconDemistApplication = document.querySelector("#closeIconDemistApplication");

const modalInnerDemistApplication = document.querySelector(".modal-inner.modal-demist-application");
const confirmSubmitDemistBtn = document.getElementById("confirmBtnDemistSubmit");
const formDemistApplication = document.querySelector(".modal-demist-application .modal-body");
function hideModalDemistApplication() {
    modal.classList.add("hide");
    modalInnerDemistApplication.classList.add("hide");
}
function showModalDemistApplication() {
    modal.classList.remove("hide");
    modalInnerDemistApplication.classList.remove("hide");
}
closeIconDemistApplication.addEventListener("click", hideModalDemistApplication);
modalInnerDemistApplication.addEventListener("click", function (event) {
    event.stopPropagation();
});
const demistBtn = document.querySelector(".retire");
demistBtn.addEventListener("click", showModalDemistApplication);

document.getElementById("demist-start-date").setAttribute("min", tomorrow);



const closeIconSickApplication = document.querySelector("#closeIconSickApplication");

const modalInnerSickApplication = document.querySelector(".modal-inner.modal-sick-application");
const confirmSubmitSickBtn = document.getElementById("confirmBtnSickSubmit");
const formSickApplication = document.querySelector(".modal-sick-application .modal-body");
function hideModalSickApplication() {
    modal.classList.add("hide");
    modalInnerSickApplication.classList.add("hide");
}
function showModalSickApplication() {
    modal.classList.remove("hide");
    modalInnerSickApplication.classList.remove("hide");
}
closeIconSickApplication.addEventListener("click", hideModalSickApplication);
modalInnerSickApplication.addEventListener("click", function (event) {
    event.stopPropagation();
});
const sickBtn = document.querySelector(".sick");
sickBtn.addEventListener("click", showModalSickApplication);


document.getElementById("sick-start-date").setAttribute("min", tomorrow);
document.getElementById("sick-end-date").setAttribute("min", tomorrow);
var startDateSickInput = document.getElementById("sick-start-date");
var endDateSickInput = document.getElementById("sick-end-date");

// Cập nhật giá trị tối thiểu của end-date mỗi khi start-date thay đổi
startDateSickInput.addEventListener("change", function(){
    endDateSickInput.min = startDateSickInput.value;
});
const closeIconInfo = document.querySelector("#closeIconInfo");
const closeBtnInfo = document.querySelector("#closeBtnInfo");
const modalInnerInfo = document.querySelector(".modal-inner.modal-info");
const contentModalInfo = document.querySelector(".content-info");
function hideModalInfo() {
    modal.classList.add("hide");
    modalInnerInfo.classList.add("hide");
}
function showModalInfo() {
    modal.classList.remove("hide");
    modalInnerInfo.classList.remove("hide");
}
closeIconInfo.addEventListener("click", hideModalInfo);
closeBtnInfo.addEventListener("click", hideModalInfo);
modalInnerInfo.addEventListener("click", function (event) {
    event.stopPropagation();
});
document.querySelector(".personal-info").addEventListener("click", showModalInfo);
var rowFullname = document.querySelector(".row-data.row-fullname");
var rowRole = document.querySelector(".row-data.row-role");
var rowStaffId = document.querySelector(".row-data.row-staff-id");
var rowAccountId = document.querySelector(".row-data.row-account-id");
var rowGender = document.querySelector(".row-data.row-gender");
var rowAddress = document.querySelector(".row-data.row-address");
var rowEntryDate = document.querySelector(".row-data.row-entry-date");
var rowPhoneNumber = document.querySelector(".row-data.row-phone-number");
var rowEmail = document.querySelector(".row-data.row-email");
var rowCreatedAt = document.querySelector(".row-data.row-created-at");
var rowUpdatedAt = document.querySelector(".row-data.row-updated-at");
var avatarImage = document.querySelector(".modal-info .avatar-section .avatar-image");
fetch("../InternalManager/GetAllDataPersonalInfoStaff/"+sessionStorage.getItem("account_id")+"/"+sessionStorage.getItem("staff_id"))
    .then((response) => response.json())
    .then((values) => {
        values.personalInfoStaff.forEach((value) => {
            rowFullname.textContent = value.staff_fullname;
            rowRole.textContent = value.role_name;
            rowStaffId.textContent = value.staff_id;
            rowAccountId.textContent = value.account_id;
            if(value.gender == 0){
                rowGender.textContent = "Nam";
            }else{
                rowGender.textContent = "Nữ";
            }
            rowAddress.textContent = value.address;
            var date = new Date(value.entry_date);
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();
            if (day < 10) day = "0" + day;
            if (month < 10) month = "0" + month;
            var formattedDate = day + "/" + month + "/" + year;
            rowEntryDate.textContent = formattedDate;
            rowPhoneNumber.textContent = value.phone_number;
            rowEmail.textContent = value.email;
            rowCreatedAt.textContent = value.created_at;
            rowUpdatedAt.textContent = value.updated_at;
            avatarImage.setAttribute("src", "../Public/img/staffAvatar/"+value.avatar);
        });
    })
    .catch((error) => console.log("Error: ", error));



document.querySelector(".edit-personal-info").addEventListener("click", showModalEdit);
const closeIconEdit = document.querySelector("#closeIconEdit");
const modalInnerEdit = document.querySelector(".modal-inner.modal-edit");
const contentModalEdit = document.querySelector(".content-edit");
function hideModalEdit() {
    modal.classList.add("hide");
    modalInnerEdit.classList.add("hide");
}

function showModalEdit() {
    modal.classList.remove("hide");
    modalInnerEdit.classList.remove("hide");
    fetch("../InternalManager/GetAllDataStaff")
    .then((response) => response.json())
    .then((values) => {
        values.infoStaff.forEach((staff) => {
        if (staff.staff_id == staffId) {
            fullnameEditForm.value = staff.staff_fullname;
            phoneNumberEditForm.value = staff.phone_number;
            emailEditForm.value = staff.email;
            if (staff.gender == 0) {
                genderEditForm.selectedIndex = 1;
            } else if (staff.gender == 1) {
                genderEditForm.selectedIndex = 2;
            }
            addressEditForm.value = staff.address;

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
                        isGenderEditValid
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
                        isGenderEditValid
                    );
                };
                xhr.send("phone_number=" + phone_number);
            });
        }
        });
    })
    .catch((error) => console.log("Error: ", error));
}
closeIconEdit.addEventListener("click", hideModalEdit);
modalInnerEdit.addEventListener("click", function (event) {
    event.stopPropagation();
});
const confirmEditBtn = document.getElementById("confirmBtnEdit");
const refreshEditBtn = document.querySelector(".modal-edit .reset-btn");
const addressEditForm = document.querySelector(".address-edit-form");
function refreshEditForm() {
    fullnameEditForm.value = "";
    phoneNumberEditForm.value = "";
    emailEditForm.value = "";
    genderEditForm.selectedIndex = 0;
    addressEditForm.value = "";
    emailEditForm.style.backgroundColor = "#ddd";
    phoneNumberEditForm.style.backgroundColor = "#ddd";
    avatarEditForm.value = "";
}
refreshEditBtn.addEventListener("click", refreshEditForm);
var isFullnameEditValid = true;
var isGenderEditValid = true;
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
        isGenderEditValid
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
        isGenderEditValid
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

const avatarEditForm = document.querySelector(".avatar-edit-form");
const editAvatarWarning = document.querySelector(".edit-avatar-warning");
avatarEditForm.addEventListener("change", function (event) {
    const regex = /\.(png|jpg|jpeg)$/i;
    var selectedFile = event.target.files[0];
    if (!regex.test(selectedFile.name)) {
        editAvatarWarning.style.opacity = "1";
        isAvatarEditValid = false;
    } else {
        editAvatarWarning.style.opacity = "0";
        isAvatarEditValid = true;
    }
    confirmEditBtn.disabled = !(
        isPhoneNumberEditValid &&
        isEmailEditValid &&
        isFullnameEditValid &&
        isGenderEditValid
    );
});

var staffId = sessionStorage.getItem("staff_id");
fetch("../InternalManager/GetAllDataStaff")
    .then((response) => response.json())
    .then((values) => {
        values.infoStaff.forEach((staff) => {
        if (staff.staff_id == staffId) {
            fullnameEditForm.value = staff.staff_fullname;
            phoneNumberEditForm.value = staff.phone_number;
            emailEditForm.value = staff.email;
            if (staff.gender == 0) {
                genderEditForm.selectedIndex = 1;
            } else if (staff.gender == 1) {
                genderEditForm.selectedIndex = 2;
            }
            addressEditForm.value = staff.address;

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
                        isGenderEditValid
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
                        isGenderEditValid
                    );
                };
                xhr.send("phone_number=" + phone_number);
            });
        }
        });
    })
    .catch((error) => console.log("Error: ", error));