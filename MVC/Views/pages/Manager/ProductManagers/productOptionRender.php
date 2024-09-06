<?php foreach($optionList as $option): ?>
<div class="sku-item row-element-display no-user-select" onclick="fillOptionEditInfo(this)">
    <div class="row-element" attrib="option_name" value="<?= $option["option_name"]?>">
        <?= $option["option_name"] ?>
    </div>
    <div class="hidden">
        <span attrib="option_id" value="<?= $option["option_id"]?>"></span>
        <span attrib="option_value" value="<?= $option["option_value"]?>"></span>
    </div>
</div>
<?php endforeach; ?>