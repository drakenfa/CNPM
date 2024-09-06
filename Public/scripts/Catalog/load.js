setup()

function setup(){
    let priceRangeElement = document.querySelector(".filter-content.double-slider")
    let lowerNumberInput = priceRangeElement.querySelector("#lower-number")
    let upperNumberInput = priceRangeElement.querySelector("#upper-number")
    let upperNumberRange = priceRangeElement.querySelector("#upper-range")
    let lowerNumberRange = priceRangeElement.querySelector("#lower-range")

    let searchParams = new URLSearchParams(decodeURI(window.location.search))
    if(searchParams.has("upper-price-range")){
        let upperValue = Number(searchParams.get("upper-price-range"))
        upperNumberInput.value=`${upperValue.toLocaleString()}₫`
        upperNumberRange.value=upperValue
    }
    else{
        let upperValue = Number(upperNumberRange.value)
        upperNumberInput.value=`${upperValue.toLocaleString()}₫`
    }
    if(searchParams.has("lower-price-range")){
        let lowerValue = Number(searchParams.get("lower-price-range"))
        lowerNumberInput.value=`${lowerValue.toLocaleString()}₫`
        lowerNumberRange.value=lowerValue
    }else{
        let lowerValue = Number(lowerNumberRange.value)
        lowerNumberInput.value=`${lowerValue.toLocaleString()}₫`
    }

    if(searchParams.has("order-by")){
        document.querySelector(`.product-display-panel .product-display-options .option#${searchParams.get("order-by")}`).classList.add("selected")
    }
}

let url = new URLSearchParams()
url.append("context","categories")
url.append("context-value","1")
console.log(encodeURI(url.toString()))