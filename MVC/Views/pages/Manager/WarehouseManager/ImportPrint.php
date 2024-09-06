<?php foreach($importList as $import): ?>
<div class="product-item row-element-display" onclick="">
    <div class="row-element" attrib="import_id" value="<?= $import["import_id"]?>">
        <?= $import["import_id"] ?>
    </div>
    <div class="row-element" attrib="import_date"value="<?= $import["import_date"]?>">
        <?= $import["import_date"] ?>
    </div>
    <div class="row-element" attrib="quantity"value="<?= $import["quantity"]?>">
        <?= $import["quantity"] ?>
    </div>
        <div class="row-element" attrib="remain"value="<?= $import["remain"]?>">
        <?= $import["remain"] ?>
    </div>
</div>
<?php endforeach; ?>