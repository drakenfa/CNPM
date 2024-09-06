var moduleArr = {
    0: "HomeManager",
    1: "AccountManager",
    2: "StaffManager",
    3: "CustomerManager",
    4: "ProductManager",
    5: "SupplierManager",
    6: "WarehouseManager",
    7: "ImportManager",
    8: "ExportManager",
    9: "OrderManager",
    10: "SalaryManager",
    11: "StatisticManager",
    12: "DecentralizationManager",
    13: "AdvertisementManager"
};
var moduleName = {
    1: "Tài khoản",
    2: "Nhân viên",
    3: "Khách hàng",
    4: "Sản phẩm",
    5: "Nhà cung cấp",
    6: "Kho",
    7: "Nhập hàng",
    8: "Xuất hàng",
    9: "Hóa đơn",
    10: "Lương",
    11: "Thống kê",
    12: "Phân quyền",
    13: "Quảng cáo"
};
var moduleIcon = {
    1: '<i class="fi fi-rr-circle-user"></i>',
    2: '<i class="fi fi-rr-users"></i>',
    3: '<i class="fi fi-rr-users-alt"></i>',
    4: '<i class="fi fi-rr-boxes"></i>',
    5: '<i class="fi fi-rr-supplier"></i>',
    6: '<i class="fi fi-rr-warehouse-alt"></i>',
    7: '<i class="fi fi-rr-truck-check"></i>',
    8: '<i class="fi fi-rr-point-of-sale-bill"></i>',
    9: '<i class="fi fi-rr-file-invoice-dollar"></i>',
    10: '<i class="fi fi-rr-payroll-calendar"></i>',
    11: '<i class="fi fi-rr-chart-histogram"></i>',
    12: '<i class="fi fi-rr-users-medical"></i>',
    13: '<i class="fi fi-rr-screen"></i>'
};
const customerBtn = document.querySelector(".customer-btn");
const productBtn = document.querySelector(".product-btn");
const internalManager = document.querySelector(".internal-manager");
const screenModule = document.querySelector(".screen");
const contentModule = document.querySelector(".content-module");

const ulInNavigation = document.querySelector(".navigation ul");
// account id va role id cua tai khoan dang dang nhap
const roleIdValue = document.querySelector(".user-info.role-id-value").id;
const accountIdValue = document.querySelector(".user-info .account-id-value").id;
// localStorage.setItem("personal_id",accountIdValue);

fetch("../Decentralization/GetAllModuleByRole/" + roleIdValue)
    .then((response) => response.json())
    .then((modules) => {
        modules.forEach((module, i) => {
            var moduleBtn = "";
            // if (i == 0) {
            //     // module trang chu khong tao trong db
            //     moduleBtn += `<li title='Trang chủ'>
            //     <a href="./HomeManager">
            //         <span class="icon"
            //             ><i class="fi fi-rr-home"></i>
            //         </span>
            //         <span class="title">Trang chủ</span>
            //     </a>
            //     </li>`;
            // }
            moduleBtn += `<li title='${moduleName[module.module_id]}'> 
                    <a href="./${moduleArr[module.module_id]}">
                        <span class="icon">${
                            moduleIcon[module.module_id] // Lay ra cac module
                        }</span>
                        <span class="title">${
                            moduleName[module.module_id]
                        }</span>
                    </a>
                </li>`;
            ulInNavigation.innerHTML += moduleBtn;
        });
        const liInNavigation = document.querySelectorAll(".navigation ul li");
        var liInNavigationArr = Array.from(liInNavigation);
        liInNavigationArr.forEach(function (liItem) {
            // Thêm sự kiện click cho mỗi phần tử li
            liItem.addEventListener("click", function () {
                // Xóa class 'active' khỏi tất cả các phần tử li
                liInNavigationArr.forEach(function (item) {
                    item.classList.remove("active");
                });
                this.classList.add("active");
            });
        });
    })
    .catch((error) => console.log("Error: ", error));

var toggle = document.querySelector(".toggle");
var navigation = document.querySelector(".navigation");
toggle.addEventListener("click", function () {
    navigation.classList.toggle("active");
    screenModule.classList.toggle("active");
});

var accountId = sessionStorage.getItem("account_id");
const userFullname = document.querySelector(
    ".topbar .user-info .user-fullname"
);
const userAvatar = document.querySelector(".topbar .user-info .user img");

fetch("../InternalManager/GetAllDataStaff")
    .then((response) => response.json())
    .then((values) => {
        values.infoStaff.forEach((staff) => {
            if (staff.account_id == accountIdValue) {
                userFullname.textContent = staff.staff_fullname;
                sessionStorage.setItem("staff_id", staff.staff_id);
                userAvatar.setAttribute(
                    "src",
                    "../Public/img/staffAvatar/" + staff.avatar
                );
            }
        });
    })
    .catch((error) => console.log("Error: ", error));
