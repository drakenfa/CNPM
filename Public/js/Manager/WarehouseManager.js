
let selectedItem = null;
let selectedElement = null;
function fillSelectedData(element){
    const productID = element.querySelector(".row-element[attrib='product_id']").getAttribute("value")
    const skuID = element.querySelector(".row-element[attrib='sku_name']").getAttribute("value")

    selectedItem = {
        'product_id':productID,
        'sku_id':skuID
    }

    document.querySelector('.no-product-select-tab').classList.add('hidden')
    document.querySelector('.no-product-select-tab .message').classList.add('hidden')
    document.querySelector('.product-info-tab-wrapper').classList.remove('hidden')

    if(selectedElement!=null){
        selectedElement.classList.remove('selected')
    }
    selectedElement=element
    selectedElement.classList.add('selected')

    getProductData(productID,skuID)
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

function showMoreProducts(element){
    if(!element.index){
        element.index = 1;
    }
    console.log(element.index)
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    searchParams.append("page",element.index)
    
    let req = new XMLHttpRequest()
    req.onreadystatechange = function(){
        if (this.readyState == 4 && this.status == 200) {
            let responseData = JSON.parse(this.responseText)
            let productsHTML = responseData["ProductsHTML"]
            let isLastProduct = responseData["StatusData"]["IsLast"]
            
            let productListElement = document.querySelector(".product-tab .product-list .product-list-container")
            productListElement.innerHTML+= productsHTML
            element.index++
            if(isLastProduct){
                element.style.display = "none"
            }
        }
    }
    req.open("GET", `../InternalManager/GetMoreProductWarehouse?${encodeURI(searchParams.toString())}`, true);
    req.send();
}

function getProductData(productID,skuID){
    let formData = new FormData()
    formData.append("product_id",selectedItem["product_id"])
    formData.append("sku_id",selectedItem["sku_id"])
    let req = new XMLHttpRequest()
    req.onreadystatechange = function(){
        if (this.readyState == 4 && this.status == 200) {
            
            let productListElement = document.querySelector(".product-info-tab-wrapper .product-info-list-wrapper .product-info-list")
            productListElement.innerHTML= this.responseText
        }
    }
    req.open("POST","../DataRequest/GetProductShipments")
    req.send(formData)
}