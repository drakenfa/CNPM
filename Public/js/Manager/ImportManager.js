const startDateFilter = document.querySelector("#start-date");
const endDateFilter = document.querySelector("#end-date");
const searchFilter = document.querySelector("#search-filter");
var i = 0;

const tbody = document.querySelector(".details table tbody");
const tbody1 = document.querySelector(".staff-table1 tbody");

const btnAdd = document.querySelector(".add-btn");
btnAdd.addEventListener("click", showModalAdd);

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
const supFilter = document.querySelector("#supplier-filter");
const cateFilter = document.querySelector("#category-filter");
const brandFilter = document.querySelector("#brand-filter");
const productFilter = document.querySelector("#product-filter");
const skuFilter = document.querySelector("#sku-filter");
const skuname = document.querySelector("#skuname");
document.getElementById('price').addEventListener('input', function() {
    // Loại bỏ bất kỳ ký tự không phải là số không âm từ giá trị nhập vào
    this.value = this.value.replace(/[^0-9]/g, '');
});

// Lắng nghe sự kiện input trên trường input với id="number"
document.getElementById('number').addEventListener('input', function() {
    // Loại bỏ bất kỳ ký tự không phải là số không âm từ giá trị nhập vào
    this.value = this.value.replace(/[^0-9]/g, '');
});
fetch("../InternalManager/GetAllDataImport")
    .then((response) => response.json())
    .then((values) => {

        // Table
        values.suppliers.forEach((suppliers) => {
            var option = document.createElement("option");
            option.value = suppliers.supplier_id;
            option.text = suppliers.supplier_name;
            supFilter.appendChild(option); // gán giá trị các role vào combobox
        });
        values.categories.forEach((categories) => {
            var option = document.createElement("option");
            option.value = categories.category_id;
            option.text = categories.category_name;
            cateFilter.appendChild(option); // gán giá trị các role vào combobox
        });
        //var existingOrderIds = [];
        values.infoImport.forEach((exports) => {
            // Kiểm tra nếu order_id đã tồn tại trong mảng existingOrderIds
                var row = tbody.insertRow();
        
                var exportIdCell = row.insertCell();
                exportIdCell.textContent = exports.import_id; // In ra order_id

                var staffIdCell = row.insertCell();
                staffIdCell.textContent = exports.staff_id; // In ra order_id

        
                // Thêm order_id vào mảng existingOrderIds sau khi đã in ra
                //existingOrderIds.push(order.order_id);
        
                var orderDateCell = row.insertCell();
                var date = new Date(exports.import_date);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                if (day < 10) day = "0" + day;
                if (month < 10) month = "0" + month;
                var formattedDate = day + "/" + month + "/" + year;
                orderDateCell.textContent = formattedDate; // format lại ngày
        

                var operation = row.insertCell();
                var btns = `<div class="btns">
                <button class="info" id="info-${exports.import_id}" title="Xem chi tiết phiếu nhập"><i class="fi fi-rr-info"></i></button>
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
 
                console.log("ID=" +orderId);
                var addedSKUs = {};

                values.shipments.forEach((exports) => {
                    // Nếu sku_id chưa tồn tại trong addedSKUs hoặc đã tồn tại nhưng chưa được thêm vào tbody1
                    if (exports.import_id == orderId) {
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
                        exdIdCell.textContent = exports.shipment_id;
                        
                        var exIdCell = row.insertCell();
                        exIdCell.textContent = exports.import_id;
                        
                        var shipmentIdCell = row.insertCell();
                        shipmentIdCell.textContent = exports.sku_id;

                        var suppliersIdCell = row.insertCell();
                        suppliersIdCell.textContent = exports.supplier_id;
                        // Tạo và thêm ô Số lượng vào dòng mới
                
                        // Tạo và thêm ô Đơn giá vào dòng mới
                        // Trước khi gán giá trị vào ô giá cả
                        var priceCell = row.insertCell();
                        var formattedPrice = parseFloat(exports.unit_price_import).toFixed(0); // Làm tròn số và loại bỏ các số sau dấu thập phân
                        priceCell.textContent = formattedPrice + " đ"; // Thêm đơn vị tiền tệ

                        var numberCell = row.insertCell();
                        numberCell.textContent = exports.quantity;

                        var numberCell2 = row.insertCell();
                        numberCell2.textContent = exports.remain;
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
const modalInnerAdd = document.querySelector(".modal-inner.modal-info");

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


    // Check if .staff-table2 tbody is empty
    var tbody = document.querySelector('.staff-table2 tbody');
    if (tbody.children.length === 0) {
        alert("Chưa có sản phẩm để nhập");
    }else{
        modal.classList.remove("hide");
        modalInnerDelete.classList.remove("hide");
        modalInnerAdd.classList.add("hide");
    }
}
function hideModalInfo() {
    modal.classList.add("hide");
    modalInnerInfo.classList.add("hide");
}
function showModalInfo() {
    modal.classList.remove("hide");
    modalInnerInfo.classList.remove("hide");
    modalInnerAdd.classList.add("hide");
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
    modalInnerInfo.classList.add("hide");

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
// closeBtnDelete.addEventListener("click", hideModal);
// closeIconInfo1.addEventListener("click", hideModal1);
closeIconInfo2.addEventListener("click", hideModal2);
closeBtnInfo.addEventListener("click", hideModal2);
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

        var importdateTd = trs[i].getElementsByTagName("td")[2];


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
nextPageBtn.addEventListener('click', () => {
    modals[0].classList.add('hide');
    modals[1].classList.remove('hide');
});
downPagebtn.addEventListener('click', () => {
    modals[1].classList.add('hide');
    modals[0].classList.remove('hide');
});
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


// Lắng nghe sự kiện khi combo box thay đổi
document.getElementById('supplier-filter').addEventListener('change', function() {
    // Lấy giá trị của combo box
    var selectedValue = this.value;

    // Kiểm tra nếu giá trị đã được chọn là "Chọn nhà cung cấp"
    if (selectedValue === "Chọn nhà cung cấp") {
        // Reset tất cả các combo box đằng sau bằng cách gán giá trị mặc định cho chúng
        document.getElementById('category-filter').value = "Chọn loại hàng";
        // document.getElementById('brand-filter').value = "Chọn hãng";
        brandFilter.innerHTML = '<option value="Chọn hãng">Chọn hãng</option>';
        document.getElementById('product-filter').value = "Chọn sản phẩm";
        document.getElementById('sku-filter').value = "Chọn màu";

        // Disable tất cả các combo box đằng sau
        document.getElementById('category-filter').disabled = true;
        document.getElementById('brand-filter').disabled = true;
        document.getElementById('product-filter').disabled = true;
        document.getElementById('sku-filter').disabled = true;
        skuname.value="";
    } else {
        // Nếu giá trị được chọn khác "Chọn nhà cung cấp", kích hoạt tất cả các combo box đằng sau và xóa giá trị mặc định của chúng
        console.log()
        document.getElementById('category-filter').value = "Chọn loại hàng";
        document.getElementById('sku-filter').value = "Chọn màu";
        // document.getElementById('brand-filter').value = "Chọn hãng";
        brandFilter.innerHTML = '<option value="Chọn hãng">Chọn hãng</option>';
        fetch("../InternalManager/GetAllDataImport")
        .then((response) => response.json())
        .then((values) => {
            values.brands.forEach((brands) => {
                if (brands.supplier_id === selectedValue) {
                    var option = document.createElement("option");
                    option.value = brands.brand_id;
                    option.text = brands.brand_name;
                    brandFilter.appendChild(option);
                }
            });
            })
        .catch((error) => console.log("Error: ", error));

        document.getElementById('product-filter').value = "Chọn sản phẩm";

        // Enable tất cả các combo box đằng sau
        document.getElementById('category-filter').disabled = false;
        document.getElementById('brand-filter').disabled = true;
        document.getElementById('product-filter').disabled = true;
        document.getElementById('sku-filter').disabled = false;
        skuname.value="";

    }
});
document.getElementById('category-filter').addEventListener('change', function() {
    // Lấy giá trị của combo box
    var selectedValue = this.value;

    // Kiểm tra nếu giá trị đã được chọn là "Chọn nhà cung cấp"
    if (selectedValue === "Chọn loại hàng") {
        // Reset tất cả các combo box đằng sau bằng cách gán giá trị mặc định cho chúng
        document.getElementById('brand-filter').value = "Chọn hãng";
        document.getElementById('product-filter').value = "Chọn sản phẩm";
        document.getElementById('sku-filter').value = "Chọn màu";

        // Disable tất cả các combo box đằng sau
        document.getElementById('brand-filter').disabled = true;
        document.getElementById('product-filter').disabled = true;
        document.getElementById('sku-filter').disabled = true;
        skuname.value="";

    } else {
        // Nếu giá trị được chọn khác "Chọn nhà cung cấp", kích hoạt tất cả các combo box đằng sau và xóa giá trị mặc định của chúng
        document.getElementById('brand-filter').value = "Chọn hãng";
        document.getElementById('product-filter').value = "Chọn sản phẩm";
        document.getElementById('sku-filter').value = "Chọn màu";
        
        // Enable tất cả các combo box đằng sau
        document.getElementById('brand-filter').disabled = false;
        document.getElementById('product-filter').disabled = true;
        document.getElementById('sku-filter').disabled = true;
        skuname.value="";


    }
});
document.getElementById('brand-filter').addEventListener('change', function() {
    // Lấy giá trị của combo box
    var selectedValue = this.value;
    var selectedValue2 = document.getElementById('category-filter').value;
        // Kiểm tra nếu giá trị đã được chọn là "Chọn nhà cung cấp"
    if (selectedValue === "Chọn hãng") {
        // Reset tất cả các combo box đằng sau bằng cách gán giá trị mặc định cho chúng
        document.getElementById('product-filter').value = "Chọn sản phẩm";
        document.getElementById('sku-filter').value = "Chọn màu";

        // Disable tất cả các combo box đằng sau
        document.getElementById('product-filter').disabled = true;
        document.getElementById('sku-filter').disabled = true;
        skuname.value="";

    } else {
        productFilter.innerHTML = '<option value="Chọn sản phẩm">Chọn sản phẩm</option>';
        // Nếu giá trị được chọn khác "Chọn nhà cung cấp", kích hoạt tất cả các combo box đằng sau và xóa giá trị mặc định của chúng
        fetch("../InternalManager/GetAllDataImport")
        .then((response) => response.json())
        .then((values) => {
            values.productSku.forEach((productSku) => {
                if (productSku.brand_id === selectedValue && productSku.category_id === selectedValue2) {
                    var option = document.createElement("option");
                    option.value = productSku.product_id;
                    option.text = productSku.product_name;
                    productFilter.appendChild(option);
                }
            });
            })
        .catch((error) => console.log("Error: ", error));
        // Enable tất cả các combo box đằng sau
        document.getElementById('product-filter').disabled = false;
        document.getElementById('sku-filter').value = "Chọn màu";
        skuname.value="";

        
    }
});
document.getElementById('product-filter').addEventListener('change', function() {
    // Lấy giá trị của combo box
    var selectedValue = this.value;
        // Kiểm tra nếu giá trị đã được chọn là "Chọn nhà cung cấp"
    if (selectedValue === "Chọn sản phẩm") {
        // Reset tất cả các combo box đằng sau bằng cách gán giá trị mặc định cho chúng
        document.getElementById('sku-filter').value = "Chọn màu";

        // Disable tất cả các combo box đằng sau
        document.getElementById('sku-filter').disabled = true;
        skuname.value="";

    } else {
        skuFilter.innerHTML = '<option value="Chọn màu">Chọn màu</option>';
        // Nếu giá trị được chọn khác "Chọn nhà cung cấp", kích hoạt tất cả các combo box đằng sau và xóa giá trị mặc định của chúng
        fetch("../InternalManager/GetAllDataImport")
        .then((response) => response.json())
        .then((values) => {
            values.skus.forEach((skus) => {
                if (skus.product_id === selectedValue ) {
                    var option = document.createElement("option");
                    option.value = skus.sku_id;
                    option.text = skus.sku_name;
                    skuFilter.appendChild(option);
                }
            });
            })
        .catch((error) => console.log("Error: ", error));
        // Enable tất cả các combo box đằng sau
        document.getElementById('sku-filter').disabled = false;
        skuname.value="";
    }
});
document.getElementById('sku-filter').addEventListener('change', function() {
    // Lấy giá trị của combo box
    var selectedValue = this.value;
        // Kiểm tra nếu giá trị đã được chọn là "Chọn nhà cung cấp"
    if (selectedValue === "Chọn màu") {
        skuname.value="";
    } else {
        // skuFilter.innerHTML = '<option value="Chọn màu">Chọn màu</option>';
        // Nếu giá trị được chọn khác "Chọn nhà cung cấp", kích hoạt tất cả các combo box đằng sau và xóa giá trị mặc định của chúng
        fetch("../InternalManager/GetAllDataImport")
        .then((response) => response.json())
        .then((values) => {
            values.skus.forEach((skus) => {
                if (skus.sku_id === selectedValue ) {
                    skuname.value = skus.sku_code + "("+"Mã sku ="+ skus.sku_id +")";                
                }
            });
            })
        .catch((error) => console.log("Error: ", error));
        // Enable tất cả các combo box đằng sau
        document.getElementById('sku-filter').disabled = false;
    }
});
function resetAndDisableComboBoxes() {
    // Reset và vô hiệu hóa combo box từ lúc load
    document.getElementById('supplier-filter').value = "Chọn nhà cung cấp";
    document.getElementById('category-filter').value = "Chọn loại hàng";
    document.getElementById('brand-filter').value = "Chọn hãng";
    document.getElementById('product-filter').value = "Chọn sản phẩm";
    document.getElementById('sku-filter').value = "Chọn màu";
    document.getElementById('skuname').value = "";
    document.getElementById('category-filter').disabled = true;
    document.getElementById('brand-filter').disabled = true;
    document.getElementById('product-filter').disabled = true;
    document.getElementById('sku-filter').disabled = true;
}

// Gọi hàm ngay sau khi trang được tải hoàn toàn
window.onload = resetAndDisableComboBoxes;
// Tương tự cho các combo box khác
// Lưu ý rằng bạn cần thêm lắng nghe sự kiện và xử lý tương tự cho từng combo box
// Đảm bảo rằng các id được sử dụng là duy nhất trong trang
// Lắng nghe sự kiện click trên nút "Thêm"
document.getElementById('add').addEventListener('click', function() {
    // Lấy giá trị từ các combo box và input fields
    var skuValue = document.getElementById('sku-filter').value;
    var supplierValue = document.getElementById('supplier-filter').value;
    var priceValue = document.getElementById('price').value;
    var numberValue = document.getElementById('number').value;

    // Kiểm tra nếu giá trị của combo box là mặc định hoặc giá trị của price hoặc number là rỗng
    if (supplierValue === "Chọn nhà cung cấp" || skuValue === "Chọn màu" || priceValue === "" || numberValue === "") {
        // Xuất thông báo ra console
        console.log("Vui lòng điền đầy đủ thông tin và chọn nhà cung cấp và màu sắc.");
        alert("Điền đầy đủ thông tin");
        return; // Dừng hàm và không thêm vào bảng
    }
    if (priceValue === "0" || numberValue === "0") {
        // Xuất thông báo ra console
        console.log("Số lượng và giá phải > 0");
        alert("Số lượng và giá >0");
        return; // Dừng hàm và không thêm vào bảng
    }

    // Kiểm tra nếu đã tồn tại sản phẩm với SKU tương tự trong bảng
    var table = document.querySelector('.staff-table2 tbody');
    var isExist = Array.from(table.querySelectorAll('tr')).some(function(row) {
        return row.cells[1].textContent === skuValue;
    });

    if (isExist) {
        // Hiển thị thông báo nếu đã tồn tại sản phẩm với SKU tương tự
        console.log("Sản phẩm với SKU tương tự đã tồn tại trong bảng.");
        alert("Sản phẩm đã tồn tại trong phiếu nhập");
    } else {
        // Nếu không có sản phẩm nào có SKU tương tự và giá trị combo box và input không rỗng, thêm một dòng mới vào bảng
        var newRow = table.insertRow(-1);
        var cellIndex = newRow.insertCell(0);
        var cellSku = newRow.insertCell(1);
        var cellSupplier = newRow.insertCell(2);
        var cellPrice = newRow.insertCell(3);
        var cellNumber = newRow.insertCell(4);

        // Tăng biến đếm i lên 1
        i++;

        // Gán id theo thứ tự tăng dần, bắt đầu từ 1
        cellIndex.setAttribute("id", "stt-" + i);
        cellSku.setAttribute("id", "skus-" + i);
        cellSupplier.setAttribute("id", "suppliers-" + i);
        cellPrice.setAttribute("id", "price-" + i);
        cellNumber.setAttribute("id", "number-" + i);

        // Gán giá trị cho các ô
        cellIndex.textContent = table.rows.length;
        cellSku.textContent = skuValue;
        cellSupplier.textContent = supplierValue;
        cellPrice.textContent = priceValue;
        cellNumber.textContent = numberValue;

        // Đặt lại và vô hiệu hóa các combo box
        resetAndDisableComboBoxes();
        document.getElementById('price').value = "";
        document.getElementById('number').value = "";
        alert("Đã thêm sản phẩm vào phiếu nhập");
    }
});

// const createbtn = document.getElementById('create');
const createBtn = document.querySelector('.create');
createBtn.addEventListener("click", function () {
    var shipments = document.querySelectorAll('[id^="skus-"]');
    var importData = {}; // Object to hold import data
    var shipmentData = {}; // Object to hold shipment data

    // Assuming there's only one import ID for all shipments
    importData.staff_id = "4"; // Assuming staff_id is always 4

    // Populate shipmentData object dynamically based on the number of shipments
    var numShipments = shipments.length;
    for (var i = 1; i <= numShipments; i++) {
        var skuValue = document.getElementById('skus-' + i).innerText;
        var supplierValue = document.getElementById('suppliers-' + i).innerText;
        var priceValue = document.getElementById('price-' + i).innerText;
        var numberValue = document.getElementById('number-' + i).innerText;

        shipmentData['shipmentData' + i] = {
            skuValue: skuValue,
            supplierValue: supplierValue,
            priceValue: priceValue,
            numberValue: numberValue
        };
    }

    // Construct the URL
    var baseUrl = '../Import/CreateShipment/' + numShipments;
    var urlParams = new URLSearchParams();

    // Add importData to URL parameters
    urlParams.append('importData', JSON.stringify(importData));

    // Add shipmentData to URL parameters
    for (var key in shipmentData) {
        urlParams.append(key, JSON.stringify(shipmentData[key]));
    }

    // Combine base URL and URL parameters
    var url = baseUrl + '?' + urlParams.toString();

    // Set the constructed URL as the href attribute of deleteA element
    deleteA.setAttribute("href", url);
    showModalDelete();
});

document.addEventListener("DOMContentLoaded", function () {
    // Find the reset1 button
    var reset1Btn = document.querySelector('.reset1-btn');

    // Attach click event listener to the reset1 button
    reset1Btn.addEventListener("click", function () {
        // Find the tbody element inside the staff-table2
        var tbody = document.querySelector('.staff-table2 tbody');

        // Clear the tbody by removing all its child nodes
        while (tbody.firstChild) {
            tbody.removeChild(tbody.firstChild);
        }
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