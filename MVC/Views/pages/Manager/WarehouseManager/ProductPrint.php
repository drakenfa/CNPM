<?php foreach($productList as $product): ?>
<div class="product-item row-element-display" onclick="fillSelectedData(this)">
    <div class="row-element hidden" attrib="product_id" value="<?= $product["product_id"]?>">
        <?= $product["product_id"] ?>
    </div>
    <div class="row-element hidden" attrib="sku_id" value="<?= $product["sku_id"]?>">
        <?= $product["sku_id"] ?>
    </div>
    <div class="row-element" attrib="product_name"value="<?= $product["product_name"]?>">
        <?= $product["product_name"] ?>
    </div>
    <div class="row-element" attrib="category_name" value="<?= $product["category_id"]?>">
        <?= $product["category_name"] ?>
    </div>
    <div class="row-element" attrib="brand_name" value="<?= $product["brand_id"] ?>">
        <?= $product["brand_name"] ?>
    </div>
    <div class="row-element" attrib="sku_code" value="<?= $product["sku_code"] ?>">
        <?= $product["sku_code"] ?>
    </div>
    <div class="row-element" attrib="sku_name" value="<?= $product["sku_id"] ?>">
        <?= $product["sku_name"] ?>
    </div>
    <div class="row-element" attrib="total_remain" value="<?= $product["total_remain"] ?>">
        <?= $product["total_remain"] ?>
    </div>
    <div class="hidden">
        <?php 
            $thumbnail = $product["thumbnail"];
            if($thumbnail==""){
                $thumbnail = "_common/no-image.jpg";
            }
        ?>
        <span attrib="thumbnail" value="../Public/img/products/<?= $thumbnail?>"></span>
        <?php 
            unset($thumbnail);
        ?>
    </div>
</div>
<?php endforeach; ?>