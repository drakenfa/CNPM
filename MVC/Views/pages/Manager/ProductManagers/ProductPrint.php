
<?php foreach($productList as $product): ?>
<div class="product-item row-element-display" onclick="fillSelectedData(this)">
    <div class="row-element" attrib="product_id" value="<?= $product["product_id"]?>">
        <?= $product["product_id"] ?>
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
    <div class="row-element" attrib="price" value="<?= $product["price"]?>">
        <?= number_format($product["price"], 0, '.', ',') ?>₫
    </div>
    <div class="row-element hidden" attrib="updated_at" value="<?= $product["updated_at"] ?>">
        <?= $product["updated_at"] ?>
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
        <span attrib="average_rating" value="<?= $product["average_rating"]?>"></span>
        <span attrib="guarantee" value="<?= $product["guarantee"]?>"></span>
        <span attrib="description" value="<?= $product["description"]?>"></span>
    </div>
</div>
<?php endforeach; ?>