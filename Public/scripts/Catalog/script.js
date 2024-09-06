const { search } = require("core-js/fn/symbol")

function toggleFilterElement(element){
    let filterElement = element.parentElement.parentElement.parentElement.getAttribute("filter_id")
    let filterValue = element.value

    updateFilter(filterElement,filterValue)
}

function updateFilter(filterElement, filterValue){
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    if(searchParams.has(filterElement)){
        let values = searchParams.get(filterElement).split(",")
        searchParams.delete(filterElement)
        if(values.includes(filterValue)){
            if(values.length>1){
                values.splice(values.indexOf(filterValue),1)
                searchParams.append(filterElement,values.join(","))
            }
        }
        else{
            values.push(filterValue)
            searchParams.append(filterElement,values.join(","))
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

function setFilter(filterElement, filterValue){
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    if(searchParams.has(filterElement)){
        searchParams.set(filterElement,filterValue)
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

function setFilter1(searchParams, filterElement, filterValue){
    if(searchParams.has(filterElement)){
        searchParams.set(filterElement,filterValue)
    }
    else{
        searchParams.append(filterElement,filterValue)
    }
    return searchParams
}

function toggleFilter(filterElement, filterValue){
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    if(searchParams.has(filterElement)){
        if(searchParams.get(filterElement)==filterValue){
            searchParams.delete(filterElement,filterValue)
        }
        else{
            searchParams.set(filterElement,filterValue)
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

function showMoreProducts(element){
    if(!element.index){
        element.index = 1;
    }
    
    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    searchParams.append("page",element.index)
    
    let req = new XMLHttpRequest()
    req.onreadystatechange = function(){
        if (this.readyState == 4 && this.status == 200) {
            let responseData = JSON.parse(this.responseText)
            let productsHTML = responseData["ProductsHTML"]
            let isLastProduct = responseData["StatusData"]["IsLast"]
            
            let productListElement = document.querySelector(".product-display-panel .product-list")
            productListElement.innerHTML+= productsHTML
            element.index++
            if(isLastProduct){
                element.style.display = "none"
            }
        }
    }
    req.open("GET", `../Catalog/GetMoreProducts?${encodeURI(searchParams.toString())}`, true);
    req.send();
}

function toggleShowFilterPanel(element){
    element.querySelector(".filter-content").classList.toggle("hide")
    element.querySelector(".filter-content").classList.toggle("show")
    

    element.querySelector(".drop-down-button-hide").classList.toggle("hide")
    element.querySelector(".drop-down-button-hide").classList.toggle("show")

    element.querySelector(".drop-down-button-show").classList.toggle("hide")
    element.querySelector(".drop-down-button-show").classList.toggle("show") 
}

function updateLowerRangeSlider(element){
    let lowerRange = element.querySelector("#lower-range")
    let upperRange = element.querySelector("#upper-range")
    if(Number(lowerRange.value)<=Number(upperRange.value)){
        element.querySelector("#lower-number").value=`${Number(lowerRange.value).toLocaleString()}₫`
    }
    else{
        lowerRange.value = 0
    }
}

function updateUpperRangeSlider(element){
    let lowerRange = element.querySelector("#lower-range")
    let upperRange = element.querySelector("#upper-range")
    if(Number(lowerRange.value)<=Number(upperRange.value)){
        element.querySelector("#upper-number").value=`${Number(upperRange.value).toLocaleString()}₫`
    }
    else{
        upperRange.value = Number.MAX_VALUE
    }
}

function priceRangeUpdate(element){
    let lowerRangeValue = element.querySelector("#lower-range").value
    let upperRangeValue = element.querySelector("#upper-range").value


    let searchParams = new URLSearchParams(decodeURI(window.location.search))

    if(searchParams.get("lower-price-range")!= lowerRangeValue || searchParams.get("upper-price-range")!= upperRangeValue){
        if(searchParams.get("lower-price-range")!= lowerRangeValue){
            setFilter1(searchParams,"lower-price-range",lowerRangeValue)
        }
        if(searchParams.get("upper-price-range")!= upperRangeValue){
            setFilter1(searchParams,"upper-price-range",upperRangeValue)
        }
        let redirectURL = `${window.location.href.replace(window.location.search,"")}`
        if(searchParams.size>0){
            redirectURL+=`?${encodeURI(searchParams.toString())}`
        }
        window.location.replace(redirectURL)
    }
}