<div class="product-set set-<?= $set_index ?>">
    <div class="set-title style-panel-title">
        <div class="set-title-name">
            <?= $set_title ?>
        </div>
        <div class="show-product-button-wrapper no-user-select button-effect">
            <div class="show-more-button" onclick="showMoreProducts(this.parentElement.parentElement.parentElement)">Hiển thị tất cả</div>
            <div class="hide-button" onclick="hideProducts(this.parentElement.parentElement.parentElement)">Ẩn</div>
        </div>
    </div>
    <div class="product-list-wrapper no-scrollbar">
        <div class="product-list hide">
            <?php include('./MVC/Views/pages/Catalog/TestProductPrint.php'); ?>
            <?php include('./MVC/Views/pages/Catalog/TestProductPrint.php'); ?>
            <?php include('./MVC/Views/pages/Catalog/TestProductPrint.php'); ?>
            <?php include('./MVC/Views/pages/Catalog/TestProductPrint.php'); ?>
        </div>
    </div>
</div>