function showTab(element){
    let tabName = element.getAttribute('tab')
    element.parentElement.querySelectorAll('.option').forEach((item)=>{
        item.classList.remove('selected')
    })
    element.classList.add("selected")

    document.querySelectorAll(`.tab .tab-content .tab-content-wrapper`).forEach((item)=>{
        item.classList.add("hidden")
    })
    document.querySelector(`.tab .tab-content .tab-content-wrapper.${tabName}`).classList.remove("hidden")
}

function showPanel(tabName,element){
    let panelName = element.getAttribute('panel')
    element.parentElement.querySelectorAll('.option').forEach((item)=>{
        item.classList.remove('selected')
    })
    element.classList.add("selected")
    
    document.querySelectorAll(`.tab .tab-content .${tabName}.tab-content-wrapper .info-panel-wrapper .info-panel`).forEach((item)=>{
        item.classList.add("hidden")
    })
    document.querySelector(`.tab .tab-content .${tabName}.tab-content-wrapper .info-panel-wrapper .info-panel.${panelName}`).classList.remove("hidden")
}


let bannerFillInfos = [
    "banner_name",
    "location_id",
    "url",
    "banner_id",
    "image_path"
]

let bannerEditFormElements = {
    "input":{
        "banner_name":document.querySelector(".banner-manager-tab .info-panel-wrapper .banner-info-panel .info-panel-form-wrapper #input_banner_name input"),
        "url":document.querySelector(".banner-manager-tab .info-panel-wrapper .banner-info-panel .info-panel-form-wrapper #input_url input")
    },
    "select_input":{
        "location_id":document.querySelector(".banner-manager-tab .info-panel-wrapper .banner-info-panel .info-panel-form-wrapper #input_location select")
    },
    "image_input":{
        "image_path":{
            "display_element":document.querySelector(".banner-manager-tab .info-panel-wrapper .banner-info-panel .edit-image-wrapper img"),
            "input_element":document.querySelector(".banner-manager-tab .info-panel-wrapper .banner-info-panel .edit-image-wrapper input")
        }
    }
}

let bannerAddFormElements = {
    "input":{
        "banner_name":document.querySelector(".banner-manager-tab .info-panel-wrapper .add-banner-info-panel #input_banner_name input"),
        "url":document.querySelector(".banner-manager-tab .info-panel-wrapper .add-banner-info-panel #input_url input")
    },
    "select_input":{
        "location_id":document.querySelector(".banner-manager-tab .info-panel-wrapper .add-banner-info-panel #input_location select")
    },
    "image_input":{
        "image_path":{
            "display_element":document.querySelector(".banner-manager-tab .info-panel-wrapper .add-banner-info-panel .edit-image-wrapper img"),
            "input_element":document.querySelector(".banner-manager-tab .info-panel-wrapper .add-banner-info-panel .edit-image-wrapper input")
        }
    }
}


let featuredProductsRowsFillInfos = [
    "row_name",
    "row_id",
    "index",
    "row_description",
    "row_url"
]

let featuredProductsRowsEditFormElements = {
    "input":{
        "row_name":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .featured-row-info-panel .info-panel-form-wrapper #input_row_name input"),
        "row_description":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .featured-row-info-panel .info-panel-form-wrapper #input_row_description textarea"),
        "row_url":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .featured-row-info-panel .info-panel-form-wrapper #input_row_url input"),
        "index":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .featured-row-info-panel .info-panel-form-wrapper #input_index input")
    }
}

let featuredProductsRowsAddFormElements = {
    "input":{
        "row_name":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .add-featured-row-info-panel #input_row_name input"),
        "row_description":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .add-featured-row-info-panel #input_row_description textarea"),
        "row_url":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .add-featured-row-info-panel #input_row_url input"),
        "index":document.querySelector(".featured-products-manager-tab .info-panel-wrapper .add-featured-row-info-panel #input_index input")
    }
}
    

let fillInfos = {
    "Banners":{
        "row_infos":bannerFillInfos,
        "edit_elements":bannerEditFormElements
    },
    "AddBanners":{
        "edit_elements":bannerAddFormElements
    },
    "FeaturedProductsRows":{
        "row_infos":featuredProductsRowsFillInfos,
        "edit_elements":featuredProductsRowsEditFormElements
    },
    "AddFeaturedProductsRows":{
        "edit_elements":featuredProductsRowsAddFormElements
    }
}

let selectedDatas = {
    
}

function fillSelectedInfo(name,element){
    if (element.parentElement.selectedRow){
        element.parentElement.selectedRow.classList.remove("selected")
    }
    element.parentElement.selectedRow = element
    element.classList.add("selected")

    let rowInfos = fillInfos[`${name}`]["row_infos"]
    let editElements = fillInfos[`${name}`]["edit_elements"]

    if(!selectedDatas[`${name}`]){
        selectedDatas[`${name}`] = []
    }
    for (index in rowInfos){
        selectedDatas[`${name}`][`${rowInfos[index]}`] = element.querySelector(`[attrib='${rowInfos[index]}']`).getAttribute("value")
    }
    

    let inputElements = editElements["input"]
    for(index in inputElements){
        element = inputElements[index]
        element.value = selectedDatas[`${name}`][index]
    }
    
    let imageInputElements = editElements["image_input"]
    for(index in imageInputElements){
        displayElement = imageInputElements[index]["display_element"]
        displayElement.setAttribute('src',`../Public/img/${selectedDatas[name][index]}`)
    }

    let selectInputElements = editElements["select_input"]
    for(index in selectInputElements){
        element = selectInputElements[index]
        element.value = selectedDatas[`${name}`][index]
    }
}


let formOptions = {
    "EditBannerForm":{
        "edit":document.querySelector(".info-panel-wrapper .banner-info-panel .info-panel-form-options .edit-button")
    },
    "AddBannerForm":{
        "add":document.querySelector(".info-panel-wrapper .add-banner-info-panel .add-info-panel-form-options .add-button")
    },
    "EditFeaturedRowForm":{
        "edit":document.querySelector(".featured-row-info-panel .info-panel-form-options .edit-button")
    },
    "AddFeaturedRowForm":{
        "add":document.querySelector(".add-featured-row-info-panel .add-info-panel-form-options .add-button")
    },
    "EditFeaturedProductsTable":{
        "save":document.querySelector(".featured-rows-product-list-wrapper .save-button")
    },
}
function enableOptions(formName){
    let formOption = formOptions[formName]
    for (index in formOption){
        formOption[index].classList.remove("disabled")
    }
}

function disableOptions(formName){
    let formOption = formOptions[formName]
    for (index in formOption){
        formOption[index].classList.add("disabled")
    }
}

let isInfoPanelShown = []
function showInfoPanel(infoPanelName){
    if(!isInfoPanelShown[infoPanelName]){
        document.querySelector(`.tab-content .${infoPanelName} .inital-panel`).classList.add("hidden")
        document.querySelector(`.tab-content .${infoPanelName} .after-panel`).classList.remove("hidden")
        isInfoPanelShown[infoPanelName] = true
    }
}

function changeImage(element){
    let file = element.querySelector("input").files[0]
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
        let imgElement = element.querySelector("img")
        imgElement.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
}

function addBanner(element){
    if(!element.classList.contains("disabled")){
        let bannerData = selectedDatas["AddBanners"]
        let formData = fillInfos["AddBanners"]["edit_elements"]
        
        
        let bannerName = formData["input"]["banner_name"].value
        let location = formData["select_input"]["location_id"].value
        let bannerURL = formData["input"]["url"].value
        
        let bannerImage = formData["image_input"]["image_path"]["input_element"].files[0]
        
        
        if(bannerName==""){
            (new InputElement(formData["input"]["banner_name"].parentElement.parentElement)).showError("Vui lòng nhập tên banner")
            return
        }
        


        let reqData = new FormData()
        reqData.append("table","banners")
        reqData.append("banner_name",bannerName)
        reqData.append("location_id",location)
        reqData.append("url",bannerURL)


        if(bannerImage){
            let imgExtension = bannerImage.name.split(".")
            let newImgPath = `banners/${imgExtension[imgExtension.length-2].trim().toLowerCase()}.${imgExtension[imgExtension.length-1]}`
            reqData.append("image_path",bannerImage,newImgPath)
        }
        
        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/Add", true);
        req.send(reqData);
    }
    else{
        
    }
}

function editBanner(element){
    if(!element.classList.contains("disabled")){
        let bannerData = selectedDatas["Banners"]
        let formData = fillInfos["Banners"]["edit_elements"]
        
        
        let bannerID = bannerData["banner_id"]
        let bannerName = formData["input"]["banner_name"].value
        let location = formData["select_input"]["location_id"].value
        let bannerURL = formData["input"]["url"].value


        let bannerImage = formData["image_input"]["image_path"]["input_element"].files[0]
        
        if(bannerName==""){
            (new InputElement(formData["input"]["banner_name"].parentElement.parentElement)).showError("Vui lòng nhập tên banner")
            return
        }
        


        let reqData = new FormData()
        reqData.append("table","banners")
        reqData.append("table_id","banner_id")
        reqData.append("banner_id",bannerID)
        reqData.append("banner_name",bannerName)
        reqData.append("location_id",location)
        reqData.append("url",bannerURL)

        if(bannerImage){
            let imgExtension = bannerImage.name.split(".")
            let newImgPath = `banners/${imgExtension[imgExtension.length-2].trim().toLowerCase()}.${imgExtension[imgExtension.length-1]}`
            reqData.append("image_path",bannerImage,newImgPath)
        }
        
        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                console.log(responseData)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/Update", true);
        req.send(reqData);
    }
    else{
        
    }
}

function removeBanner(element){
    if(!element.classList.contains("disabled")){
        let bannerData = selectedDatas["Banners"]
        
        
        let bannerID = bannerData["banner_id"]
        
        let reqData = new FormData()
        reqData.append("table","banners")
        reqData.append("table_id","banner_id")
        reqData.append("banner_id",bannerID)
        
        
        
        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                console.log(responseData)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/Delete", true);
        if(confirm("Xác nhận xóa hình"))
            req.send(reqData);
    }
    else{
        
    }
}



function addFeaturedRow(element){
    if(!element.classList.contains("disabled")){
        let formData = fillInfos["AddFeaturedProductsRows"]["edit_elements"]
        
        
        let rowName = formData["input"]["row_name"].value
        let rowURL = formData["input"]["row_url"].value
        let rowDescription = formData["input"]["row_description"].value
        let rowIndex = formData["input"]["index"].value
        
        
        
        if(rowName==""){
            (new InputElement(formData["input"]["row_name"].parentElement.parentElement)).showError("Vui lòng nhập tên cho dòng trưng bày")
            return
        }
        if(isNaN(rowIndex)||rowIndex==""){
            (new InputElement(formData["input"]["index"].parentElement.parentElement)).showError("Vị trí phải là số")
            return
        }
        


        let reqData = new FormData()
        reqData.append("table","featured_products_rows")
        reqData.append("row_name",rowName)
        reqData.append("row_description",rowDescription)
        reqData.append("row_url",rowURL)
        reqData.append("index",rowIndex)

        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/Add", true);
        req.send(reqData);
    }
    else{
        
    }
}

function editFeaturedRow(element){
    if(!element.classList.contains("disabled")){
        let rowData = selectedDatas["FeaturedProductsRows"]
        let formData = fillInfos["FeaturedProductsRows"]["edit_elements"]
        
        let rowID = rowData["row_id"];
        let rowName = formData["input"]["row_name"].value
        let rowURL = formData["input"]["row_url"].value
        let rowDescription = formData["input"]["row_description"].value
        let rowIndex = formData["input"]["index"].value
        
        
        
        if(rowName==""){
            (new InputElement(formData["input"]["row_name"].parentElement.parentElement)).showError("Vui lòng nhập tên cho dòng trưng bày")
            return
        }
        if(isNaN(rowIndex)||rowIndex==""){
            (new InputElement(formData["input"]["index"].parentElement.parentElement)).showError("Vị trí phải là số")
            return
        }
        


        let reqData = new FormData()
        reqData.append("table","featured_products_rows")
        reqData.append("table_id","row_id")
        reqData.append("row_id",rowID)
        reqData.append("row_name",rowName)
        reqData.append("row_description",rowDescription)
        reqData.append("row_url",rowURL)
        reqData.append("index",rowIndex)
        
        
        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                console.log(responseData)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/Update", true);
        req.send(reqData);
    }
    else{
        
    }
}

function removeFeaturedRow(element){
    if(!element.classList.contains("disabled")){
        let rowData = selectedDatas["FeaturedProductsRows"]
        
        
        let rowID = rowData["row_id"]
        
        let reqData = new FormData()
        reqData.append("table","featured_products_rows")
        reqData.append("table_id","row_id")
        reqData.append("row_id",rowID)
        
        
        
        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                console.log(responseData)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/Delete", true);
        if(confirm("Xác nhận xóa hình"))
            req.send(reqData);
    }
    else{
        
    }
}

function getRowElementValue(element,attribute){
    return element.querySelector(`.row-element[attrib='${attribute}']`).getAttribute("value")
}

function getFeaturedProducts(element){
    let rowID = getRowElementValue(element,"row_id")
    let reqData = new FormData()
    reqData.append("row_id",rowID)

    let req = new XMLHttpRequest()
    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let productImageListElement = document.querySelector(".featured-products-manager-tab .featured-rows-product-list-wrapper .featured-products-rows-detail-table .row-list")
            productImageListElement.innerHTML = ""
            productImageListElement.innerHTML = this.responseText
        }
    };
    req.open("POST", "../DataRequest/GetFeaturedRowsData", true);
    req.send(reqData);
}

let addProductTableElement = document.querySelector(".featured-products-manager-tab .featured-rows-product-list-wrapper .featured-products-rows-detail-table")
let draggableProductTableElement = document.querySelector(".featured-products-manager-tab .draggable-products-table")
function addProductDragStart(event,element){
    
    let productID = getRowElementValue(element,"product_id")
    let productName = getRowElementValue(element,"product_name")

    event.dataTransfer.setData("product_id",productID)
    event.dataTransfer.setData("product_name",productName)
    event.dataTransfer.setData("action","add")

    
    addHighlight(addProductTableElement)
}

function addProductDragOver(event,element){
    event.preventDefault()
}

function addProductDragLeave(event,element){
    if(event.dataTransfer.getData("action")!="add"){
        return
    }

    removeHighlight(element)
}

function addProductOnDrop(event,element){
    event.preventDefault()
    
    if(event.dataTransfer.getData("action")!="add"){
        return
    }

    removeHighlight(element)
    let productID = event.dataTransfer.getData("product_id")
    let productName = event.dataTransfer.getData("product_name")

    let rowElementHTML = `
        <div class="table-row no-user-select" draggable="true" ondragstart="removeProductDragStart(event,this)">
            <div class="row-element" attrib="product_name" value="${productName}">
                ${productName}         
            </div>
            <div class="row-element hidden" attrib="product_id" value="${productID}">
                ${productID}
            </div>
        </div>
    `

    let rowListElement =  addProductTableElement.querySelector(".row-list")

    let hasItem = false
    idAttribs = rowListElement.querySelectorAll(".row-element[attrib='product_id']")


    idAttribs.forEach((item)=>{
        if(item.getAttribute("value")==productID){
            hasItem=true
        }
    })
    if(!hasItem){
        rowListElement.innerHTML += rowElementHTML
    }
    enableOptions("EditFeaturedProductsTable")
}

let removeDraggedProduct = null
function removeProductDragStart(event,element){
    removeDraggedProduct = element
    addHighlight(draggableProductTableElement)
    event.dataTransfer.setData("action","remove")
}

function removeProductDragOver(event,element){
    event.preventDefault()
}

function removeProductDragLeave(event,element){
    if(event.dataTransfer.getData("action")!="remove"){
        return
    }

    removeHighlight(element)
}

function removeProductOnDrop(event,element){
    event.preventDefault()
    
    if(event.dataTransfer.getData("action")!="remove"){
        return
    }
    enableOptions("EditFeaturedProductsTable")
    removeHighlight(element)
    removeDraggedProduct.remove()
}

function addHighlight(element){
    if(!element.isHighlighted){
        element.classList.add("highlight")
        element.isHighlighted=true
    }
}

function removeHighlight(element){
    if(element.isHighlighted){
        element.classList.remove("highlight")
        element.isHighlighted=false
    }
}



function saveProductListChanges(element){
    if(!element.classList.contains("disabled")){
        let tableListElement = document.querySelector(".featured-products-manager-tab .featured-rows-product-list-wrapper .featured-products-rows-detail-table .row-list")
        
        let featuredRow = selectedDatas["FeaturedProductsRows"]["row_id"]

        let productIdList = []
        tableListElement.querySelectorAll(".row-element[attrib='product_id']").forEach((item)=>{
            productIdList.push(item.getAttribute("value"))
        })

        let reqData = new FormData()
        reqData.append("featured_row",featuredRow);
        reqData.append("product_id_list",JSON.stringify(productIdList))
        
        
        
        let req = new XMLHttpRequest()
        req.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                console.log(responseData)
                if(responseData["status"]=="success"){
                    window.location.reload()
                }
            }
        };
        req.open("POST", "../DataRequest/UpdateFeaturedProducts", true);
        if(confirm("Xác nhận cập nhật"))
            req.send(reqData);
    }
    else{
        
    }
}