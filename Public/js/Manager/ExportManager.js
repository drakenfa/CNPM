


const startDateFilter = document.querySelector("#start-date");
const endDateFilter = document.querySelector("#end-date");
const searchFilter = document.querySelector("#search-filter");

const tbody = document.querySelector(".details table tbody");
const tbody1 = document.querySelector(".staff-table1 tbody");

const accountIdPost = document.querySelector(".modal-edit .modal-footer .account_id");
const staffIdPost = document.querySelector(".modal-edit .modal-footer .staff_id");

var rowExportId = document.querySelector(".row-data.row-export-id");
var rowOrderId = document.querySelector(".row-data.row-order-id");
var rowStaffId = document.querySelector(".row-data.row-staff-id");
var rowAccountId = document.querySelector(".row-data.row-account-id");
var rowReceiverName = document.querySelector(".row-data.row-receiver-name");
var rowEmail = document.querySelector(".row-data.row-email-of-receiver");
var rowPhoneNumber = document.querySelector(".row-data.row-phone-number-of-receiver");
var rowAddress = document.querySelector(".row-data.row-shipping-address");
var rowOrderDate = document.querySelector(".row-data.row-order-date");
var rowShippingDate = document.querySelector(".row-data.row-shipping-date");
var rowTrackingNumber = document.querySelector(".row-data.row-tracking-number");
var rowPaymentMethod = document.querySelector(".row-data.row-payment-method");
var rowStatus = document.querySelector(".row-data.row-status-of-order");
var rowNote = document.querySelector(".row-data.row-note");
var rowSku= document.querySelector(".row-data.row-sku-id");
var rowSku1=document.querySelector(".row-data.row-sku-id2");
let addedRows = [];
fetch("../InternalManager/GetAllDataExport")
    .then((response) => response.json())
    .then((values) => {

        // Table
        //var existingOrderIds = [];
        values.infoExport.forEach((exports) => {
            // Kiểm tra nếu order_id đã tồn tại trong mảng existingOrderIds
                var row = tbody.insertRow();
        
                var exportIdCell = row.insertCell();
                exportIdCell.textContent = exports.export_id; // In ra order_id

                var staffIdCell = row.insertCell();
                staffIdCell.textContent = exports.staff_id; // In ra order_id

                var orderIdCell = row.insertCell();
                orderIdCell.textContent = exports.order_id; // In ra order_id
        
                // Thêm order_id vào mảng existingOrderIds sau khi đã in ra
                //existingOrderIds.push(order.order_id);
        
                var orderDateCell = row.insertCell();
                var date = new Date(exports.export_date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (day < 10) day = "0" + day;
                if (month < 10) month = "0" + month;
                var formattedDate = day + "/" + month + "/" + year;
                orderDateCell.textContent = formattedDate; // format lại ngày
        
                var ordertotalCell = row.insertCell();
                ordertotalCell.textContent = exports.total_price;

                var operation = row.insertCell();
                var btns = `<div class="btns">
                <button class="info" id="info-${exports.export_id}" title="Xem chi tiết đơn hàng"><i class="fi fi-rr-info"></i></button>
                `;  
                operation.insertAdjacentHTML("beforeend", btns);
        
                tbody.appendChild(row);
            }
        );
        
        

        // Gắn sự kiện click cho container cha (ví dụ: tbody)
        tbody.addEventListener("click", function (event) {
            var clickedElement = event.target;
            var deleteBtn = clickedElement.closest(".delete");
            var infoBtn = clickedElement.closest(".info");
            // var detailBtn = cliclkedElement.closet("")
            var editBtn = clickedElement.closest(".edit");
            if (deleteBtn) {
                var order_id = deleteBtn.id.split("-")[1];
                console.log(order_id);
                // Lưu trữ order_id ban đầu vào một biến khác
                var original_order_id = order_id;
                // Thiết lập thuộc tính href của deleteA với order_id ban đầu
                deleteA.setAttribute(
                    "href",
                    "../Order/CancelledOrder/" + original_order_id
                );
                // Hiển thị modal với nội dung tương ứng
                contentModalDelete.textContent = "Bạn có chắc là muốn hủy đơn hàng " ;
                showModalDelete();
            }
            
            if (infoBtn) {
                var orderId = infoBtn.id.split("-")[1];
                console.log(infoBtn.id.split('-'));
 
                
                var addedSKUs = {};

                values.exportsdetails.forEach((exports) => {
                    // Nếu sku_id chưa tồn tại trong addedSKUs hoặc đã tồn tại nhưng chưa được thêm vào tbody1
                    if (exports.export_id == orderId) {
                    if (!addedSKUs.hasOwnProperty(exports.shipment_id) || !addedSKUs[exports.shipment_id]) {
                        // Đánh dấu sku_id này đã được thêm vào
                        addedSKUs[exports.shipment_id] = true;
                
                        // Tạo và thêm dòng mới vào tbody1
                        var row = tbody1.insertRow();
                
                        // Tạo và thêm ô STT vào dòng mới
                        var sttCell = row.insertCell();
                        sttCell.textContent = Object.keys(addedSKUs).length; // Số thứ tự tự động tăng
                
                        // Tạo và thêm ô SKU ID vào dòng mới
                        var exdIdCell = row.insertCell();
                        exdIdCell.textContent = exports.export_detail_id;
                        
                        var exIdCell = row.insertCell();
                        exIdCell.textContent = exports.export_id;
                        var shipmentIdCell = row.insertCell();
                        shipmentIdCell.textContent = exports.shipment_id;
                        // Tạo và thêm ô Số lượng vào dòng mới
                
                        // Tạo và thêm ô Đơn giá vào dòng mới
                        // Trước khi gán giá trị vào ô giá cả
                        var priceCell = row.insertCell();
                        var formattedPrice = parseFloat(exports.unit_price_export).toFixed(0); // Làm tròn số và loại bỏ các số sau dấu thập phân
                        priceCell.textContent = formattedPrice + " đ"; // Thêm đơn vị tiền tệ

                        var numberCell = row.insertCell();
                        numberCell.textContent = exports.quantity_export;
                        // Tạo và thêm ô Màu vào dòng mới

                
                        // Thêm dòng mới vào tbody1
                        tbody1.appendChild(row);
                        addedRows.push(row);
                    }
                }});
                

                showModalInfo();
            }
            if (editBtn) {
                var order_id = editBtn.id.split("-")[1];
                console.log(order_id);
                // Lưu trữ order_id ban đầu vào một biến khác
                var original_order_id = order_id;
                // Thiết lập thuộc tính href của deleteA với order_id ban đầu
                deleteA.setAttribute(
                    "href",
                    "../Order/UpdateStatusOrder/" + original_order_id
                );
                // Hiển thị modal với nội dung tương ứng
                contentModalDelete.textContent = "Xác nhận đổi trạng thái đơn hàng ? " ;
                showModalDelete();
            }
        });
    })
    .catch((error) => console.log("Error: ", error));

const modal = document.querySelector(".modal");
const closeBtnDelete = document.querySelector("#closeBtnDelete");
const closeIconInfo = document.querySelector("#closeIconInfo");
const closeIconInfo1 = document.querySelector("#closeIconInfo1");
const closeIconInfo2 = document.querySelector("#closeIconInfo2");
const closeBtnInfo = document.querySelector("#closeBtnInfo");
// const closeIconEdit = document.querySelector("#closeIconEdit");
// const closeBtnEdit = document.querySelector("#closeBtnEdit");
const closeIconAdd = document.querySelector("#closeIconAdd");

const modalInnerDelete = document.querySelector(".modal-inner.modal-delete");
const modalInnerInfo = document.querySelector(".modal-inner.modal-details");
const modalOrderNote = document.querySelector(".modal-inner.modal-note");
// const modalOrderDetails = document.querySelector(".modal-inner.modal-details");
const modalInnerEdit = document.querySelector(".modal-inner.modal-edit");
const modalInnerAdd = document.querySelector(".modal-inner.modal-add");

const contentModalDelete = document.querySelector(".content-delete");
const contentModalInfo = document.querySelector(".content-info");
const contentModalEdit = document.querySelector(".content-edit");
const contentModalAdd = document.querySelector(".content-add");
const deleteA = document.querySelector(".modal-footer a");
const editB = document.querySelector(".modal-footer b");


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
    modalInnerInfo.classList.add("hide");
    // modalOrderDetails.classList.add("hide");
    addedRows.forEach(row => {
        row.remove();
    });
}
function hideModal1() {
    modal.classList.add("hide");
    modals[2].classList.add("hide");
    addedRows.forEach(row => {
        row.remove();
    });
}
function hideModal2() {
    modal.classList.add("hide");
    addedRows.forEach(row => {
        row.remove();
    });
}

closeIconInfo.addEventListener("click", hideModal);
// closeIconInfo1.addEventListener("click", hideModal1);
closeIconInfo2.addEventListener("click", hideModal2);
closeBtnInfo.addEventListener("click", hideModalInfo);
// closeIconEdit.addEventListener("click", hideModalEdit);
// closeBtnEdit.addEventListener("click", hideModalEdit);
// modal.addEventListener("click", hideModal);
modalInnerInfo.addEventListener("click", function (event) {
    event.stopPropagation();
});


const refreshBtn = document.querySelector(".reset-btn");


// refreshEditBtn.addEventListener("click", refreshEditForm);







function filterTable() {
    var trs = tbody.getElementsByTagName("tr");

    var startDateString = document.getElementById("start-date").value;
    var endDateString = document.getElementById("end-date").value;

    for (var i = 0; i < trs.length; i++) {

        var importdateTd = trs[i].getElementsByTagName("td")[3];


        if (
            importdateTd 
 
        ) {
            // nếu tồn tại thì thay đổi tránh crash



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
                var orderDateMatch =
                    compareStartDate(
                        importdateTd.textContent,
                        convertToDDMMYYYY(startDateString),
                        console.log(convertToDDMMYYYY(startDateString))

                    ) &&
                    compareEndDate(
                        importdateTd.textContent,
                        convertToDDMMYYYY(endDateString),
                        console.log(convertToDDMMYYYY(endDateString))
                    );
            } else {
                orderDateMatch = true;
            }
            trs[i].style.display =
                orderDateMatch
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

// JavaScript để điều khiển việc hiển thị các modal và nút đóng

// Lấy các phần tử DOM cần thiết
const closeBtns = document.querySelectorAll('.close');
const nextPageBtn = document.querySelector('.next-page-btn');
const downPagebtn =document.querySelector('.down-page-btn');
const downPagebtn1 =document.querySelector('.down-page-btn1');
const nextPageBtn1 = document.querySelector('.next-page-btn1');
const modals = document.querySelectorAll('.modal-inner');
let currentModalIndex = 1; // Biến để theo dõi modal hiện tại đang hiển thị
let currentModalIndex1 = 2; // Biến để theo dõi modal hiện tại đang hiển thị

// Thêm sự kiện click cho nút trang kế tiếp

closeBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // Ẩn tất cả các modal
        modals.forEach(modal => {
            modal.classList.add('hide');
        });
        // Đặt lại chỉ số của modal hiện tại về 0
        currentModalIndex = 0;
        hideModal();
    });
});


startDateFilter.onchange = filterTable;
endDateFilter.onchange = filterTable;
refreshBtn.addEventListener("click", function () {
    startDateFilter.value = "";
    endDateFilter.value = "";
    document.getElementById("start-date").max = null;
    document.getElementById("end-date").min = null;
});
refreshBtn.onclick = filterTable;