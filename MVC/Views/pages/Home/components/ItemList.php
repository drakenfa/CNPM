
<?php 
    $featuredRow = $displayRow["rows"];
    $productList = $displayRow["products"];
?>
<div class="product-set set-<?= $featuredRow["row_id"] ?>">
    <div class="set-title style-panel-title <?php if($featuredRow["row_description"]!="") echo("has-text") ?>">
        <div class="set-title-name">
            <div class="title">
                <?= $featuredRow["row_name"] ?>
            </div>
            <?php if(isset($featuredRow["row_description"])): ?>
            <div class="set-text">
                <?= $featuredRow["row_description"] ?>
            </div>
            <?php endif; ?>
        </div>
        <div class="show-product-button-wrapper no-user-select button-effect">
            <div class="show-more-button" onclick="showMoreProducts(this.parentElement.parentElement.parentElement)">Hiển thị tất cả</div>
            <div class="hide-button" onclick="hideProducts(this.parentElement.parentElement.parentElement)">Ẩn</div>
        </div>
    </div>
    <div class="product-list-wrapper no-scrollbar hide">
        <div class="product-list">
            <?php include('./MVC/Views/pages/Catalog/ProductPrint.php'); ?>
        </div>
    </div>
</div>

<?php 
    unset($featuredRow);
    unset($productList);
?>