<?php foreach($productImageList as $productImage): ?>
<div class="sku-item row-element-display no-user-select" onclick="fillProductImageEditInfo(this)">
    <div class="row-element" attrib="image_url" value="<?=$productImage["image_url"]?>">
        <?= $productImage["image_url"] ?>
    </div>
    <div class="hidden">
        <span attrib="product_id" value="<?= $productImage["product_id"]?>"></span>
        <span attrib="product_image_id" value="<?= $productImage["product_image_id"]?>"></span>
    </div>
</div>
<?php endforeach; ?>