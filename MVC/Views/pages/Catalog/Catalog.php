<link rel="stylesheet" href="../Public/css/globals/globals.css">
<link rel="stylesheet" href="../Public/css/globals/components.css">
<link rel="stylesheet" href="../Public/css/Home/product_item.css">
<link rel="stylesheet" href="../Public/css/Catalog/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../Public/scripts/Catalog/script.js"></script>
<script src="../Public/scripts/Catalog/load.js" defer></script>

<div class="body">
    <div class="body-wrapper">
        <div class="body-header">
        </div>
        <div class="body-content">
            <div class="filter-panel">
                <div class="filter-panel-title">
                    Lọc sản phẩm
                </div>
                <div class="filter-element-container">
                    <div class="filter-title no-user-select" onclick="toggleShowFilterPanel(this.parentElement)">
                        <div class="title-text">
                            Khoảng giá
                        </div>
                        <div class="drop-down-button-wrapper">
                            <div class="drop-down-button-show show">
                                <img src="../Public/img/icons/arrow-down-icon.svg" alt="" srcset="">
                            </div>
                            <div class="drop-down-button-hide hide">
                                <img src="../Public/img/icons/arrow-up-icon.svg" alt="" srcset="">
                            </div>
                        </div>
                    </div>
                    <div class="filter-content double-slider" filter_id="price-range"> 
                        <div class="filter-option">
                            <?php 
                                $maxPriceValue = $data["PriceRange"]["maxPrice"];
                            ?>
                            <div class="number-display-wrapper">
                                <input type="text" id="lower-number" disabled>
                                <input type="text" id="upper-number" disabled>
                            </div>
                            <div class="multi-range">
                                <input type="range" min="0" step="500000" max="<?= $maxPriceValue ?>" value="0" id="lower-range" onchange="updateLowerRangeSlider(this.parentElement.parentElement)">
                                <input type="range" min="0" step="500000" max="<?= $maxPriceValue ?>" value="<?= $maxPriceValue ?>" id="upper-range" onchange="updateUpperRangeSlider(this.parentElement.parentElement)">
                            </div>
                            <div class="option-footer">
                                <div class="submit-range-search no-user-select" onclick="priceRangeUpdate(this.parentElement.parentElement)">
                                    Lọc theo giá
                                </div>
                            </div>
                            <?php
                                unset($maxPriceValue)
                            ?>
                        </div>
                    </div>
                </div>
                <?php foreach($data["FilterElements"] as $filterElement): ?>
                    <?php 
                        $filterElementId = $filterElement['id'];
                        if(isset($data["URLParams"][$filterElementId])){
                            $filteredParams = explode(",",$data["URLParams"]["$filterElementId"]);
                        }
                    ?>
                    <hr>
                    <div class="filter-element-container">
                        <div class="filter-title no-user-select" onclick="toggleShowFilterPanel(this.parentElement)">
                            <div class="title-text">
                                <?= $filterElement["name"] ?>
                            </div>
                            <div class="drop-down-button-wrapper">
                                <div class="drop-down-button-show show">
                                    <img src="../Public/img/icons/arrow-down-icon.svg" alt="" srcset="">
                                </div>
                                <div class="drop-down-button-hide hide">
                                    <img src="../Public/img/icons/arrow-up-icon.svg" alt="" srcset="">
                                </div>
                            </div>
                        </div>
                        <div class="filter-content" filter_id="<?= $filterElement["id"]?>">
                            <?php foreach($filterElement["values"] as $filterValue): ?>
                                <div class="filter-option">
                                    <label class="no-user-select">
                                        <input type="checkbox" value="<?= $filterValue["opt_id"]?>" onclick="toggleFilterElement(this)" <?php if(isset($filteredParams)) if(in_array($filterValue["opt_id"],$filteredParams)) echo("checked") ?>>
                                        <?= $filterValue["opt_name"] ?>
                                    </label>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <?php 
                        unset($filteredParams);
                        unset($filterElementId)
                    ?>
                <?php endforeach; ?>
            </div>
            <div class="product-display-panel">
                <div class="panel-wrapper">
                    <div class="product-display-title">
                        <?=$data["Message"]?>
                    </div>
                    <div class="product-display-options no-user-select">
                        <div class="title">
                            Sắp xếp theo
                        </div>
                        <div class="options-content">
                            <div class="option" id="product-a-z" onclick="toggleFilter('order-by','product-a-z')">
                                A - Z
                            </div>
                            <div class="option" id="price-asc" onclick="toggleFilter('order-by','price-asc')">
                                Giá tăng dần
                            </div>
                            <div class="option" id="price-desc" onclick="toggleFilter('order-by','price-desc')">
                                Giá giảm dần
                            </div>
                            <div class="option" id="brand-a-z" onclick="toggleFilter('order-by','brand-a-z')">
                                Theo nhà sản xuất
                            </div>
                        </div>
                    </div>
                    <?php if(count($data["ProductList"]["ProductList"])!=0): ?>
                    <div class="product-list">
                        <?php 
                            $productList = $data["ProductList"]["ProductList"];
                            include('./MVC/Views/pages/Catalog/ProductPrint.php');
                            unset($productList);
                        ?>
                    </div>
                    <?php else: ?>
                    <div class="no-product-message no-user-select">
                        <div class="image-wrapper">                        
                            <img src="../Public/img/icons/no-products.png" alt="">
                        </div>
                        <div class="message">
                            Không tìm thấy sản phẩm nào
                        </div>
                    </div>
                    <?php endif; ?>
                    <div class="product-display-footer">
                        <?php if(!$data["ProductList"]["IsLast"]): ?>
                        <div class="more-products-button-wrapper no-user-select" onclick="showMoreProducts(this)">
                            Xem thêm sản phẩm
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>