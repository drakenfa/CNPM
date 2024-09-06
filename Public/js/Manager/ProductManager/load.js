let searchBar = document.querySelector(".tab-header .header-search-bar input")

searchBar.addEventListener("keydown", function(e){
    if(e.key == "Enter"){
        if(searchBar.value!=""){
            SearchProduct(searchBar.value)
        }
        else{
            let forwardURL = `../InternalManager/ProductManager`
            window.location.replace(forwardURL)
        }
    }
})

function SearchProduct(searchValue){
    let urlParams = new URLSearchParams()
    urlParams.append("search-query",searchValue)
    let forwardURL = `../InternalManager/ProductManager?${encodeURI(urlParams.toString())}`
    window.location.replace(forwardURL)
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
    req.open("GET", `../InternalManager/GetMoreProducts?${encodeURI(searchParams.toString())}`, true);
    req.send();
}