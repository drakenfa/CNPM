<?php
    $productDisplayInfo = [
        "product_name"  
    ];
?>
<?php foreach($productList as $product): ?>
<div class="table-row no-user-select" draggable="true" ondragstart="removeProductDragStart(event,this)" >
    <?php foreach($productDisplayInfo as $col): ?>
        <?php if(in_array($col,array_keys($product))): ?>
            <div class="row-element" attrib="<?= $col ?>" value="<?= $product["$col"] ?>">
            <?php 
                if($col == "price"){
                    echo(number_format($product["price"], 0, '.', ',')."₫");
                }
                else{
                    echo($product["$col"]);
                } 
            ?>
            </div>
        <?php endif; ?>       
    <?php endforeach; ?>
    <?php foreach(array_keys($product) as $col): ?>
        <?php if(!in_array($col,$productDisplayInfo)): ?>
            <div class="row-element hidden" attrib="<?= $col ?>" value="<?= $product["$col"] ?>">
                <?= $product["$col"] ?>
            </div>
        <?php endif; ?>       
    <?php endforeach; ?>
</div>
<?php endforeach; ?>