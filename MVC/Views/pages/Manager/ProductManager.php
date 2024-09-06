<link rel="stylesheet" href="../Public/css/globals/components.css">
<link rel="stylesheet" href="../Public/css/globals/globals.css">
<link rel="stylesheet" href="../Public/css/globals/input-components.css">
<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/globals.js"></script>
<script src="../Public/js/Manager/ProductManager/load.js" defer></script>
<div class="tab">
    <div class="tab-header">
        <div class="menu-options-wrapper no-user-select header-options">
            <div class="title">
                Chức năng
            </div>
            <div class="option selected" panel="product-info-tab" onclick="showInfoTab(this)">
                Thông tin sản phẩm
            </div>
            <div class="option" panel="add-products-tab" onclick="showInfoTab(this)">
                Thêm sản phẩm mới
            </div>
        </div>
        <div class="filter-options-wrapper no-user-select header-options">
            <div class="title">
                Phân loại
            </div>
            <div class="option">
                <?php 
                    $searchParams = [];
                    if(isset($data["URLParams"]["categories"])){
                        $searchParams = explode(",",$data["URLParams"]["categories"]);
                    }
                ?>
                <select onchange="setFilter('categories',`${this.value}`)">
                    <option value="">Tất cả</option>
                    <?php foreach($data["CategoryList"] as $category): ?>
                        <option value="<?= $category["category_id"] ?>" <?php if(in_array($category["category_id"],$searchParams))echo("selected")?>><?= $category["category_name"] ?></option>
                    <?php endforeach; ?>
                </select>
                <?php 
                    unset($searchParams);
                ?>
            </div>
            <div class="option">
                <?php 
                    $searchParams = [];
                    if(isset($data["URLParams"]["brands"])){
                        $searchParams = explode(",",$data["URLParams"]["brands"]);
                    }
                ?>
                <select onchange="setFilter('brands',`${this.value}`)">
                    <option value="">Tất cả</option>
                    <?php foreach($data["BrandList"] as $brand): ?>
                        <option value="<?= $brand["brand_id"] ?>" <?php if(in_array($brand["brand_id"],$searchParams))echo("selected")?>><?= $brand["brand_name"] ?> </option>
                    <?php endforeach; ?>
                </select>
                <?php 
                    unset($searchParams);
                ?>
            </div>
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
                    Mã 
                </div>
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
                    Giá
                </div>
                <div class="row-element hidden">
                    Ngày chỉnh sửa
                </div>
            </div>
            <div class="product-list">
                <div class="product-list-container">
                    <?php 
                        $productList = $data["ProductList"]["ProductList"];
                        include("./MVC/Views/Pages/Manager/ProductManagers/ProductPrint.php");
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
                        Chọn sản phẩm để xem thông tin
                    </div>
                </div>
                <div class="product-info-tab-wrapper hidden">
                    <div class="title">
                        Thông tin sản phẩm
                    </div>
                    <div class="tab-header-options no-user-select">
                        <div class="option selected" panel="info-panel" onclick="showInfoPanel(this)">
                            Thông tin
                        </div>
                        <div class="option" panel="sku-panel" onclick="showInfoPanel(this)">
                            Đơn vị lưu
                        </div>
                        <div class="option" panel="product-images-panel" onclick="showInfoPanel(this)">
                            Hình ảnh
                        </div>
                        <div class="option" panel="product-options-panel" onclick="showInfoPanel(this)">
                            Thông số
                        </div>
                    </div>
                    <div class="tab-content-wrapper">
                        <div class="info-tab-content info-panel">
                            <div class="product-img-wrapper">
                                    <img src="../Public/img/products/_common/not-found.png" alt="" srcset="">
                                    <div class="img-input-overlay">
                                        <div class="overlay-message">
                                            Đổi
                                        </div>
                                        <input name="input-thumbnail" type="file" accept="image/*" multiple="false" onchange="changeImageInput(this.parentElement.parentElement); enableEdit()">
                                    </div>
                            </div>
                            
                            <div class="product-info-wrapper">
                                <div class="c-input" id="input-product-name">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Tên sản phẩm</label>
                                        </div>
                                        <textarea autocomplete="off" class="input" name="input-product-name" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onchange="enableEdit()"></textarea>
                                    </div>
                                </div>
                                <div class="c-input" id="input-description">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Mô tả</label>
                                        </div>
                                        <textarea autocomplete="off" class="input"  name="input-description" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onchange="enableEdit()"></textarea>
                                    </div>
                                </div>
                                <div class="c-input" id="input-category-id">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Loại</label>
                                        </div>
                                        <select class="input"  onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onchange="enableEdit()">
                                            <?php foreach($data["CategoryList"] as $category): ?>
                                                <option value="<?= $category["category_id"]?>"><?= $category["category_name"]?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="c-input" id="input-brand-id">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Hãng</label>
                                        </div>
                                        <select class="input"  onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onchange="enableEdit()">
                                            <?php foreach($data["BrandList"] as $brand): ?>
                                                <option value="<?= $brand["brand_id"]?>"><?= $brand["brand_name"]?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="c-input" id="input-price">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Giá</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input-price" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onblur="if (formatPrice(this))enableEdit()">
                                    </div>
                                </div>
                                <div class="c-input" id="input-guarantee">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Bảo hành</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input-guarantee" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onblur="if(formatGuarantee(this)) enableEdit()">
                                    </div>
                                </div>
                            </div>
                            
        
                            <div class="bottom-options no-user-select">
                                <div id="edit-product-button" class="option disabled" onclick="editProduct(this)">
                                    Lưu thay đổi
                                </div>
                                <div id="cancel-edit-button" class="option disabled" onclick="removeChange()">
                                    Hủy thay đổi
                                </div>
                                <div id="remove-product-button" class="option" onclick="removeProduct(this)">
                                    Xóa sản phẩm
                                </div>
                            </div>
                        </div>
                        <div class="info-tab-content sku-panel hidden">
                            <div class="sku-table-wrapper">
                                <div class="sku-title row-element-display-header">
                                    <div class="row-element">
                                        Mã
                                    </div>
                                    <div class="row-element">
                                        Tên 
                                    </div>
                                </div>
                                <div class="sku-list-wrapper">
                                    <div class="sku-list">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="sku-info-form-wrapper">
                                <div class="sku-edit-form no-user-select">
                                    <div class="title" onclick="this.parentElement.querySelector('.form-wrapper').classList.toggle('hidden')">
                                        Sửa thông tin
                                    </div>
                                    <div class="form-wrapper">
                                        <div class="c-input" id="input-sku-code">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Mã</label>
                                                </div>                                
                                                <input autocomplete="off" class="input"  name="input-sku-code" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            </div>
                                        </div>
                                        <div class="c-input" id="input-sku-name">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Tên</label>
                                                </div>                                
                                                <input autocomplete="off" class="input"  name="input-sku-name" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            </div>
                                        </div>
                                        <div class="sku-info-options no-user-select">
                                            <div class="option edit-sku disabled" onclick="editSKU(this)">
                                                Sửa đơn vị
                                            </div>
                                            <div class="option remove-sku disabled" onclick="removeSKU(this)">
                                                Xóa đơn vị
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <div class="sku-add-form">
                                    <div class="title no-user-select" onclick="this.parentElement.querySelector('.form-wrapper').classList.toggle('hidden')">
                                        Thêm đơn vị mới
                                    </div>
                                    <div class="form-wrapper">
                                        <div class="c-input" id="input-sku-code">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Mã</label>
                                                </div>                                
                                                <input autocomplete="off" class="input"  name="input-sku-code" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            </div>
                                        </div>
                                        <div class="c-input" id="input-sku-name">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Tên</label>
                                                </div>                                
                                                <input autocomplete="off" class="input"  name="input-sku-name" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            </div>
                                        </div>
                                        <div class="sku-info-options no-user-select">
                                            <div class="option add-sku" onclick="addSKU(this)">
                                                Thêm đơn vị
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info-tab-content product-images-panel hidden">
                            <div class="image-preview-wrapper">
                                <img src="../Public/img/products/_common/not-found.png" alt="" srcset="">
                            </div>
                            <div class="product-image-table-wrapper">
                                <div class="product-image-title row-element-display-header">
                                    <div class="row-element">
                                        Hình ảnh sản phẩm
                                    </div>
                                </div>
                                <div class="product-image-wrapper">
                                    <div class="product-image-list">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="product-image-options no-user-select">
                                <div class="option add-img">
                                    <input name="input-product-image" type="file" accept="image/*" multiple="false" onchange="addProductImage(this.files[0])">
                                    Thêm hình ảnh mới
                                </div>
                                <div class="option rem-img" onclick="removeProductImage(this)">
                                    Xóa hình đã chọn
                                </div>
                            </div>
                        </div>
                        <div class="info-tab-content product-options-panel hidden">
                            <div class="product-options-table-wrapper">
                                <div class="product-options-title row-element-display-header">
                                    <div class="row-element">
                                        Thông số
                                    </div>
                                </div>
                                <div class="product-options-wrapper">
                                    <div class="product-options-list">
                                        
                                    </div>
                                </div>
                            </div>
                            
                            <div class="option-info-form-wrapper">
                                <div class="option-edit-form no-user-select">
                                    <div class="title" onclick="this.parentElement.querySelector('.form-wrapper').classList.toggle('hidden')">
                                        Sửa thông số
                                    </div>
                                    <div class="form-wrapper">
                                        <div class="c-input" id="input-option-name">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Tên</label>
                                                </div>                                
                                                <input autocomplete="off" class="input"  name="input-option-name" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            </div>
                                        </div>
                                        <div class="c-input" id="input-option-value">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Mô tả</label>
                                                </div>               
                                                <textarea autocomplete="off" class="input"  name="input-option-value" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()"></textarea>                 
                                            </div>
                                        </div>
                                        <div class="option-info-options no-user-select">
                                            <div class="option edit-option disabled" onclick="editOption(this)">
                                                Sửa Thông số
                                            </div>
                                            <div class="option remove-option disabled" onclick="removeOption(this)">
                                                Xóa thông số
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <div class="option-add-form">
                                    <div class="title no-user-select" onclick="this.parentElement.querySelector('.form-wrapper').classList.toggle('hidden')">
                                        Thêm thông số mới
                                    </div>
                                    <div class="form-wrapper">
                                        <div class="c-input" id="input-option-name">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Tên</label>
                                                </div>                                
                                                <input autocomplete="off" class="input"  name="input-option-name" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            </div>
                                        </div>
                                        <div class="c-input" id="input-option-value">
                                            <div class="input-error-message">
                                            </div>    
                                            <div class="input-wrapper">
                                                <div class="input-label-wrapper">
                                                    <label>Mô tả</label>
                                                </div>
                                                <textarea autocomplete="off" class="input"  name="input-option-value" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()"></textarea>                                
                                            </div>
                                        </div>
                                        <div class="option-info-options no-user-select">
                                            <div class="option add-option" onclick="addOption(this)">
                                                Thêm thông số
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="info-tab add-products-tab hidden">
                <div class="title">
                    Thêm sản phẩm
                </div>
                <div class="tab-content-wrapper">
                    <div class="info-tab-content info-panel">
                        <div class="product-img-wrapper">
                                <img src="../Public/img/products/_common/not-found.png" alt="" srcset="">
                                <div class="img-input-overlay">
                                    <div class="overlay-message">
                                        Chọn hình ảnh
                                    </div>
                                    <input name="input-thumbnail" type="file" accept="image/*" multiple="false" onchange="changeImageInput(this.parentElement.parentElement)">
                                </div>
                        </div>
                        
                        <div class="product-info-wrapper">
                            <div class="c-input" id="input-product-name">
                                <div class="input-error-message">
                                </div>    
                                <div class="input-wrapper">
                                    <div class="input-label-wrapper">
                                        <label>Tên sản phẩm</label>
                                    </div>
                                    <textarea autocomplete="off" class="input" name="input-product-name" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()"></textarea>
                                </div>
                            </div>
                            <div class="c-input" id="input-description">
                                <div class="input-error-message">
                                </div>    
                                <div class="input-wrapper">
                                    <div class="input-label-wrapper">
                                        <label>Mô tả</label>
                                    </div>
                                    <textarea autocomplete="off" class="input" name="input-description" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()"></textarea>
                                </div>
                            </div>
                            <div class="c-input" id="input-category-id">
                                <div class="input-error-message">
                                </div>    
                                <div class="input-wrapper">
                                    <div class="input-label-wrapper">
                                        <label>Loại</label>
                                    </div>
                                    <select class="input" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                        <?php foreach($data["CategoryList"] as $category): ?>
                                            <option value="<?= $category["category_id"]?>"><?= $category["category_name"]?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="c-input" id="input-brand-id">
                                <div class="input-error-message">
                                </div>    
                                <div class="input-wrapper">
                                    <div class="input-label-wrapper">
                                        <label>Hãng</label>
                                    </div>
                                    <select class="input" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                        <?php foreach($data["BrandList"] as $brand): ?>
                                            <option value="<?= $brand["brand_id"]?>"><?= $brand["brand_name"]?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="c-input" id="input-price">
                                <div class="input-error-message">
                                </div>    
                                <div class="input-wrapper">
                                    <div class="input-label-wrapper">
                                        <label>Giá</label>
                                    </div>                                
                                    <input autocomplete="off" class="input" name="input-price" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onblur="formatPrice2(this)">
                                </div>
                            </div>
                            <div class="c-input" id="input-guarantee">
                                <div class="input-error-message">
                                </div>    
                                <div class="input-wrapper">
                                    <div class="input-label-wrapper">
                                        <label>Bảo hành</label>
                                    </div>                                
                                    <input autocomplete="off" class="input" name="input-guarantee" type="text" placeholder="" onclick="(new InputElement(this.parentElement.parentElement)).hideError()" onblur="formatGuarantee2(this)">
                                </div>
                            </div>
                        </div>
                        
    
                        <div class="bottom-options no-user-select">
                            <div id="edit-product-button" class="option" onclick="addProduct(this)">
                                Thêm
                            </div>
                            <div id="cancel-edit-button" class="option" onclick="clearAddProductFormInfo()">
                                Xóa thông tin
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>