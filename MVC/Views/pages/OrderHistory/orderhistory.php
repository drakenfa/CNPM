<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Techshop</title>
        <meta http-equiv="Cache-Control" content="max-age=3600, must-revalidate" />
        <link rel="stylesheet" href="../Public/css/components/header.css">
        <link rel="stylesheet" href="../Public/css/global/common.css">
        <link rel="stylesheet" href="../Public/css/Shopcart/Shopcart.css">
        <!-- <link rel="stylesheet" href="../Public/css/pages/Manager/OrderManager.css"> -->
        <link rel="stylesheet" href="../Public/css/Orderhistory/Orderhistory.css">
        <link rel="stylesheet" href="../Public/css/globals/globals.css">
        <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.2.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <?php require_once "./MVC/Views/blocks/header.php" ?>
        <div class="all">
            <div class="details">
                <div class="header">
                    Lịch sử đơn hàng
                </div>
                <div class="staff-table">
                    <div class="table-header">
                        <h2>Danh sách hóa đơn</h2>
                    </div>
                         <table>
                            <thead>
                                <tr>
                                    <td>Mã đơn</td>
                                    <td>Ngày đặt</td>
                                    <td>Tổng tiền</td>
                                    <td>Tracking Number</td>
                                    <td>Tình trạng</td>
                                    <td>Thao tác</td>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>       


<div class="modal hide">
    <!-- Xóa nhân viên -->
    <div class="modal-inner modal-delete hide">
        <div class="modal-header">
            <p>Hủy đơn hàng</p>
            <i class="fi fi-rr-cross-small" id="closeIconDelete"></i>
        </div>
        <div class="modal-body">
            <p class="content-delete"></p>
            <div class="modal-footer">
                <a href="" class="delete-a"><button class="confirm" id="confirmBtnDelete">Xác nhận</button></a>
                <button class="close" id="closeBtnDelete">Hủy</button>
            </div>
        </div>
    </div>
    <!-- Xem thông tin-->
    <div class="modal-inner modal-info hide">
        <div class="modal-header">
            <p>Chi tiết hóa đơn</p>
            <button class="next-page-btn">Trang kế tiếp (1/3)</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo"></i>
        </div>
        <div class="modal-body">
            <div class="info-section">
                <div class="row-section">
                    <label for="" class="row-name">Mã đơn</label>
                    <div class="row-data row-order-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã nhân viên</label>
                    <div class="row-data row-staff-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã tài khoản</label>
                    <div class="row-data row-account-id"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Họ tên người nhận</label>
                    <div class="row-data row-receiver-name"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Email người nhận</label>
                    <div class="row-data row-email-of-receiver"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Số điện thoại người nhận</label>
                    <div class="row-data row-phone-number-of-receiver"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Địa chỉ</label>
                    <div class="row-data row-shipping-address"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Ngày đặt</label>
                    <div class="row-data row-order-date"></div>
                </div>
                <div class="row-section" style="display: none;">
                    <label for="" class="row-name">Ngày ship</label>
                    <div class="row-data row-shipping-date"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Mã số</label>
                    <div class="row-data row-tracking-number"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Phương thức trả tiền</label>
                    <div class="row-data row-payment-method"></div>
                </div>
                <div class="row-section">
                    <label for="" class="row-name">Tình trạng</label>
                    <div class="row-data row-status-of-order"></div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="close" id="closeBtnInfo">Đóng</button>
        </div>
    </div>
    <div class="modal-inner modal-note hide">
        <div class="modal-header">
            <p>Note</p>
            <button class="down-page-btn">Trang trước</button>
            <button >(2/3)</button>
            <button class="next-page-btn1">Trang kế tiếp</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo1"></i>
        </div>
        <div class="modal-body">
            <div class="note">
            <!-- Nội dung note -->
            <div class="row-section">
                    <div class="row-data row-note"></div>
                </div>
            </div>
            <!-- <div class="row-section">
                    <div class="row-data row-sku-id"></div>
                </div>
            </div> -->
        </div>
        <div class="modal-footer">
            <button class="close close-btn">Đóng</button>
        </div>
    </div>
    <div class="modal-inner modal-details hide">
        <div class="modal-header">
            <p>Details</p>
            <button class="down-page-btn1">Trang trước (3/3)</button>
            <i class="fi fi-rr-cross-small" id="closeIconInfo2"></i>
        </div>
        <div class="modal-body">
            <div class="details">
            <!-- Nội dung details -->
            <div class="staff-table1">
        <div class="table-header">
            <h2>Danh sách sản phẩm</h2>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <td>STT</td>
                        <td>Tên</td>
                        <td>SKU</td>
                        <td>Số lượng</td>
                        <td>Đơn giá</td>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </div>      
</div>
        </div>
        </div>
</div>
 
        <?php require_once "./MVC/Views/pages/".$data["Page"].".php" ?>
    </body>
        <script src="../Public/scripts/OrderHistory/script.js"> </script>
</html>
