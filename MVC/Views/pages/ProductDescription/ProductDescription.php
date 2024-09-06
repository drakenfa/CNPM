
    
<link rel="stylesheet" href="../Public/css/globals/globals.css">
<link rel="stylesheet" href="../Public/css/globals/components.css">
<link rel="stylesheet" href="../Public/css/Home/product_item.css">
<link rel="stylesheet" href="../Public/css/ProductDescription/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../Public/css/globals/input-components.css">

<link rel="stylesheet" href="../Public/misc/rateyo-min/jquery.rateyo.min.css">


<script src="../Public/scripts/components/jquery-3.7.1.min.js"></script>
<script src="../Public/misc/rateyo-min/jquery.rateyo.min.js"></script>


<script src="../Public/scripts/ProductDescription/script.js"></script>
<script src="../Public/scripts/ProductDescription/load.js" defer></script>
<!-- <script src="../Public/scripts/Shopcart/script3.js"></script> -->
<div class="body">
    <div class="product-info-panel">
        <div class="product-image-info-wrapper">
            <div class="grid-cell-wrapper">
                <div class="product-image-panel">
                    <div class="display-image-wrapper">
                        <div class="image-wrapper">
                            <img src="../Public/img/products/<?= $data["Product"]["thumbnail"] ?>" alt="">
                        </div>
                    </div>
                    <div class="image-preview-list-wrapper no-user-select">
                        <?php if(count($data["ProductImages"])>0):?>
                        <div class="preview-image-list">
                            <div class="image-wrapper" onclick="showImage(this)">
                                <div class="overlay"></div>
                                <img src="../Public/img/products/<?= $data["Product"]["thumbnail"] ?>" alt="">
                            </div>
                            <?php 
                                $productImages = $data["ProductImages"];
                            ?>

                            <?php foreach($productImages as $productImage): ?>
                            <div class="image-wrapper" onclick="showImage(this)">
                                <div class="overlay hidden"></div>
                                <img src="../Public/img/products/<?= $productImage["image_url"] ?>" alt="">
                            </div>
                            <?php endforeach; ?>

                            <?php 
                                unset($productImages);
                            ?>
                        </div>
                        <?php endif?>
                    </div>
                </div>
            </div>
            <div class="grid-cell-wrapper">
                <div class="product-info-panel">
                    <div class="product-info-display">
                        <div class="product-name">
                            <?= $data["Product"]["product_name"] ?>
                        </div>
                        <div class="brand-name">
                            <?= $data["Product"]["brand_name"] ?>
                        </div>
                        <div class="price">
                            Giá:
                            <span class="price-value">
                                <?= number_format($data["Product"]["price"], 0, '.', ',') ?>₫
                            </span>
                        </div>
                    </div>
                    <div class="product-sku-list-wrapper">
                            <?php 
                                $productSkus = $data["ProductSkus"];
                            ?>
                            <?php if(count($productSkus)>1): ?>
                                <div class="title">
                                    Các lựa chọn
                                </div>
                                <div class="product-sku-list">
                                    <?php foreach($productSkus as $sku): ?>
                                        <?php if($sku["remain"]>0): ?>
                                            <div class="sku-option <?php if(!isset($selectedSku)) {echo "selected";$selectedSku = true;}?>" value="<?= $sku["sku_id"] ?>" onclick="selectSku(this)">
                                                <span class="text">
                                                    <?= $sku["sku_name"] ?>
                                                </span>
                                            </div>
                                        <?php else: ?>
                                            <div class="sku-option disabled" value="<?= $sku["sku_id"] ?>">
                                                <span class="text">
                                                    <?= $sku["sku_name"] ?> (Hết)
                                                </span>
                                            </div>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </div>
                            <?php else: ?>
                                <div class="product-sku-list">
                                    <div class="sku-option selected hidden" value="<?= $productSkus[0]["sku_id"] ?>">
                                        <span class="text">
                                            <?= $productSkus[0]["sku_name"] ?> 
                                        </span>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <?php
                                unset($productSkus);
                            ?>
                    </div>
                    <div class="order-options no-user-select">
                        <?php if(isset($selectedSku)): ?>
                            <div class="option-buy" onclick="buyProduct()">
                                Mua ngay
                            </div>
                            <div class="option-add-to-cart" onclick="addProductToCart2()">
                                Thêm vào giỏ hàng
                            </div>
                        <?php else: ?>
                            <div class="option-buy disabled">
                                Mua ngay
                                <div class="sold-out-message">(Hết hàng)</div>
                            </div>
                            <div class="option-add-to-cart disabled">
                                Thêm vào giỏ hàng
                                <div class="sold-out-message">(Hết hàng)</div>
                            </div>
                        <?php endif; ?>
                        <?php 
                            if(isset($selectedSku)){
                                unset($selectedSku);
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-description-panel">
            <div class="description-spec-wrapper">
                <div class="description-panel">
                    <div class="title">
                        Mô tả sản phẩm
                    </div>
                    <div class="text">
                        <?= $data["Product"]["description"] ?>
                    </div>
                </div>
                <div class="rating-spec-wrapper">
                    <div class="spec-table-wrapper">
                        <div class="title">
                            Thông số sản phẩm
                        </div>
                        <table class="product-spec-table">
                            <?php 
                                $productOptions = $data["ProductOptions"];
                            ?>

                            <?php foreach($productOptions as $option): ?>
                                <tr>
                                    <td class="option-name">
                                        <?= $option["option_name"] ?>
                                    </td>
                                    <td class="option-value">
                                        <?= $option["option_value"] ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>

                            <?php 
                                unset($productOptions);
                            ?>
                        </table>
                    </div>
                    <div class="product-rating-wrapper">
                        <div class="product-rating-row">
                            <div class="title">
                                Đánh giá
                            </div>
                            <div class="rating-number text">
                                (<?= (number_format((float)$data["Product"]["average_rating"], 2, '.', '')); ?>)
                            </div>
                            <div id="product-star-rating-value" value="<?= $data["Product"]["average_rating"]?>" >
    
                            </div>
                        </div>
                        <div class="rating-count-row">
                            <?php 
                                $ratingCount = $data["Product"]["total_reviews"];
                            ?>

                            <?php if($ratingCount == 0): ?>
                            Chưa có đánh giá
                            <?php else: ?>
                            <?= $ratingCount ?> đánh giá
                            <?php endif; ?>

                            <?php 
                                unset($ratingCount);
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="user-review-section">
        <div class="title">
            Nhận xét của bạn
        </div>
        <div class="review-form-wrapper">
            <div class="c-input" id="input_rating">
                <div class="input-label-wrapper">
                    <label for="input_username">Đánh giá</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <div id="user-star-review-rating">
    
                </div>
            </div>
            <div class="c-input" id="input_comment">
                <div class="input-label-wrapper">
                    <label for="input_username">Mô tả</label>
                    <div class="input-error-message">
                        
                    </div>    
                </div>
                <textarea name="" id="" rows="4" placeholder="Nhận xét của bạn"></textarea>
            </div>
        </div>
        <div class="submit-review-wrapper no-user-select">
            <?php if($data["IsLoggedIn"]): ?>
                <?php if(!$data["HasReviewed"] && $data["HasOrdered"]): ?>
                    <div class="submit-button" onclick="sendProductReview(this)">
                        Gửi nhận xét
                    </div>
                <?php elseif(!$data["HasOrdered"]): ?>
                    <div class="submit-button disabled">
                        Vui lòng đặt mua sản phẩm để gửi nhận xét
                    </div>
                <?php else: ?>
                    <div class="submit-button disabled">
                        Bạn đã nhận xét sản phẩm
                    </div>
                <?php endif; ?>
            <?php else: ?>
                <div class="submit-button disabled">
                    Vui lòng đăng nhập để gửi nhận xét
                </div>
            <?php endif; ?>
        </div>
    </div>
    <div class="product-review-section">
        <?php 
            $productReviews = $data["ProductReviews"];
        ?>
        <div class="title">
            Nhận xét của khách hàng <span>(<?= count($productReviews) ?> Nhận xét)</span>
        </div>
        <?php if(count($productReviews)>0): ?>
        <div class="user-review-list-wrapper">
            <div class="user-review-list">
                <?php foreach($productReviews as $review): ?>
                <div class="user-review" rating-value="<?=$review["rating"]?>">
                    <div class="user-info-wrapper">
                        <div class="avatar-wrapper">
                            <?php 
                            $customerAvatar = $review["avatar"];
                            if($customerAvatar==""){
                                $customerAvatar = "customerAvatar/_common/anon-user.jpg";
                            }
                            ?>
                            <img src="../Public/img/<?= $customerAvatar ?>" alt="" srcset="">
                            <?php 
                                unset($ratingCount);
                            ?>
                        </div>
                        <div class="user-info">
                            <div class="name-rating-info">
                                <div class="user-fullname">
                                    <?= $review["customer_fullname"]; ?>
                                </div>
                                <div class="user-rating">
                                    <?= (number_format((float)$review["rating"], 1, '.', '')); ?>
                                    <div class="star-icon-wrapper">
                                        <img src="../Public/img/web_icons/star.png" alt="" srcset="" width="12px" height="12px">
                                    </div>
                                </div>
                            </div>
                            <div class="review-date">
                                <?= $review["review_date"]; ?>
                            </div>
                        </div>
                    </div>
                    <?php if($review["comment"]!=""): ?>
                    <div class="user-review-comment">
                        <div class="comment">
                            <?= $review["comment"] ?>
                        </div>
                    </div>
                    <?php endif; ?>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php else: ?>
        <div class="no-review-message">
            Chưa có nhận xét về sản phẩm
        </div>
        <?php endif; ?>
        <?php
            unset($productReviews);
        ?>
    </div>
    <div class="similar-product-section">
        <div class="title">
            Xem thêm các sản phẩm
        </div>
        <div class="product-list-wrapper">
            <div class="product-list">
                <?php 
                    $productList = $data["SimilarProductList"];
                    include("./MVC/Views/pages/Catalog/ProductPrint.php");
                    unset($productList);
                ?>
            </div>
        </div>
    </div>
</div>