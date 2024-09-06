<link rel="stylesheet" href="../Public/css/globals/components.css">
<link rel="stylesheet" href="../Public/css/globals/globals.css">
<link rel="stylesheet" href="../Public/css/globals/input-components.css">
<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/globals.js"></script>
<script src="../Public/js/Manager/WarehouseManager/load.js" defer></script>
<div class="tab warehouse-tab">
    <div class="tab-header">
        <div class="menu-options-wrapper no-user-select header-options">
            <div class="title">
                Chức năng
            </div>
            <a href="../InternalManager/WarehouseManager?action=shipments" class="option no-style">
                Lô hàng trong kho
            </a>
            <a href="../InternalManager/WarehouseManager?action=products" class="option no-style">
                Sản phẩm trong kho
            </a>
        </div>
        <div class="header-search-bar no-user-select header-options">
            <div class="title">
                Tìm kiếm
            </div>
            <input placeholder="Nhập tên sản phẩm" type="text" name="" id="" value="<?php if(isset($data["URLParams"]["search-query"]))echo $data["URLParams"]["search-query"]?>">
        </div>
        <div class="order-options-wrapper no-user-select header-options">
            <div class="title">
                Sắp xếp
            </div>
            <div class="option">
                <select name="" id="" onchange="setFilter('order-by',`${this.value}`)">
                    <?php $orderByValue = $data["URLParams"]["order-by"]; ?>
                    <option value="">Mặc định</option>
                    <option value="brand-a-z" <?php if($orderByValue=="brand-a-z") echo "selected" ?> >Hãng sản xuất</option>
                    <option value="category-a-z" <?php if($orderByValue=="category-a-z") echo "selected" ?>>Loại sản phẩm</option>
                    <option value="price-asc" <?php if($orderByValue=="price-asc") echo "selected" ?>>Giá tăng dần</option>
                    <option value="price-desc" <?php if($orderByValue=="price-desc") echo "selected" ?>>Giá giảm dần</option>
                    <option value="updated-at-desc" <?php if($orderByValue=="updated-at-desc") echo "selected" ?>>Ngày thay đổi mới nhất</option>
                    <option value="updated-at-asc" <?php if($orderByValue=="updated-at-asc") echo "selected" ?>>Ngày thay đổi cũ nhất</option>
                    <?php unset($orderByValue); ?>
                </select>
            </div>
        </div>
    </div>
    <div class="tab-content products-tab">
        <div class="product-tab">
            <div class="product-title row-element-display-header">
                <div class="row-element">
                    Tên sản phẩm 
                </div>
                <div class="row-element">
                    Loại
                </div>
                <div class="row-element">
                    Hãng 
                </div>
                <div class="row-element">
                    Mã SKU
                </div>
                <div class="row-element">
                    Tên SKU
                </div>
                <div class="row-element">
                    Tồn kho
                </div>
            </div>
            <div class="product-list">
                <div class="product-list-container">
                    <?php 
                        $productList = $data["ProductList"]["ProductList"];
                        include("./MVC/Views/Pages/Manager/WarehouseManager/ProductPrint.php");
                        unset($productList);
                    ?>
                </div>
                <?php if(!$data["ProductList"]["IsLast"]):?>
                <div class="show-more-product-button no-user-select" onclick="showMoreProducts(this)">
                    Xem thêm sản phẩm
                </div>
                <?php endif; ?> 
            </div>
        </div>
        <div class="info-tab-list">
            <div class="expand-option-wrapper">
                <div class="option no-user-select" onclick="document.querySelector('.tab-content').classList.toggle('expanded'); if(this.innerHTML != '❯')this.innerHTML = '❯'; else this.innerHTML = '❮'">
                    ❮
                </div>
            </div>
            <div class="info-tab product-info-tab">
                <div class="no-product-select-tab">
                    <div class="message">
                        Chọn sản phẩm để xem thêm thông tin
                    </div>
                </div>
                <div class="product-info-tab-wrapper hidden">
                    <div class="title">
                        Thông tin sản phẩm
                    </div>
                    <div class="tab-content-wrapper">
                        <div class="info-tab-content">
                            <div class="product-info-table-wrapper">
                                <div class="row-element-display-header">
                                    <div class="row-element">
                                        Mã đơn nhập
                                    </div>
                                    <div class="row-element">
                                        Ngày nhập
                                    </div>
                                    <div class="row-element">
                                        Số lượng nhập
                                    </div>
                                    <div class="row-element">
                                        Còn lại
                                    </div>
                                </div>
                                <div class="product-info-list-wrapper">
                                    <div class="product-info-list">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="info-tab add-products-tab hidden">
                <div class="title">
                    
                </div>
                <div class="tab-content-wrapper">
                    
                </div>
            </div>
        </div>
    </div>
</div>