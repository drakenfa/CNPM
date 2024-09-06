<?php foreach($productList as $product): ?>
    <a href="../ProductDescription/?id=<?= $product["product_id"]?>" class="product-item no-style">
        <div class="product-image-wrapper">
            <?php if($product["thumbnail"]!=""): ?>
            <img class="no-user-select" src="../Public/img/products/<?= $product["thumbnail"] ?>" alt="" srcset="">
            <?php else: ?>
            <img class="no-user-select" src="../Public/img/products/_common/no-image.jpg ?>" alt="" srcset="">
            <?php endif ?>
        </div>
        <div class="product-display-name">
            <?= $product["product_name"] ?>
        </div>
        <div class="producer-display-name">
            <?= $product["brand_name"] ?>
        </div>
        <div class="product-info-display">
            <div class="price-display">
                <?= number_format($product["price"], 0, '.', ',') ?>₫
            </div>
            <div class="rating-display">
                <div class="rating-icon-wrapper">
                    <img class="no-user-select" src="../Public/img/web_icons/star.png" width="18" height="18" alt="" srcset="">
                </div>
                <div class="rating-value">
                    <?= $product["average_rating"] ?>
                </div>
            </div>
        </div>
    </a>
<?php endforeach; ?>