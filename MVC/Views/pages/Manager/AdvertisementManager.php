<link rel="stylesheet" href="../Public/css/globals/components.css">
<link rel="stylesheet" href="../Public/css/globals/globals.css">
<link rel="stylesheet" href="../Public/css/globals/input-components.css">

<script src="../Public/scripts/components/validate.min.js"></script>
<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/scripts/components/globals.js"></script>
<script src="../Public/js/Manager/AdvertisementManager/load.js" defer></script>


<?php
    $actionParams = [
        "bnr-mgr","ftr-mgr"
    ];
    if (isset($data["URLParams"]["action"])){
        $action = $data["URLParams"]["action"];
        if (!array_search($action,$actionParams)){
            $action = $actionParams[0];
        }
    }
    else{
        $action = "bnr-mgr";
    }
    unset($actionParams);
?>
<div class="tab">
    <div class="tab-header">
        <div class="tab-content-options">
            <div class="title">
                Chức năng
            </div>
            <div class="option-list">
                <div class="option <?php if($action=="bnr-mgr") echo"selected" ?>" tab="banner-manager-tab" onclick="setFilter('action','bnr-mgr')">
                    <div class="text">
                        Hình ảnh quảng cáo
                    </div>
                </div>
                <div class="option <?php if($action=="ftr-mgr") echo"selected" ?>" tab="featured-products-manager-tab" onclick="setFilter('action','ftr-mgr')">
                    <div class="text">
                        Sản phẩm trưng bày
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-content-wrapper tab-content banner-manager-tab <?php if($action!="bnr-mgr") echo"hidden" ?>">
            <div class="tab-content-header">
                <div class="options-list banner-options-1">
                    <div class="option selected" panel="banner-info-panel" onclick="showPanel('banner-manager-tab',this)">
                        Danh sách quảng cáo
                    </div>
                    <div class="option" panel="add-banner-info-panel" onclick="showPanel('banner-manager-tab',this)">
                        Thêm hình quảng cáo mới
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="grid-cell-wrapper">
                    <div class="banner-list-panel">
                        <div class="table-wrapper banner-table">
                            <div class="table-row-header">
                                <div class="row-element">
                                    Tên hình quảng cáo
                                </div>
                                <div class="row-element">
                                    Đường dẫn
                                </div>
                                <div class="row-element">
                                    Vị trí
                                </div>
                            </div>
                            <div class="row-list-wrapper">
                                <div class="row-list">
                                    <?php 
                                        $bannerList = $data["BannerList"];
                                        include("./MVC/Views/pages/Manager/AdvertisementManager/bannerPrint.php");
                                        unset($bannerList);
                                    ?>
                                </div>
                                <!-- <?php if(!$data["BannerList"]["IsLast"]):?>
                                <div class="show-more-button no-user-select" onclick="showMoreBanners(this)">
                                    Xem thêm
                                </div>
                                <?php endif; ?>  -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid-cell-wrapper">
                    <div class="expand-option-wrapper">
                        <div class="option no-user-select" onclick="document.querySelector('.banner-manager-tab .content').classList.toggle('expanded'); if(this.innerHTML != '❯')this.innerHTML = '❯'; else this.innerHTML = '❮'">
                            ❮
                        </div>
                    </div>
                    <div class="info-panel-wrapper">
                        <div class="info-panel banner-info-panel">
                            <div class="inital-panel">
                                
                            </div>
                            <div class="after-panel hidden">
                                <div class="title">
                                    Thông tin
                                </div>
                                <div class="edit-image-wrapper banner-image-wrapper">
                                        <img src="../Public/img/products/_common/not-found.png" alt="" srcset="">
                                        <div class="img-input-overlay">
                                            <div class="overlay-message">
                                                Chọn hình ảnh
                                            </div>
                                            <input name="input_image_path" type="file" accept="image/*" multiple="false" onchange="changeImage(this.parentElement.parentElement);enableOptions('EditBannerForm')">
                                        </div>
                                </div>
                                <div class="info-panel-form-wrapper">
                                    <div class="c-input" id="input_banner_name">
                                        <div class="input-error-message">
                                        </div>    
                                        <div class="input-wrapper">
                                            <div class="input-label-wrapper">
                                                <label>Tên hình quảng cáo</label>
                                            </div>                                
                                            <input autocomplete="off" class="input"  name="input_banner_name" type="text" placeholder="" onchange="enableOptions('EditBannerForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                        </div>
                                    </div>
                                    <div class="c-input" id="input_url">
                                        <div class="input-error-message">
                                        </div>    
                                        <div class="input-wrapper">
                                            <div class="input-label-wrapper">
                                                <label>Đường dẫn</label>
                                            </div>                                
                                            <input autocomplete="off" class="input"  name="input_url" type="text" placeholder="" onchange="enableOptions('EditBannerForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                        </div>
                                    </div>
                                    <div class="c-input" id="input_location">
                                        <div class="input-error-message">
                                        </div>    
                                        <div class="input-wrapper">
                                            <div class="input-label-wrapper">
                                                <label>Vị trí</label>
                                            </div>          
                                            <select class="input"  name="input_location"  onchange="enableOptions('EditBannerForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                                <?php 
                                                    $locationList = $data["BannerLocationList"];
                                                ?>
                                                <?php foreach($locationList as $location): ?>
                                                    <option value="<?= $location["location_id"] ?>" ><?= $location["location_name"] ?></option>
                                                <?php endforeach; ?>
                                                <?php 
                                                    unset($locationList);
                                                ?>
                                            </select>                      
                                        </div>
                                    </div>
                                </div>
                                <div class="info-panel-form-options">
                                    <div class="option edit-button disabled" onclick="editBanner(this)">
                                        Chỉnh sửa thông tin
                                    </div>
                                    <div class="option remove-button" onclick="removeBanner(this)">
                                        Xóa đã chọn
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info-panel add-banner-info-panel hidden">
                            <div class="title">
                                Thêm hình quảng cáo
                            </div>
                            <div class="edit-image-wrapper banner-image-wrapper">
                                    <img src="../Public/img/products/_common/not-found.png" alt="" srcset="">
                                    <div class="img-input-overlay">
                                        <div class="overlay-message">
                                            Chọn hình ảnh
                                        </div>
                                        <input name="input_image_path" type="file" accept="image/*" multiple="false" onchange="changeImage(this.parentElement.parentElement);enableOptions('AddBannerForm')">
                                    </div>
                            </div>
                            <div class="add-info-panel-form-wrapper">
                                <div class="c-input" id="input_banner_name">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Tên hình quảng cáo</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input_banner_name" type="text" placeholder="" onchange="enableOptions('AddBannerForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                    </div>
                                </div>
                                <div class="c-input" id="input_url">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Đường dẫn</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input_url" type="text" placeholder="" onchange="enableOptions('AddBannerForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                    </div>
                                </div>
                                <div class="c-input" id="input_location">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Vị trí</label>
                                        </div>          
                                        <select class="input"  name="input_location"  onchange="enableOptions('AddBannerForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                            <?php 
                                                $locationList = $data["BannerLocationList"];
                                            ?>
                                            <?php foreach($locationList as $location): ?>
                                                <option value="<?= $location["location_id"] ?>" ><?= $location["location_name"] ?></option>
                                            <?php endforeach; ?>
                                            <?php 
                                                unset($locationList);
                                            ?>
                                        </select>                      
                                    </div>
                                </div>
                            </div>
                            <div class="add-info-panel-form-options">
                                <div class="option add-button disabled" onclick="addBanner(this)">
                                    Thêm hình quảng cáo mới
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-content-wrapper featured-products-manager-tab <?php if($action!="ftr-mgr") echo"hidden" ?>">
            <div class="tab-content-header">
                <div class="options-list banner-options-1">
                    <div class="option selected" panel="featured-row-info-panel" onclick="showPanel('featured-products-manager-tab',this)">
                        Danh sách dòng sản phẩm
                    </div>
                    <div class="option" panel="add-featured-row-info-panel" onclick="showPanel('featured-products-manager-tab',this)">
                        Thêm mới
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="grid-cell-wrapper">
                    <div class="table-list-panel">
                        <div class="grid-cell-wrapper">
                            <div class="featured-row-list-panel">
                                <div class="table-wrapper featured-products-rows-table">
                                    <div class="table-row-header">
                                        <div class="row-element">
                                            Tên danh mục
                                        </div>
                                        <div class="row-element">
                                            Mô tả
                                        </div>
                                        <div class="row-element">
                                            Đường dẫn
                                        </div>
                                        <div class="row-element">
                                            Vị trí
                                        </div>
                                    </div>
                                    <div class="row-list-wrapper">
                                        <div class="row-list">
                                            <?php 
                                                $featuredRowList = $data["FeaturedRowList"];
                                                include("./MVC/Views/pages/Manager/AdvertisementManager/featuredRowPrint.php");
                                                unset($featuredRowList);
                                            ?>
                                        </div>
                                        <!-- <?php if(!$data["BannerList"]["IsLast"]):?>
                                        <div class="show-more-button no-user-select" onclick="showMoreBanners(this)">
                                            Xem thêm
                                        </div>
                                        <?php endif; ?>  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="grid-cell-wrapper">   
                            <div class="draggable-product-list-panel">
                                <div class="product-search-options-wrapper">
                                    <div class="search-option">
                                        <div class="title">
                                            <div class="text">
                                                Phân loại
                                            </div>
                                        </div>
                                        <div class="option-list">
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
                                    </div>
                                    <div class="search-option product-search-option">
                                        <div class="title">
                                            <div class="text">
                                                Tìm kiếm
                                            </div>
                                        </div>
                                        <div class="option-list">
                                            <div class="option">
                                                <input placeholder="Nhập tên sản phẩm" type="text" name="" id="" value="<?php if(isset($data["URLParams"]["search-query"]))echo $data["URLParams"]["search-query"]?>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-wrapper draggable-products-table" ondrop="removeProductOnDrop(event,this)" ondragover="removeProductDragOver(event,this)" ondragleave="removeProductDragLeave(event,this)">
                                    <div class="table-row-header">
                                        <div class="row-element">
                                            Tên sản phẩm
                                        </div>
                                        <div class="row-element">
                                            Giá
                                        </div>
                                        <div class="row-element">
                                            Loại
                                        </div>
                                        <div class="row-element">
                                            Hãng
                                        </div>
                                    </div>
                                    <div class="row-list-wrapper">
                                        <div class="row-list">
                                            <?php 
                                                $productList = $data["ProductList"]["ProductList"];
                                                include("./MVC/Views/pages/Manager/AdvertisementManager/productPrint.php");
                                                unset($productList);
                                            ?>
                                        </div>
                                        <?php if(!$data["ProductList"]["IsLast"]):?>
                                        <div class="show-more-button no-user-select" onclick="showMoreProducts(this)">
                                            Xem thêm
                                        </div>
                                        <?php endif; ?> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid-cell-wrapper">
                    <div class="info-panel-wrapper">
                        <div class="info-panel featured-row-info-panel">
                            <div class="inital-panel">
                                
                            </div>
                            <div class="after-panel hidden">
                                <div class="featured-row-edit-form-wrapper">
                                    <div class="title" onclick="this.parentElement.querySelector('.form-wrapper').classList.toggle('hidden')">
                                        Sửa thông tin
                                    </div>
                                    <div class="form-wrapper">
                                        <div class="info-panel-form-wrapper">
                                            <div class="c-input" id="input_row_name">
                                                <div class="input-error-message">
                                                </div>    
                                                <div class="input-wrapper">
                                                    <div class="input-label-wrapper">
                                                        <label>Tên danh mục</label>
                                                    </div>                                
                                                    <input autocomplete="off" class="input"  name="input_rrow_name" type="text" placeholder="" onchange="enableOptions('EditFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                                </div>
                                            </div>
                                            <div class="c-input" id="input_row_description">
                                                <div class="input-error-message">
                                                </div>    
                                                <div class="input-wrapper">
                                                    <div class="input-label-wrapper">
                                                        <label>Mô tả</label>
                                                    </div>      
                                                    <textarea class="input" name="input_row_description"  id="" cols="30" rows="10" onchange="enableOptions('EditFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()"></textarea>                          
                                                </div>
                                            </div>
                                            <div class="c-input" id="input_row_url">
                                                <div class="input-error-message">
                                                </div>    
                                                <div class="input-wrapper">
                                                    <div class="input-label-wrapper">
                                                        <label>Đường dẫn</label>
                                                    </div>                                
                                                    <input autocomplete="off" class="input"  name="input_row_url" type="text" placeholder="" onchange="enableOptions('EditFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                                </div>
                                            </div>
                                            <div class="c-input" id="input_index">
                                                <div class="input-error-message">
                                                </div>    
                                                <div class="input-wrapper">
                                                    <div class="input-label-wrapper">
                                                        <label>Vị trí</label>
                                                    </div>                                
                                                    <input autocomplete="off" class="input"  name="input_index" type="text" placeholder="" onchange="enableOptions('EditFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="info-panel-form-options">
                                            <div class="option edit-button disabled" onclick="editFeaturedRow(this)">
                                                Chỉnh sửa thông tin
                                            </div>
                                            <div class="option remove-button" onclick="removeFeaturedRow(this)">
                                                Xóa đã chọn
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured-rows-product-list-wrapper">
                                    <div class="title" onclick="this.parentElement.querySelector('.product-list-wrapper').classList.toggle('hidden')">
                                        Danh sách sản phẩm
                                    </div>
                                    <div class="product-list-wrapper">
                                        <div class="expand-button" onclick="this.parentElement.querySelector('.table-wrapper').classList.toggle('expanded'); if(this.innerHTML != 'Thu nhỏ')this.innerHTML = 'Thu nhỏ'; else this.innerHTML = 'Mở rộng'">
                                            Mở rộng
                                        </div>
                                        <div class="table-wrapper featured-products-rows-detail-table" ondrop="addProductOnDrop(event,this)" ondragover="addProductDragOver(event,this)" ondragleave="addProductDragLeave(event,this)">
                                            <div class="table-row-header">
                                                <div class="row-element">
                                                    Tên sản phẩm
                                                </div>
                                            </div>
                                            <div class="row-list-wrapper">
                                                <div class="row-list">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-list-options">
                                            <div class="option save-button disabled" onclick="saveProductListChanges(this)">
                                                Lưu thay đổi
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><div class="info-panel add-featured-row-info-panel hidden">
                            <div class="title">
                                Thêm dòng trưng bày mới
                            </div>
                            <div class="add-info-panel-form-wrapper">
                                <div class="c-input" id="input_row_name">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Tên danh mục</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input_rrow_name" type="text" placeholder="" onchange="enableOptions('AddFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                    </div>
                                </div>
                                <div class="c-input" id="input_row_description">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Mô tả</label>
                                        </div>      
                                        <textarea class="input" name="input_row_description"  id="" cols="30" rows="10" onchange="enableOptions('AddFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()"></textarea>                          
                                    </div>
                                </div>
                                <div class="c-input" id="input_row_url">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Đường dẫn</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input_row_url" type="text" placeholder="" onchange="enableOptions('AddFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                    </div>
                                </div>
                                <div class="c-input" id="input_index">
                                    <div class="input-error-message">
                                    </div>    
                                    <div class="input-wrapper">
                                        <div class="input-label-wrapper">
                                            <label>Vị trí</label>
                                        </div>                                
                                        <input autocomplete="off" class="input"  name="input_index" type="text" placeholder="" onchange="enableOptions('AddFeaturedRowForm')" onclick="(new InputElement(this.parentElement.parentElement)).hideError()">
                                    </div>
                                </div>
                            </div>
                            <div class="add-info-panel-form-options">
                                <div class="option add-button disabled" onclick="addFeaturedRow(this)">
                                    Thêm dòng sản phẩm mới
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>