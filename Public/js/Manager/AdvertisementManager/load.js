let searchBar = document.querySelector(".featured-products-manager-tab .draggable-product-list-panel .product-search-option input")

searchBar.addEventListener("keydown", function(e){
    if(e.key == "Enter"){
        SearchProduct(searchBar.value)
    }
})

let storedParams = [];
let storedKeys = ["action","selected-product"]
storeParamsInit()
function storeParamsInit(){
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    for (index in storedKeys){
        if(searchParams.get(storedKeys[index])){
            storedParams[storedKeys[index]]=searchParams.get(storedKeys[index])
        }
    }
}
function storeParams(name,value){
    storedParams[name]=value
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
            
            let productListElement = document.querySelector(".featured-products-manager-tab .draggable-products-table .row-list")
            productListElement.innerHTML+= productsHTML
            element.index++
            if(isLastProduct){
                element.style.display = "none"
            }
        }
    }
    req.open("GET", `../InternalManager/AdvertisementGetMoreProducts?${encodeURI(searchParams.toString())}`, true);
    req.send();
}

function SearchProduct(searchValue){
    let urlParams = new URLSearchParams()
    if(searchValue){
        urlParams.append("search-query",searchValue)
    }
    for (index in storedParams){
        if(urlParams.get(index)){
            urlParams.delete(index)
        }
        urlParams.append(index,storedParams[index])
    }
    let forwardURL = `../InternalManager/AdvertisementManager?${encodeURI(urlParams.toString())}`
    
    window.location.replace(forwardURL)
}

function setFilter(filterElement, filterValue){
    let searchParams = new URLSearchParams(decodeURI(window.location.search))

    let redirectURL = `${window.location.href.replace(window.location.search,"")}`
    for (index in storedParams){
        if(searchParams.get(index)){
            searchParams.delete(index)
        }
        searchParams.append(index,storedParams[index])
    }

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

    if(searchParams.size>0){
        redirectURL+=`?${encodeURI(searchParams.toString())}`
    }
    window.location.replace(redirectURL)
}