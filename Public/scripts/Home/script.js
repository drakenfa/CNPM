setInterval(() => {
    document.querySelector("#ad-widget").itemWidget.moveToNextItem();
}, 5000);

function showMoreProducts(productSetElement){
    const productListElement = productSetElement.querySelector('.product-list-wrapper')
    productListElement.classList.toggle("hide")
    productListElement.classList.toggle("show")

    const showButton = productSetElement.querySelector('.show-more-button')
    const hideButton = productSetElement.querySelector('.hide-button')
    showButton.style.display = "none"
    hideButton.style.display = "block"
}

function hideProducts(productSetElement){
    const productListElement = productSetElement.querySelector('.product-list-wrapper')
    productListElement.classList.toggle("show")
    productListElement.classList.toggle("hide")

    const showButton = productSetElement.querySelector('.show-more-button')
    const hideButton = productSetElement.querySelector('.hide-button')
    showButton.style.display = "block"
    hideButton.style.display = "none"
}