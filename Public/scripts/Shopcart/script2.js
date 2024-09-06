let productsAddedToCart = 0;
function addProducttocart(product_id, sku_id) {
    fetch("../Shopcart/getAllProductSku")
        .then((response) => response.json())
        .then((data) => {
            const productSku = data.productSku;
            const foundProduct = productSku.find(item =>item.product_id === product_id && item.sku_id === sku_id );
            if (foundProduct) {
                const cartContent = document.querySelector(".cart-content");

                // Tạo các phần tử HTML
                const productDiv = document.createElement("div");
                productDiv.classList.add("product-item");
                productDiv.id = sku_id;

                const checkbox = document.createElement("input");
                checkbox.id = "sku_" + sku_id;
                checkbox.type = "checkbox";
                checkbox.checked = true; // Đặt mặc định là checked
                productDiv.appendChild(checkbox);

                // Thêm sự kiện change cho checkbox
                checkbox.addEventListener("change", () => {
                    updateTotalAmount(); // Gọi hàm tính tổng giá trị khi checkbox thay đổi trạng thái
                    saveState(product_id, sku_id, checkbox.checked, quantityInput.value);
                });

                const img = document.createElement("img");
                img.classList.add("product_image_display")
                img.src ="../Public/img/products/" +foundProduct.thumbnail; // Thay thế bằng URL thực tế của hình ảnh
                productDiv.appendChild(img);

                const nameDiv = document.createElement("div");
                nameDiv.classList.add("product-name");
                nameDiv.textContent = foundProduct.product_name;
                productDiv.appendChild(nameDiv);
                
                const skuDiv = document.createElement("div");
                skuDiv.classList.add("product-sku-code");
                skuDiv.textContent = foundProduct.sku_code;
                nameDiv.appendChild(skuDiv);

                const remainDiv = document.createElement("div");
                skuDiv.classList.add("product-remain");
                remainDiv.textContent ="Số lượng còn lại: " +foundProduct.total_remain;
                nameDiv.appendChild(remainDiv);

                const priceDiv = document.createElement("div");
                priceDiv.classList.add("product-price");
                priceDiv.textContent = (parseInt(foundProduct.price)).toLocaleString() + "đ";
                cartContent.appendChild(priceDiv); // Thêm priceDiv vào cart-content
                productDiv.appendChild(priceDiv);

                const quantityDiv = document.createElement("div");
                quantityDiv.classList.add("quantity");

                const controllDiv = document.createElement("div");
                controllDiv.classList.add("controll");
                
                quantityDiv.appendChild(controllDiv);
                const minusBtn = document.createElement("button");
                minusBtn.textContent = "-";
                controllDiv.appendChild(minusBtn);

                const quantityInput = document.createElement("input");
                quantityInput.id = "quantity_sku_" + sku_id;
                quantityInput.type = "text"; // Set type to text
                quantityInput.value = 1;
                quantityInput.min = 1; // Minimum value is 1
                quantityInput.max = foundProduct.total_remain; // Maximum value is 10
                quantityInput.addEventListener("change", () => {
                    const enteredValue = parseInt(quantityInput.value);
                    if (isNaN(enteredValue) || enteredValue < 1) {
                        quantityInput.value = 1;
                    } else if (enteredValue > foundProduct.total_remain) {
                        quantityInput.value = foundProduct.total_remain;
                        alert("Không đủ hàng trong kho.");
                    }
                    updateTotalPrice();
                    saveState(product_id, sku_id, checkbox.checked, quantityInput.value);
                });
                
                // Prevent non-numeric input
                quantityInput.addEventListener("input", () => {
                    quantityInput.value = quantityInput.value.replace(/\D/g, ''); // Remove non-numeric characters
                });
                
                // Style to hide arrows
                // quantityInput.style.appearance = "textfield"; // Hide arrows in some browsers
                // quantityInput.style.MozAppearance = "textfield"; // Hide arrows in Firefox
                
                // Additional styling to prevent resizing of the input
                
                // quantityInput.addEventListener("keydown", (event) => {
                //     //alert khi người dùng nhập số lớn hơn max
                // });

                quantityInput.addEventListener("change", () => {
                    // Kiểm tra nếu giá trị nhập vào là số và lớn hơn hoặc bằng 1 thì cập nhật giá trị của input
                    if (!isNaN(quantityInput.value) && parseInt(quantityInput.value) >= 1) {
                        quantityInput.value = parseInt(quantityInput.value);
                        updateTotalPrice(); // Cập nhật giá trị total price khi thay đổi số lượng
                        updateTotalAmount();
                    } else {
                        // Nếu giá trị nhập vào không phải là số hoặc nhỏ hơn 1, đặt lại giá trị của input là 1
                        quantityInput.value = 1;
                        updateTotalPrice(); // Cập nhật giá trị total price khi thay đổi số lượng
                        updateTotalAmount();
                    }
                });
                controllDiv.appendChild(quantityInput);

                const plusBtn = document.createElement("button");
                plusBtn.textContent = "+";
                controllDiv.appendChild(plusBtn);
                // quantityDiv.innerHTML += "</br>";

                const remove = document.createElement("button");
                remove.textContent = "Xóa";
                remove.classList.add("remove-btn")
                quantityDiv.appendChild(remove);

                cartContent.appendChild(quantityDiv); // Thêm quantityDiv vào cart-content
                productDiv.appendChild(quantityDiv);

                const totalPriceDiv = document.createElement("div");
                totalPriceDiv.classList.add("total-price-product");
                totalPriceDiv.textContent = foundProduct.price + "đ"; // Khởi tạo giá trị ban đầu của totalPriceDiv bằng giá trị của price
                cartContent.appendChild(totalPriceDiv); // Thêm totalPriceDiv vào cart-content
                productDiv.appendChild(totalPriceDiv);

                // Thêm sản phẩm vào cart-content
                cartContent.appendChild(productDiv);
                checkCartContent();
                

                productsAddedToCart++;

                // Nếu đã thêm tất cả các sản phẩm vào giỏ hàng, gọi hàm calculateTotalAmount()
                if (productsAddedToCart === productSku.length) {
                    calculateTotalAmount();
                }
                // Hàm cập nhật giá trị total price
                function updateTotalPrice() {
                    const totalPrice = parseInt(foundProduct.price) * parseInt(quantityInput.value);
                    totalPriceDiv.textContent = (parseInt(totalPrice)).toLocaleString() + "đ";
                    saveState(product_id, sku_id, checkbox.checked, quantityInput.value);
                }

                // Thêm sự kiện click cho nút minusBtn
                minusBtn.addEventListener("click", () => {
                    const currentValue = parseInt(quantityInput.value);
                    if (currentValue > 1) {
                        quantityInput.value = currentValue - 1;
                        saveState(product_id, sku_id, checkbox.checked, quantityInput.value);
                        updateTotalPrice();
                        updateTotalAmount(); // Cập nhật giá trị total khi số lượng thay đổi
                    }
                });

                // Thêm sự kiện click cho nút plusBtn
                plusBtn.addEventListener("click", () => {
                    quantityInput.value = parseInt(quantityInput.value) + 1;
                    saveState(product_id, sku_id, checkbox.checked, quantityInput.value);
                    updateTotalPrice();
                    updateTotalAmount(); // Cập nhật giá trị total khi số lượng thay đổi
                });

                // Hàm lưu trạng thái vào localStorage khi checkbox hoặc giá trị input thay đổi
                function saveState(product_id, sku_id, checkboxState, inputValue) {
                    console.log(`Save input ${checkbox.id} = ${inputValue}`);
                    console.log(`Checkbox ${checkbox.id} = ${checkboxState ? "checked" : "unchecked"}`);
                    localStorage.setItem("products_" + sku_id, JSON.stringify({ product_id, sku_id, checkboxState, inputValue }));
                }

                // Hàm khôi phục trạng thái từ localStorage khi tải trang
                function restoreState(product_id, sku_id) {
                    const storedState = localStorage.getItem("products_" + sku_id);
                    if (storedState) {
                        const { checkboxState, inputValue } = JSON.parse(storedState);
                
                        // Get the checkbox and quantity input elements based on their IDs
                        const checkbox = document.getElementById("sku_" + sku_id);
                        const quantityInput = document.getElementById("quantity_sku_" + sku_id);
                
                        // Check the checkbox and set the quantity input value
                        checkbox.checked = checkboxState === undefined ? true : checkboxState;
                        quantityInput.value = inputValue === undefined ? 1 : inputValue;
                

                    }
                    updateTotalPrice();
                    updateTotalAmount();
                }
                
                function updateTotalAmount() {
                    let totalPrice = 0;
                
                    // Lấy tất cả các checkbox
                    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
                    checkboxes.forEach((checkbox) => {
                        // Kiểm tra nếu checkbox được chọn (checked)
                        if (checkbox.checked) {
                            // Lấy productDiv tương ứng của checkbox
                            const productDiv = checkbox.parentElement;
                            // Tìm totalPriceDiv trong productDiv
                            const totalPriceDiv = productDiv.querySelector(".total-price-product");
                            // Lấy giá trị số từ textContent bỏ đi ký tự 'đ'
                            const priceText = totalPriceDiv.textContent.replace(/\D/g, ''); // Loại bỏ tất cả các ký tự không phải số
                            const price = parseInt(priceText); // Chuyển đổi thành số nguyên
                            totalPrice += price;
                        }
                    });
                
                    // Cập nhật giá trị cho temp-money
                    const tempMoneyDiv = document.getElementById("temp-money");
                    tempMoneyDiv.textContent = (parseInt(totalPrice)).toLocaleString() + "đ";
                    // Tính thành tiền và cập nhật giá trị cho value-total-money
                    const totalMoneyDiv = document.querySelector(".value-total-money");
                    const totalMoney = totalPrice * 1.1; // Thành tiền = Tạm tính * 1.1
                    totalMoneyDiv.textContent = (parseInt(totalMoney)).toLocaleString() + "đ";
                }
                // Khôi phục trạng thái từ localStorage khi tải trang
                // saveState(product_id, sku_id, checkbox.checked, quantityInput.value);
                restoreState(product_id, sku_id);
            } else {
                console.log("Product not found");
            }
        })
        .catch((error) => console.log("Error: ", error));
}

// Gọi hàm addProducttocart để thêm sản phẩm vào giỏ hàng
calculateTotalAmount();

// test
// addProducttocart("1", "1");
// addProducttocart("3", "17");


// Hàm tính tổng giá trị của tất cả các sản phẩm trong giỏ hàng
function calculateTotalAmount() {
    let totalPrice = 0;
    
    // Lấy tất cả các sản phẩm trong giỏ hàng
    const products = document.querySelectorAll('.product-item');
    products.forEach((product) => {
        // Lấy giá của sản phẩm
        const totalPriceDiv = product.querySelector(".total-price-product");
        const price = parseInt(totalPriceDiv.textContent.replace('đ', ''));
        totalPrice += price;
    });

    // Cập nhật giá trị cho temp-money
    const tempMoneyDiv = document.getElementById("temp-money");
    tempMoneyDiv.textContent = (parseInt(totalPrice)).toLocaleString()  + "đ";
    // Tính và cập nhật giá trị cho value-total-money
    const totalMoneyDiv = document.querySelector(".value-total-money");
    const totalMoney = totalPrice * 1.1; // Thành tiền = Tạm tính * 1.1
    totalMoneyDiv.textContent = (parseInt(totalMoney)).toLocaleString() + "đ";
}



var resetButton = document.getElementById('reset-button');

function resetCart() {
    const cartContent = document.querySelector(".cart-content");
    cartContent.innerHTML = "";
    // Xóa toàn bộ dữ liệu của local storage
    localStorage.clear();
    // Sau khi xóa hết các phần tử con, kiểm tra lại cart-content để hiển thị hoặc ẩn phần tử no-item
    checkCartContent();
}

// Gắn sự kiện click cho nút resetButton
resetButton.addEventListener("click", resetCart);

// Test the function with example inputs
// Lấy phần tử cart-content và no-item từ DOM
// Lấy phần tử cart-content và no-item từ DOM
const cartContent = document.querySelector(".cart-content");
const noItemDiv = document.getElementById("no-item");
const cartDiv = document.getElementById("cart");
const container = document.getElementById("container");
const container2 = document.getElementById("container-2");

// Hàm kiểm tra xem có sản phẩm trong cart-content không và ẩn/hiện tương ứng
function checkCartContent() {
    if (cartContent.children.length > 0) {
        // Nếu có sản phẩm trong cart-content, ẩn no-item và hiển thị cart
        noItemDiv.style.display = "none";
        container2.style.display = "block";
        container.style.display = "block";
        cartDiv.style.display = "flex";
    } else {
        // Nếu không có sản phẩm trong cart-content, ẩn cart và hiển thị no-item
        noItemDiv.style.display = "block";
        cartDiv.style.display = "none";
        container.style.display = "none";
        container2.style.display = "none";
    }
}
function checkStoredProducts() {
    const addedSkuIds = new Set(); // Use a Set to store added sku_ids
    for (let i = 0; i < localStorage.length; i++) {
        const key = localStorage.key(i);
        if (key.startsWith("products_")) {
            const { sku_id } = JSON.parse(localStorage.getItem(key));
            if (!addedSkuIds.has(sku_id)) {
                const { product_id, checkboxState, inputValue } = JSON.parse(localStorage.getItem(key));
                // addProducttocart(product_id, sku_id, checkboxState, inputValue);
                addedSkuIds.add(sku_id); // Add sku_id to the Set to mark it as added
            }
        }
    }
}
checkStoredProducts();


const thanhToanButton = document.getElementById('Total-footer');

// Add event listener to check total amount and enable/disable the button
thanhToanButton.addEventListener('click', function() {
    const totalMoneyDiv = document.querySelector(".value-total-money");
    const totalMoneyText = totalMoneyDiv.textContent.trim(); // Lấy nội dung của phần tử
    const totalMoney = parseInt(totalMoneyText.replace(/\D/g, '')); // Lấy số từ nội dung và chuyển đổi thành số nguyên
    if (!isNaN(totalMoney) && totalMoney !== 0) { // Kiểm tra xem totalMoney có phải là số và không bằng 0 không
        document.getElementById("Total-footer").addEventListener("click", function() {
            // Lấy danh sách các sản phẩm được chọn
            var selectedProducts = document.querySelectorAll('.product-item input[type="checkbox"]:checked');

            for (var key in localStorage) {
                if (key.startsWith("productsold_")) {
                    localStorage.removeItem(key);
                    console.log("đã xóa")
                }
            }
            // Lưu thông tin của từng sản phẩm vào localStorage
            selectedProducts.forEach(function(product, index) {
                var skuId = product.id.split('_')[1]; // Lấy sku_id từ id của input

                // Lấy giá trị của input tương ứng
                var quantityInput = document.querySelector('#quantity_sku_' + skuId);
                var number = parseInt(quantityInput.value); // Lấy giá trị và chuyển đổi sang kiểu số
            
                // Tạo đối tượng chứa thông tin sản phẩm
                var productSold = {
                    "sku_id": skuId,
                    "number": number
                };
            
                // Lưu đối tượng vào localStorage
                localStorage.setItem('productsold_' + (index + 1), JSON.stringify(productSold));
                console.log(productSold);
            });
            
            // Chuyển hướng đến trang Checkout với thông tin về accountId và tổng tiền
            window.location.href = "../Checkout/" + loggedInId + "?money=" + totalMoney;
        });
        
    }
     else {
        // Show a message or perform other actions when the total amount is 0
        alert("Vui lòng chọn sản phẩm để thanh toán.");
    }
});
// Gọi hàm checkCartContent khi trang được tải và sau mỗi lần thêm hoặc xoá sản phẩm trong cart-content
document.addEventListener("DOMContentLoaded", checkCartContent);
document.addEventListener("DOMContentLoaded", function() {
    callAll();
});

function callAll() {
    // Loop through all items in localStorage
    for (let i = 0; i < localStorage.length; i++) {
        let key = localStorage.key(i);
        // Check if the key represents product data
        if (key.startsWith("product_")) {
            let productID = key.replace("product_", ""); // Get product ID from the key
            let skuData = localStorage.getItem(key); // Get SKU data from localStorage
            
            try {
                let parsedData = JSON.parse(skuData); // Parse the SKU data
                console.log("Parsed data:", parsedData); // Log the parsed data
                
                // Check if the parsed data has the expected structure
                if (parsedData && Array.isArray(parsedData.skus)) {
                    // Iterate through the skus array and add each SKU to the cart
                    parsedData.skus.forEach(sku => {
                        if (!isNaN(parseInt(productID)) && !isNaN(parseInt(sku))) {
                            addProducttocart(productID, sku); // Call addProducttocart function with corresponding product ID and SKU
                            console.log("(" + productID + ")(" + sku + ")");
                        } else {
                            console.error("Invalid product or SKU ID format:", productID, sku);
                        }
                    });
                } else {
                    console.error("Invalid product data:", parsedData);
                }
            } catch (error) {
                console.error("Error parsing SKU data:", error);
            }
        }
    }
}







function removeProductFromCart(sku_id) {
    // Iterate over all localStorage keys
    for (let i = 0; i < localStorage.length; i++) {
        let key = localStorage.key(i);
        // Check if the key represents a product entry
        if (key.startsWith("product_")) {
            // Retrieve the product data associated with the key
            const storedData = localStorage.getItem(key);
            if (storedData) {
                // Parse the stored data to get the JavaScript object
                const productData = JSON.parse(storedData);
                // Check if the productData has a skus array
                if (productData && Array.isArray(productData.skus)) {
                    // Find the index of the sku_id in the skus array
                    const index = productData.skus.indexOf(sku_id);
                    // If the sku_id is found, remove it from the skus array
                    if (index !== -1) {
                        productData.skus.splice(index, 1);
                        // Update the localStorage with the modified data
                        localStorage.setItem(key, JSON.stringify(productData));
                        console.log("Removed sku_id " + sku_id + " from " + key);
                        // Check if the skus array is now empty
                        if (productData.skus.length === 0) {
                            // If the skus array is empty, remove the entire product entry from localStorage
                            localStorage.removeItem(key);
                            console.log("Removed empty product entry: " + key);
                            location.reload();
                        }
                        else{
                            location.reload();
                        }
                    }
                }
            }
        }
    }

    const productDiv = document.getElementById(sku_id); // Get the product item div
    if (productDiv) {
        productDiv.remove(); // Remove the product item from the UI
    }
    checkCartContent();
}






// Kiểm tra xem có phần tử div header có chứa phần tử <a> với nội dung là "Đăng xuất" không
const logoutLink = document.querySelector('.header-ref');
const totalFooterDiv = document.querySelector('.Total-footer');

if (!logoutLink || logoutLink.textContent.trim() == 'Đăng xuất') {
    // Kiểm tra xem div Total-footer có phần tử a có class là "help" không
    const helpLink = totalFooterDiv.querySelector('a.help');
    if (helpLink) {
        // Ẩn phần tử <a>
        helpLink.style.display = "none";
        // Hiển thị chữ "Tiếp tục" bằng cách gán giá trị cho textContent
        totalFooterDiv.textContent = "Tiếp tục";    
    }
}

document.addEventListener("click", function(event) {
    if (event.target.classList.contains("remove-btn")) {
        const productDiv = event.target.closest(".product-item"); // Find the closest product item div
        if (productDiv) {
            const sku_id = productDiv.id; // Get the SKU ID from the product item div
            removeProductFromCart(sku_id); // Remove the product from the cart
        }
    }
});
// Lấy phần tử a chứa giá trị loggedInId
// Lấy giá trị của loggedInId từ phần tử a
var accountIdElement = document.querySelector('.account_id');
var loggedInId = accountIdElement.textContent.trim();


// Lấy URL hiện tại từ trình duyệt
var currentUrl = window.location.href;

// Kiểm tra xem URL đã chứa loggedInId chưa
if (!currentUrl.includes(loggedInId)) {
    // Thêm loggedInId vào URL hiện tại
    var newUrl = currentUrl + loggedInId;

    // Cập nhật URL của trình duyệt
    window.history.replaceState({}, document.title, newUrl);
}


