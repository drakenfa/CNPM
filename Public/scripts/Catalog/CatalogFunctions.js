function CatalogSearch(searchValue){
    let urlParams = new URLSearchParams()
    urlParams.append("search-query",searchValue)
    let forwardURL = `../Catalog/?${encodeURI(urlParams.toString())}`
    window.location.replace(forwardURL)
}