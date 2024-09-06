let productInfo = {}
let currentSelectedProduct = null
function fillSelectedData(element){
    let imgPath = element.querySelector(".hidden span[attrib='thumbnail']").getAttribute("value")
    let productName = element.querySelector(".row-element[attrib='product_name']").getAttribute("value")
    let description = element.querySelector(".hidden span[attrib='description']").getAttribute("value")
    let productPrice = element.querySelector(".row-element[attrib='price']").getAttribute("value")
    let categoryID = element.querySelector(".row-element[attrib='category_name']").getAttribute("value")
    let brandID = element.querySelector(".row-element[attrib='brand_name']").getAttribute("value")
    let guarantee = element.querySelector(".hidden span[attrib='guarantee']").getAttribute("value")
    let productID = element.querySelector(".row-element[attrib='product_id']").getAttribute("value")

    productInfo={
        "product_id":productID,
        "thumbnail":imgPath,
        "product_name":productName,
        "description":description,
        "category_id":categoryID,
        "brand_id":brandID,
        "price":productPrice,
        "guarantee":guarantee
    }

    fillProductInfo()
    disableEdit()


    if(currentSelectedProduct){
        currentSelectedProduct.classList.remove("selected")
    }
    element.classList.add("selected")
    currentSelectedProduct = element

    isChanged = false

    let infoPanelElement = document.querySelector(".tab-content-wrapper .info-panel")
    infoPanelElement.querySelector("#remove-product-button").classList.remove("disabled")

    getProductSKUs(productID)
    getProductImages(productID)
    getProductOptions(productID)

    document.querySelector(".sku-panel .sku-info-options .add-sku").classList.remove("disabled")
    currentSelectedSKU = null
    disableSkuOptions()
    disableProductImageOptions()
    disableProductOptionOptions()

    document.querySelector(".info-tab-list .product-info-tab-wrapper").classList.remove("hidden")
    document.querySelector(".info-tab-list .no-product-select-tab").classList.add("hidden")
    document.querySelector(".info-tab-list .no-product-select-tab .message").classList.add("hidden")
}

function fillProductInfo(){
    document.querySelector(".product-info-tab .tab-content-wrapper .product-img-wrapper input").value=null
    if(productInfo){
        let infoPanelElement = document.querySelector(".tab-content-wrapper .info-panel")
        infoPanelElement.querySelector(".product-img-wrapper img").setAttribute("src",productInfo["thumbnail"])
    
        infoPanelElement.querySelector(".product-info-wrapper .c-input#input-product-name textarea").value=productInfo["product_name"]
        infoPanelElement.querySelector(".product-info-wrapper .c-input#input-description textarea").value=productInfo["description"]
        
        infoPanelElement.querySelectorAll(".product-info-wrapper .c-input#input-category-id select option").forEach((item)=>{
            if(item.value==productInfo["category_id"]){
                item.setAttribute("selected",true)
            }
            else{
                item.removeAttribute("selected")
            }
        })
        infoPanelElement.querySelectorAll(".product-info-wrapper .c-input#input-brand-id select option").forEach((item)=>{
            if(item.value==productInfo["brand_id"]){
                item.setAttribute("selected",true)
            }
            else{
                item.removeAttribute("selected")
            }
        })
    
        let priceInputElement = infoPanelElement.querySelector(".product-info-wrapper .c-input#input-price input")
        priceInputElement.value = `${Number(productInfo["price"]).toLocaleString()}₫`
        priceInputElement.trueValue = productInfo["price"]

        let guaranteeInputElement = infoPanelElement.querySelector(".product-info-wrapper .c-input#input-guarantee input")
        guaranteeInputElement.value =`${Number(productInfo["guarantee"]).toLocaleString()} tháng`
        guaranteeInputElement.trueValue = productInfo["guarantee"]
    }
}

let isChanged = false;
function removeChange(){
    fillProductInfo()
    disableEdit()
}

function changeImageInput(element){
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

function formatPrice(element){
    let trimmedValue = element.value.replaceAll(".","")
    trimmedValue = trimmedValue.replaceAll(",","")
    trimmedValue = trimmedValue.replace("₫","")
    if(!isNaN(trimmedValue) && trimmedValue != ""){    
        element.trueValue = trimmedValue
        element.value=`${Number(trimmedValue).toLocaleString("en", {   
            minimumFractionDigits: 0,
            maximumFractionDigits: 0,
        })}₫`
        return true
    }
    else{
        element.value=`${Number(productInfo["price"]).toLocaleString("en", {   
            minimumFractionDigits: 0,
            maximumFractionDigits: 0,
        })}₫`
        return false;
    }
}

function formatPrice2(element){
    let trimmedValue = element.value.replaceAll(".","")
    trimmedValue = trimmedValue.replaceAll(",","")
    trimmedValue = trimmedValue.replace("₫","")
    if(!isNaN(trimmedValue) && trimmedValue != ""){    
        element.trueValue = trimmedValue
        element.value=`${Number(trimmedValue).toLocaleString("en", {   
            minimumFractionDigits: 0,
            maximumFractionDigits: 0,
        })}₫`
        return true
    }
    else{
        element.value=`${Number("100").toLocaleString("en", {   
            minimumFractionDigits: 0,
            maximumFractionDigits: 0,
        })}₫`
        return false;
    }
}

function formatGuarantee(element){
    let trimmedValue = element.value.replace(" tháng","")

    console.log(trimmedValue)
    if(!isNaN(trimmedValue) && trimmedValue != ""){    
        element.trueValue = trimmedValue
        element.value=`${trimmedValue} tháng`
        return true;
    }
    else{
        element.value=`${Number(productInfo["guarantee"])} tháng`
        return false;
    }
}

function formatGuarantee2(element){
    let trimmedValue = element.value.replace(" tháng","")

    if(!isNaN(trimmedValue) && trimmedValue != ""){    
        element.trueValue = trimmedValue
        element.value=`${trimmedValue} tháng`
        return true;
    }
    else{
        element.value=`1 tháng`
        element.trueValue = 1
        return false;
    }
}

function enableEdit(){
    if(!isChanged){
        isChanged = true
        let infoPanelElement = document.querySelector(".product-info-tab .tab-content-wrapper .info-panel")
        infoPanelElement.querySelector("#edit-product-button").classList.remove("disabled")
        infoPanelElement.querySelector("#cancel-edit-button").classList.remove("disabled")
    }
}

function disableEdit(){
    if(isChanged){
        isChanged = false
        let infoPanelElement = document.querySelector(".product-info-tab .tab-content-wrapper .info-panel")
        infoPanelElement.querySelector("#edit-product-button").classList.add("disabled")
        infoPanelElement.querySelector("#cancel-edit-button").classList.add("disabled")
    }
}

function editProduct(element){
    if(isChanged && !element.classList.contains("disabled")){
        let productID = productInfo["product_id"]
        let infoPanelElement = document.querySelector(".product-info-tab .tab-content-wrapper")
        let productNameElement = new InputElement(infoPanelElement.querySelector('.c-input#input-product-name'))
        let productName = productNameElement.getInputValue()
        let descriptionElement = new InputElement(infoPanelElement.querySelector(".c-input#input-description"))
        let description = descriptionElement.getInputValue()
        let categoryID = infoPanelElement.querySelector(".c-input#input-category-id select").value
        let brandID = infoPanelElement.querySelector(".c-input#input-brand-id select").value
        let price = infoPanelElement.querySelector(".c-input#input-price input").trueValue
        let guarantee = infoPanelElement.querySelector(".c-input#input-guarantee input").trueValue
        
        let productImage = infoPanelElement.querySelector(".product-img-wrapper input").files[0]
        
        if(productName==""){
            productNameElement.showError("Tên sản phẩm không được để trống")
            return
        }
        if(description==""){
            descriptionElement.showError("Mô tả không được để trống")
            return
        }
        if(!price){
            (new InputElement(infoPanelElement.querySelector(".c-input#input-price"))).showError("Giá sản phẩm không được để trống")
            return
        }
        if(!guarantee){
            (new InputElement(infoPanelElement.querySelector(".c-input#input-guarantee"))).showError("Năm bảo hành phải lớn hơn 0")
            return
        }

        let reqData = new FormData()
        reqData.append("table","products")
        reqData.append("table_id","product_id")
        reqData.append("product_id",productID)
        reqData.append("product_name",productName)
        reqData.append("category_id",categoryID)
        reqData.append("brand_id",brandID)
        reqData.append("description",description)
        reqData.append("price",price)
        reqData.append("guarantee",guarantee)

        if(productImage){
            let imgExtension = productImage.name.split(".")
            let newImgPath = `${categoryID}/${imgExtension[imgExtension.length-2].trim().toLowerCase()}.${imgExtension[imgExtension.length-1]}`
            reqData.append("thumbnail",productImage,newImgPath)
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

function removeProduct(element){
    if(!element.classList.contains("disabled")){
        let productID = productInfo["product_id"]
        
        let reqData = new FormData()
        reqData.append("table","products")
        reqData.append("table_id","product_id")
        reqData.append("product_id",productID)
        
        
        
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
        if(confirm("Xác nhận xóa sản phẩm"))
            req.send(reqData);
    }
    else{
        
    }
}

function addProduct(element){
    if(!element.classList.contains("disabled")){
        let infoPanelElement = document.querySelector(".add-products-tab .tab-content-wrapper")
        let productNameElement = new InputElement(infoPanelElement.querySelector('.c-input#input-product-name'))
        let productName = productNameElement.getInputValue()
        let descriptionElement = new InputElement(infoPanelElement.querySelector(".c-input#input-description"))
        let description = descriptionElement.getInputValue()

        let categoryID = infoPanelElement.querySelector(".c-input#input-category-id select").value
        let brandID =infoPanelElement.querySelector(".c-input#input-brand-id select").value

        let price = infoPanelElement.querySelector(".c-input#input-price input").trueValue
        let guarantee = infoPanelElement.querySelector(".c-input#input-guarantee input").trueValue
        
        let productImage = infoPanelElement.querySelector(".product-img-wrapper input").files[0]
        
        if(productName==""){
            productNameElement.showError("Tên sản phẩm không được để trống")
            return
        }
        if(description==""){
            descriptionElement.showError("Mô tả không được để trống")
            return
        }
        if(!price){
            (new InputElement(infoPanelElement.querySelector(".c-input#input-price"))).showError("Giá sản phẩm không được để trống")
            return
        }
        if(!guarantee){
            (new InputElement(infoPanelElement.querySelector(".c-input#input-guarantee"))).showError("Năm bảo hành phải lớn hơn 0")
            return
        }

        let reqData = new FormData()
        reqData.append("table","products")
        reqData.append("product_name",productName)
        reqData.append("category_id",categoryID)
        reqData.append("brand_id",brandID)
        reqData.append("description",description)
        reqData.append("price",price)
        reqData.append("guarantee",guarantee)

        if(productImage){
            let imgExtension = productImage.name.split(".")
            let newImgPath = `${categoryID}/${imgExtension[imgExtension.length-2].trim().toLowerCase()}.${imgExtension[imgExtension.length-1]}`
            reqData.append("thumbnail",productImage,newImgPath)
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

function showInfoPanel(element){
    let panelName = element.getAttribute("panel")
    let infoTabElement = document.querySelector(".tab .products-tab  .product-info-tab")
    infoTabElement.querySelectorAll(".tab-content-wrapper .info-tab-content").forEach((item)=>{
        if(item.classList.contains(panelName)){
            item.classList.remove("hidden")
        }
        else{
            item.classList.add("hidden")
        }
    })

    element.parentElement.querySelectorAll(".option").forEach((item)=>{
        if(item == element){
            item.classList.add("selected")
        }
        else{
            item.classList.remove("selected")
        }
    })
}

function showInfoTab(element){
    let panelName = element.getAttribute("panel")
    let infoTabElement = document.querySelector(".tab .info-tab-list")
    infoTabElement.querySelectorAll(".info-tab").forEach((item)=>{
        if(item.classList.contains(panelName)){
            item.classList.remove("hidden")
        }
        else{
            item.classList.add("hidden")
        }
    })

    element.parentElement.querySelectorAll(".option").forEach((item)=>{
        if(item == element){
            item.classList.add("selected")
        }
        else{
            item.classList.remove("selected")
        }
    })
}
let currentSelectedSKU = null
function enableSkuOptions(element){            
    let skuOptionsElement = document.querySelector(".sku-panel .sku-info-options")
    skuOptionsElement.querySelector(".edit-sku").classList.remove("disabled")
    skuOptionsElement.querySelector(".remove-sku").classList.remove("disabled")
    if(currentSelectedSKU){
        currentSelectedSKU.classList.remove("selected")
    }
    element.classList.add("selected")
    currentSelectedSKU = element
}

function disableSkuOptions(){            
    let skuOptionsElement = document.querySelector(".sku-panel .sku-edit-form .sku-info-options")
    skuOptionsElement.querySelector(".edit-sku").classList.add("disabled")
    skuOptionsElement.querySelector(".remove-sku").classList.add("disabled")

    let infoPanelElement = document.querySelector(".sku-panel .sku-edit-form")
    let skuCodeElement = new InputElement(infoPanelElement.querySelector('.c-input#input-sku-code'))
    skuCodeElement.setInputValue("")
    let skuNameElement = new InputElement(infoPanelElement.querySelector(".c-input#input-sku-name"))
    skuNameElement.setInputValue("")

    infoPanelElement = document.querySelector(".sku-panel .sku-add-form")
    skuCodeElement = new InputElement(infoPanelElement.querySelector('.c-input#input-sku-code'))
    skuCodeElement.setInputValue("")
    skuNameElement = new InputElement(infoPanelElement.querySelector(".c-input#input-sku-name"))
    skuNameElement.setInputValue("")
}
function getProductSKUs(productID){
    let reqData = new FormData()
    reqData.append("product_id",productID)

    let req = new XMLHttpRequest()
    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let skuListElement = document.querySelector(".product-info-tab .info-tab-content .sku-table-wrapper .sku-list")
            skuListElement.innerHTML = ""
            skuListElement.innerHTML = this.responseText
        }
    };
    req.open("POST", "../DataRequest/GetProductSKUs", true);
    req.send(reqData);
    disableSkuOptions();
    skuInfo=null
}

function addSKU(element){
    if(!element.classList.contains("disabled")){
        let infoPanelElement = document.querySelector(".sku-panel .sku-add-form")
        let skuCodeElement = new InputElement(infoPanelElement.querySelector('.c-input#input-sku-code'))
        let skuCode = skuCodeElement.getInputValue()
        let skuNameElement = new InputElement(infoPanelElement.querySelector(".c-input#input-sku-name"))
        let skuName = skuNameElement.getInputValue()

        if(skuCode==""){
            skuCodeElement.showError("Mã đơn vị không được để trống")
            return
        }
        if(skuName==""){
            descriptionElement.showError("Tên đơn vị không được để trống")
            return
        }

        let checkReqData = new FormData()
        checkReqData.append("table","skus join products on skus.product_id = products.product_id")
        checkReqData.append("table_id","sku_code")
        checkReqData.append("sku_code",skuCode)
        checkReqData.append("exist_column","product_name")
        
        let checkReq = new XMLHttpRequest()
        checkReq.onreadystatechange = function() {
            print(this.responseText)
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText)
                let responseData = JSON.parse(this.responseText)
                if(responseData["status"]=="key_exists"){
                    alert("Mã SKU bị trùng với sản phẩm: "+responseData["key_value"])
                }
            }
        };
        // checkReq.open("POST", "../DataRequest/CheckExist", true);
        // checkReq.send(checkReqData)

        let reqData = new FormData()
        reqData.append("table","skus")
        reqData.append("sku_code",skuCode)
        reqData.append("sku_name",skuName)
        reqData.append("product_id",productInfo["product_id"])
        
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

function editSKU(element){
    if(!element.classList.contains("disabled")){
        let skuID = skuInfo["sku_id"]
        let infoPanelElement = document.querySelector(".sku-panel .sku-edit-form")
        let skuCodeElement = new InputElement(infoPanelElement.querySelector('.c-input#input-sku-code'))
        let skuCode = skuCodeElement.getInputValue()
        let skuNameElement = new InputElement(infoPanelElement.querySelector(".c-input#input-sku-name"))
        let skuName = skuNameElement.getInputValue()

        if(skuCode==""){
            skuCodeElement.showError("Mã đơn vị không được để trống")
            return
        }
        if(skuName==""){
            descriptionElement.showError("Tên đơn vị không được để trống")
            return
        }

        let reqData = new FormData()
        reqData.append("table","skus")
        reqData.append("table_id","sku_id")
        reqData.append("sku_id",skuID)
        reqData.append("sku_code",skuCode)
        reqData.append("sku_name",skuName)
        
        
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

function removeSKU(element){
    if(!element.classList.contains("disabled")){
        let skuID = skuInfo["sku_id"]
        
        let reqData = new FormData()
        reqData.append("table","skus")
        reqData.append("table_id","sku_id")
        reqData.append("sku_id",skuID)
        
        
        
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
        if(confirm("Xác nhận xóa đơn vị"))
            req.send(reqData);
    }
    else{
        
    }
}

let skuInfo = null
function fillSkuEditInfo(element){
    let skuCode = element.querySelector(".row-element[attrib='sku_code']").getAttribute("value")
    let skuName = element.querySelector(".row-element[attrib='sku_name']").getAttribute("value")
    let skuID = element.querySelector(".hidden span[attrib='sku_id']").getAttribute("value")

    let skuEditFormElement = document.querySelector(".sku-panel .sku-info-form-wrapper .sku-edit-form")
    skuEditFormElement.querySelector(".c-input#input-sku-code input").value=skuCode
    skuEditFormElement.querySelector(".c-input#input-sku-name input").value=skuName

    enableSkuOptions(element);

    skuInfo= {
        "sku_code":skuCode,
        "sku_name":skuName,
        "sku_id":skuID
    }
}




function setFilter(filterElement, filterValue){
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
        if(searchParams.has(filterElement)){
            if(filterValue != ""){
                searchParams.set(filterElement,filterValue)
            }
            else{
                searchParams.delete(filterElement)
            }
        }
        else{
            searchParams.append(filterElement,filterValue)
        }
    let redirectURL = `${window.location.href.replace(window.location.search,"")}`
    if(searchParams.size>0){
        redirectURL+=`?${encodeURI(searchParams.toString())}`
    }
    window.location.replace(redirectURL)
}

function getProductImages(productID){
    let reqData = new FormData()
    reqData.append("product_id",productID)

    let req = new XMLHttpRequest()
    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let productImageListElement = document.querySelector(".product-images-panel .product-image-list")
            productImageListElement.innerHTML = ""
            productImageListElement.innerHTML = this.responseText
        }
    };
    req.open("POST", "../DataRequest/GetProductImages", true);
    req.send(reqData);
    disableProductOptionOptions();
    productOptionInfo=null
}

let productImageInfo = null
function fillProductImageEditInfo(element){
    let productID = element.querySelector(".hidden span[attrib='product_id']").getAttribute("value")
    let productImageID = element.querySelector(".hidden span[attrib='product_image_id']").getAttribute("value")
    let imgDir = element.querySelector(".row-element[attrib='image_url']").getAttribute("value")

    enableProductImageOptions(element);

    productImageInfo = {
        "product_id":productID,
        "product_image_id":productImageID,
        "image_url":imgDir
    }

    let imagePreviewElement = document.querySelector(".product-images-panel .image-preview-wrapper img")
    imagePreviewElement.setAttribute("src",`../Public/img/products/${imgDir}`)
}

let currentSelectedProductImg = null
function enableProductImageOptions(element){            
    let optionElement = document.querySelector(".product-images-panel .product-image-options")
    optionElement.querySelector(".rem-img").classList.remove("disabled")
    if(currentSelectedProductImg){
        currentSelectedProductImg.classList.remove("selected")
    }
    element.classList.add("selected")
    currentSelectedProductImg = element
}

function disableProductImageOptions(){            
    let optionElement = document.querySelector(".product-images-panel .product-image-options")
    optionElement.querySelector(".rem-img").classList.add("disabled")

    let imagePreviewElement = document.querySelector(".product-images-panel .image-preview-wrapper img")
    imagePreviewElement.setAttribute("src","../Public/img/products/_common/not-found.png")
}

function addProductImage(element){

    let reqData = new FormData()
    reqData.append("table","product_images")
    reqData.append("product_id",productInfo["product_id"])
    
    let imgExtension = element.name.split(".")
    let newImgPath = `${productInfo["category_id"]}/${productInfo["product_id"]}/${imgExtension[imgExtension.length-2].trim().toLowerCase()}.${imgExtension[imgExtension.length-1]}`
    reqData.append("image_url",element,newImgPath)

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

function removeProductImage(element){
    if(!element.classList.contains("disabled")){
        let productImageID = productImageInfo["product_image_id"]
        
        let reqData = new FormData()
        reqData.append("table","product_images")
        reqData.append("table_id","product_image_id")
        reqData.append("product_image_id",productImageID)
        
        
        
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
        req.open("POST", "../DataRequest/TrueDelete", true);
        if(confirm("Xác nhận xóa hình ảnh"))
            req.send(reqData);
    }
    else{
        
    }
}



function getProductOptions(productID){
    let reqData = new FormData()
    reqData.append("product_id",productID)

    let req = new XMLHttpRequest()
    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let productImageListElement = document.querySelector(".product-options-panel .product-options-list")
            productImageListElement.innerHTML = ""
            productImageListElement.innerHTML = this.responseText
        }
    };
    req.open("POST", "../DataRequest/GetProductOptions", true);
    req.send(reqData);
    disableProductOptionOptions();
    productImageInfo=null
}

let productOptionInfo = null
function fillOptionEditInfo(element){
    let productID = productInfo["product_id"]
    let optionName = element.querySelector(".row-element[attrib='option_name']").getAttribute("value")
    let optionValue = element.querySelector(".hidden span[attrib='option_value']").getAttribute("value")
    let productOptionID = element.querySelector(".hidden span[attrib='option_id']").getAttribute("value")

    enableProductOptionOptions(element);

    productOptionInfo = {
        "product_id":productID,
        "option_id":productOptionID,
        "option_name":optionName,
        "option_value":optionValue
    }
    
    let optionEditFormElement = document.querySelector(".product-options-panel .option-edit-form")
    optionEditFormElement.querySelector(".c-input#input-option-name input").value=optionName
    optionEditFormElement.querySelector(".c-input#input-option-value textarea").value=optionValue
}

let currentSelectedOption = null
function enableProductOptionOptions(element){
    let optionOptionsElement = document.querySelector(".product-options-panel .option-info-options")
    optionOptionsElement.querySelector(".edit-option").classList.remove("disabled")
    optionOptionsElement.querySelector(".remove-option").classList.remove("disabled")
    if(currentSelectedOption){
        currentSelectedOption.classList.remove("selected")
    }
    element.classList.add("selected")
    currentSelectedOption = element
}

function disableProductOptionOptions(){
    let optionOptionsElement = document.querySelector(".product-options-panel .option-edit-form .option-info-options")
    optionOptionsElement.querySelector(".edit-option").classList.add("disabled")
    optionOptionsElement.querySelector(".remove-option").classList.add("disabled")

    let infoPanelElement = document.querySelector(".product-options-panel .option-edit-form")
    let skuCodeElement = new InputElement(infoPanelElement.querySelector('.c-input#input-option-name'))
    skuCodeElement.setInputValue("")
    let skuNameElement = new InputElement(infoPanelElement.querySelector(".c-input#input-option-value"))
    skuNameElement.setInputValue("")

    infoPanelElement = document.querySelector(".product-options-panel .option-add-form")
    skuCodeElement = new InputElement(infoPanelElement.querySelector('.c-input#input-option-name'))
    skuCodeElement.setInputValue("")
    skuNameElement = new InputElement(infoPanelElement.querySelector(".c-input#input-option-value"))
    skuNameElement.setInputValue("")
}

function editOption(element){
    if(!element.classList.contains("disabled")){
        let option_id = productOptionInfo["option_id"]
        let infoPanelElement = document.querySelector(".product-options-panel .option-edit-form")
        let optionNameElement = new InputElement(infoPanelElement.querySelector('.c-input#input-option-name'))
        let optionName = optionNameElement.getInputValue()
        let optionValueElement = new InputElement(infoPanelElement.querySelector(".c-input#input-option-value"))
        let optionValue = optionValueElement.getInputValue()

        if(optionName==""){
            optionNameElement.showError("Tên thông số không được để trống")
            return
        }
        if(optionValue==""){
            optionValueElement.showError("Mô tả không được để trống")
            return
        }

        let reqData = new FormData()
        reqData.append("table","options")
        reqData.append("table_id","option_id")
        reqData.append("option_id",option_id)
        reqData.append("option_name",optionName)
        reqData.append("option_value",optionValue)
        
        
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

function removeOption(element){
    if(!element.classList.contains("disabled")){
        let optionID = productOptionInfo["option_id"]
        
        let reqData = new FormData()
        reqData.append("table","options")
        reqData.append("table_id","option_id")
        reqData.append("option_id",optionID)
        
        
        
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
        req.open("POST", "../DataRequest/Delete", true);
        if(confirm("Xác nhận xóa thông số"))
            req.send(reqData);
    }
    else{
        
    }
}

function addOption(element){
    if(!element.classList.contains("disabled")){
        let infoPanelElement = document.querySelector(".product-options-panel .option-add-form")
        let optionNameElement = new InputElement(infoPanelElement.querySelector('.c-input#input-option-name'))
        let optionName = optionNameElement.getInputValue()
        let optionValueElement = new InputElement(infoPanelElement.querySelector(".c-input#input-option-value"))
        let optionValue = optionValueElement.getInputValue()

        if(optionName==""){
            optionNameElement.showError("Tên thông số không được để trống")
            return
        }
        if(optionValue==""){
            optionValueElement.showError("Mô tả không được để trống")
            return
        }

        let reqData = new FormData()
        reqData.append("table","options")
        reqData.append("option_name",optionName)
        reqData.append("option_value",optionValue)
        reqData.append("product_id",productInfo["product_id"])
        
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