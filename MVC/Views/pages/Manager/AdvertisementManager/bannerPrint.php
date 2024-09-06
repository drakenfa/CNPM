<?php
    $bannerDisplayInfo = [
        "banner_name",
        "url",
        "location_name"    
    ];
?>
<?php foreach($bannerList as $banner): ?>
<div class="table-row no-user-select" onclick="fillSelectedInfo('Banners',this);showInfoPanel('banner-info-panel')">
    
    <?php foreach($bannerDisplayInfo as $col): ?>
        <?php if(array_search($col,array_keys($banner))): ?>
            <div class="row-element" attrib="<?= $col ?>" value="<?= $banner["$col"] ?>">
                <?= $banner["$col"] ?>
            </div>
        <?php endif; ?>       
    <?php endforeach; ?>
    <?php foreach(array_keys($banner) as $col): ?>
        <?php if(!array_search($col,$bannerDisplayInfo)): ?>
            <div class="row-element hidden" attrib="<?= $col ?>" value="<?= $banner["$col"] ?>">
                <?= $banner["$col"] ?>
            </div>
        <?php endif; ?>       
    <?php endforeach; ?>
</div>
<?php endforeach; ?>