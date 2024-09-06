let searchBar = document.querySelector("div.search-bar div.form-search input")

searchBar.addEventListener("keydown", function(e){
    if(e.key == "Enter"){
        if(searchBar.value!=""){
            CatalogSearch(searchBar.value)
        }
    }
})