<?php foreach($skuList as $sku): ?>
<div class="sku-item row-element-display no-user-select" onclick="fillSkuEditInfo(this)">
    <div class="row-element" attrib="sku_code" value="<?= $sku["sku_code"]?>">
        <?= $sku["sku_code"] ?>
    </div>
    <div class="row-element" attrib="sku_name" value="<?= $sku["sku_name"]?>">
        <?= $sku["sku_name"] ?>
    </div>
    <div class="hidden">
        <span attrib="sku_id" value="<?= $sku["sku_id"]?>"></span>
    </div>
</div>
<?php endforeach; ?>