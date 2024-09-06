<?php
    $featuredRowDisplayInfo = [
        "row_name",
        "row_description",
        "row_url",
        "index"    
    ];
?>
<?php foreach($featuredRowList as $featuredRow): ?>
<div class="table-row no-user-select" onclick="fillSelectedInfo('FeaturedProductsRows',this);showInfoPanel('featured-row-info-panel');getFeaturedProducts(this);disableOptions('EditFeaturedProductsTable');disableOptions('EditFeaturedRowForm')">
    
    <?php foreach($featuredRowDisplayInfo as $col): ?>
        <?php if(array_search($col,array_keys($featuredRow))): ?>
            <div class="row-element" attrib="<?= $col ?>" value="<?= $featuredRow["$col"] ?>">
                <?= $featuredRow["$col"] ?>
            </div>
        <?php endif; ?>       
    <?php endforeach; ?>
    <?php foreach(array_keys($featuredRow) as $col): ?>
        <?php if(!array_search($col,$featuredRowDisplayInfo)): ?>
            <div class="row-element hidden" attrib="<?= $col ?>" value="<?= $featuredRow["$col"] ?>">
                <?= $featuredRow["$col"] ?>
            </div>
        <?php endif; ?>       
    <?php endforeach; ?>
</div>
<?php endforeach; ?>