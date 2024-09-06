function showImage(element){
    element.parentElement.querySelectorAll(".image-wrapper .overlay").forEach((item)=>{
        item.classList.add("hidden")
    })

    element.querySelector(".overlay").classList.remove("hidden")

    let imageSrc = element.querySelector("img").getAttribute("src")

    document.querySelector(".product-info-panel .product-image-info-wrapper .product-image-panel .display-image-wrapper .image-wrapper img").setAttribute("src",imageSrc)
}

function selectSku(element){
    element.parentElement.querySelectorAll(".sku-option").forEach((item)=>{
        item.classList.remove("selected")
    })

    element.classList.add("selected")
}

function sendProductReview(element){
    if(!element.classList.contains("disabled")){
        if(confirm("Gửi nhận xét?")){
            let comment = document.querySelector('#input_comment textarea').value
    
            $userStarRatingEL = $("#user-star-review-rating")
            let ratingValue = $userStarRatingEL.rateYo("rating")
    
            
            let searchParams = new URLSearchParams(decodeURI(window.location.search))
            let productID = searchParams.get("id")
    
            let postData = new FormData()
            postData.append("comment",comment)
            postData.append("rating",ratingValue)
            postData.append("product_id",productID)
    
            let req = new XMLHttpRequest()
            
            req.onreadystatechange = function(){
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText)
                    let responseData = JSON.parse(this.responseText)
                    console.log(responseData)
                    if(responseData["status"]=="success"){
                        window.location.reload()
                    }
                    else if(responseData["status"]=="had_reviewed"){
                        alert("Bạn đã nhận xét sản phẩm, không thể gửi lại")
                    }
                    else if(responseData["status"]=="not_ordered"){
                        alert("Vui lòng mua hàng trước khi nhận xét sản phẩm")
                    }
                    else if(responseData["status"]=="not-signed-in"){
                        alert("Vui lòng đăng nhập để nhận xét")
                    }
                }
            }
    
            req.open("POST","../ProductDescription/SendReview")
            req.send(postData)
        }
    }
}


// Tính số lượng cặp key-value trong localStorage
function countLocalStorageItems() {
    let count = 0;
    for (let i = 0; i < localStorage.length; i++) {
        const key = localStorage.key(i);
        if (key.startsWith("product_")) {
            count++;
        }
    }
    return count;
}

// Sử dụng hàm countLocalStorageItems() để in ra số lượng cặp key-value trong localStorage


function addProductToCart2() {
    let selectedSku = document.querySelector(".product-info-panel .product-sku-list .sku-option.selected");
    if (selectedSku) {
        let skuCode = selectedSku.getAttribute("value");
        let searchParams = new URLSearchParams(decodeURI(window.location.search));
        let productID = searchParams.get("id");
        
        // Kiểm tra xem đã có dữ liệu nào được lưu cho productID này trong localStorage chưa
        let storedData = localStorage.getItem("product_" + productID);
        if (storedData) {
            // Nếu đã có dữ liệu, chuyển đổi nó từ chuỗi JSON thành mảng
            let productData = JSON.parse(storedData);
            // Kiểm tra xem productData có thuộc tính skus không và là một mảng không
            if (productData && Array.isArray(productData.skus)) {
                // Kiểm tra xem skuCode đã tồn tại trong mảng SKU hay chưa
                if (productData.skus.includes(skuCode)) {
                    console.log("Đã có");
                    alert("Đã có sản phẩm này trong giỏ hàng");
                    return; // Dừng hàm nếu skuCode đã tồn tại
                }
                // Nếu skuCode chưa tồn tại, thêm nó vào mảng SKU
                productData.skus.push(skuCode);
                // Lưu lại dữ liệu đã cập nhật vào localStorage
                localStorage.setItem("product_" + productID, JSON.stringify(productData));
                console.log("product_" + productID, JSON.stringify(productData));
            } else {
                console.log("Invalid product data format");
            }
        } else {
            // Nếu chưa có dữ liệu cho productID này, tạo một mảng mới chứa skuCode
            let productData = { skus: [skuCode] };
            // Lưu dữ liệu vào localStorage
            localStorage.setItem("product_" + productID, JSON.stringify(productData));
            console.log("product_" + productID, JSON.stringify(productData));
        }
        alert("Đã thêm sản phẩm vào giỏ hàng");
        console.log("Đã thêm SKU mới vào localStorage");
        console.log("sku_id=" + skuCode);
        console.log("Số lượng cặp key-value trong localStorage: " + countLocalStorageItems());
    }
}

function buyProduct(){
    let selectedSku = document.querySelector(".product-info-panel .product-sku-list .sku-option.selected");
    if (selectedSku) {
        let skuCode = selectedSku.getAttribute("value");
        let searchParams = new URLSearchParams(decodeURI(window.location.search));
        let productID = searchParams.get("id");
        
        // Kiểm tra xem đã có dữ liệu nào được lưu cho productID này trong localStorage chưa
        let storedData = localStorage.getItem("product_" + productID);
        if (storedData) {
            // Nếu đã có dữ liệu, chuyển đổi nó từ chuỗi JSON thành mảng
            let productData = JSON.parse(storedData);
            // Kiểm tra xem productData có thuộc tính skus không và là một mảng không
            if (productData && Array.isArray(productData.skus)) {
                // Kiểm tra xem skuCode đã tồn tại trong mảng SKU hay chưa
                if (productData.skus.includes(skuCode)) {
                    console.log("Đã có");
                    window.location="../ShopCart/"
                    return; // Dừng hàm nếu skuCode đã tồn tại
                }
                // Nếu skuCode chưa tồn tại, thêm nó vào mảng SKU
                productData.skus.push(skuCode);
                // Lưu lại dữ liệu đã cập nhật vào localStorage
                localStorage.setItem("product_" + productID, JSON.stringify(productData));
                console.log("product_" + productID, JSON.stringify(productData));
            } else {
                console.log("Invalid product data format");
            }
        } else {
            // Nếu chưa có dữ liệu cho productID này, tạo một mảng mới chứa skuCode
            let productData = { skus: [skuCode] };
            // Lưu dữ liệu vào localStorage
            localStorage.setItem("product_" + productID, JSON.stringify(productData));
            console.log("product_" + productID, JSON.stringify(productData));
        }
        window.location="../ShopCart/"
        console.log("Đã thêm SKU mới vào localStorage");
        console.log("sku_id=" + skuCode);
        console.log("Số lượng cặp key-value trong localStorage: " + countLocalStorageItems());
    }

}
