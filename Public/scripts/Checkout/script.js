// Hàm để tạo một số nguyên ngẫu nhiên trong khoảng từ min đến max
function getRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Hàm để tạo một ký tự chữ cái ngẫu nhiên
function getRandomLetter() {
    var letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return letters.charAt(Math.floor(Math.random() * letters.length));
}

// Hàm để tạo chuỗi ngẫu nhiên theo định dạng 'XXAX-XXXXX'
function generateTrackingNumber() {
    var trackingNumber = '';
    // Tạo ký tự ngẫu nhiên đầu tiên
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += getRandomLetter();
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += '-';
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += getRandomNumber(0, 9);
    trackingNumber += getRandomNumber(0, 9);
    return trackingNumber;
}

// Lấy phần tử input có id là "tracking_number"
var trackingNumberInput = document.getElementById('tracking_number_display');

// Gán giá trị tracking number ngẫu nhiên vào input
trackingNumberInput.value = generateTrackingNumber();

// Lấy URL hiện tại từ trình duyệt
var currentUrl = window.location.href;

// Tách URL bằng dấu /
var parts = currentUrl.split('/');

// Lấy phần tử cuối cùng của mảng
var lastPart = parts[parts.length - 1];

// Kiểm tra xem phần tử cuối cùng có chứa dấu ? không
if (lastPart.indexOf('?') !== -1) {
    // Nếu có, tách nó để chỉ lấy phần trước dấu ?
    accountId = lastPart.split('?')[0];
} else {
    // Nếu không có dấu ?, accountId chính là phần tử cuối cùng
    accountId = lastPart;
}

// In ra accountId để kiểm tra

var urlParams1 = new URLSearchParams(window.location.search);
var totalMoney = urlParams1.get('money');

// Lấy phần tử label theo id
var totalMoneyLabel1 = document.getElementById('total_money');

// Gán giá trị cho label
totalMoneyLabel1.textContent = totalMoney;

var totalMoneyLabel = document.getElementById('total_money');
var totalMoney = totalMoneyLabel.textContent.trim();



// Submit form
// Gán giá trị accountId vào action của form
var formElement = document.querySelector('form');
formElement.action = '../Order/CreateOrder/' + accountId + "/" + totalMoney;


// In ra giá trị accountId để kiểm tra
console.log('accountId:', accountId);

function addProducttocart(sku_id,number) {
    fetch("../Shopcart/getAllProductSku")
        .then((response) => response.json())
        .then((data) => {
            const productSku = data.productSku;
            const foundProduct = productSku.find(item => item.sku_id === sku_id);
            if (foundProduct) {
                const cartContent = document.querySelector(".Shop-content");
                const form = document.getElementById("create"); // Corrected selector for the form by its ID
                const all =document.createElement("div");
                all.id="sku_price_number_"+ sku_id;
                all.classList.add("sku_price_number_"+ sku_id);
                const sku = document.createElement("input");
                sku.id ="sku_" +sku_id;
                sku.value=sku_id;
                sku.classList.add("hidden");
                const price = document.createElement("input");
                price.id ="price_" + sku_id;
                price.value=foundProduct.price;
                price.classList.add("hidden");
                const number1 = document.createElement("input");
                number1.id ="number_" + sku_id;
                number1.value=number;
                number1.classList.add("hidden");
                all.appendChild(sku);
                all.appendChild(price);
                all.appendChild(number1);

                form.appendChild(all);

                // Tạo các phần tử HTML
                const productDiv = document.createElement("div");
                productDiv.classList.add("product-item");
                productDiv.id = sku_id;



                const img = document.createElement("img");
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
                remainDiv.textContent ="Số lượng : " +number;
                nameDiv.appendChild(remainDiv);

                const priceDiv = document.createElement("div");
                priceDiv.classList.add("product-price");
                priceDiv.textContent = (parseInt(foundProduct.price)).toLocaleString() + "đ";
                // cartContent.appendChild(priceDiv); // Thêm priceDiv vào cart-content
                nameDiv.appendChild(priceDiv);

                const totalDiv = document.createElement("div");
                totalDiv.classList.add("total-price");
                totalDiv.textContent = (parseInt(foundProduct.price))*parseInt(number);
                // cartContent.appendChild(priceDiv); // Thêm priceDiv vào cart-content
                // nameDiv.appendChild(totalDiv);

                // const totalPriceDiv = document.createElement("div");
                // totalPriceDiv.classList.add("total-price-product");
                // totalPriceDiv.textContent = foundProduct.price + "đ"; // Khởi tạo giá trị ban đầu của totalPriceDiv bằng giá trị của price
                // cartContent.appendChild(totalPriceDiv); // Thêm totalPriceDiv vào cart-content
                // productDiv.appendChild(totalPriceDiv);

                // Thêm sản phẩm vào cart-content
                cartContent.appendChild(productDiv);

                
            } else {
                console.log("Product not found");
            }
        })
        .catch((error) => console.log("Error: ", error));
}


function callAll() {
    // Loop through localStorage to retrieve data
    for (var key in localStorage) {
        if (key.startsWith("productsold_")) {
            // Get the data object from localStorage
            var productSold = JSON.parse(localStorage.getItem(key));
            // Call addProducttocart function with the retrieved data
            addProducttocart(productSold.sku_id, productSold.number);
        }
    }
}

// Call the callAll function to execute
callAll();
const valueTempMoneyDiv = document.querySelector('.value-temp-money');
const valueTotalMoneyDiv = document.querySelector('.value-total-money');

// Get the value of total_money label
const totalMoneyValue = parseInt(totalMoneyLabel.textContent.replace('đ', '').replace(',', ''));

// Calculate 90% of the total money
const tempValue = totalMoneyValue * 0.9;
const totalValue =totalMoneyValue;
// Set the calculated value as the text content of value-total-money div
valueTempMoneyDiv.textContent = tempValue.toLocaleString() + 'đ';
valueTotalMoneyDiv.textContent = totalValue.toLocaleString() + 'đ';

// Get the tracking number value from the disabled input field
const trackingNumberValue = document.getElementById('tracking_number_display').value;

// Set the value of the hidden input field
document.getElementById('tracking_number_hidden').value = trackingNumberValue;
// Get the Total-footer element
const totalFooter = document.getElementById("Total-footer");

// Attach an event listener to the Total-footer element
totalFooter.addEventListener("click", function() {
    // Perform form validation
    let name = document.getElementById("name").value;
    let phone_number = document.getElementById("phone_number").value;
    let address = document.getElementById("address").value;
    let email = document.getElementById("email").value;
    const numberRegex = /\d/;

    const specialCharactersRegex = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
    const phoneFormatRegex = /^0\d{9}$/;
    const emailFormatRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[A-Za-z]+$/;

    if (name === '' || phone_number === '' || address === '' || email === '') {
        alert("Không để trống thông tin");
    } else if (numberRegex.test(name)) {
        alert("Tên không được chứa số");
    } else if (specialCharactersRegex.test(name)) {
        alert("Tên không được chứa ký tự đặc biệt");
    } else if (!phoneFormatRegex.test(phone_number)) {
        alert("SDT không đúng định dạng 0XXXXXXXXX, X là số");
    } else if (specialCharactersRegex.test(address.replace(/\//g, ''))) {
        alert("Địa chỉ không được có kí tự đặc biệt");
    } else if (!emailFormatRegex.test(email)) {
        alert("Email không đúng định dạng");
    }
    else {
        let data = [];

        // Loop through each div inside the form
        document.querySelectorAll("#create div[class^='sku_price_number_']").forEach(function(div) {
            // Extract data from input fields within the div
            let sku = div.querySelector("input[id^='sku_']").value;
            let price = div.querySelector("input[id^='price_']").value;
            let number = div.querySelector("input[id^='number_']").value;
    
            // Add the data to the array
            data.push({
                sku: sku,
                price: price,
                number: number
            });
        });
    
        // Convert the data array to JSON string
        let jsonData = JSON.stringify(data);
    
        // Create a hidden input field to store the JSON data
        let hiddenInput = document.createElement("input");
        hiddenInput.setAttribute("type", "hidden");
        hiddenInput.setAttribute("name", "data");
        hiddenInput.setAttribute("value", jsonData);
    
        // Append the hidden input field to the form
        form.appendChild(hiddenInput);
        // If the form is valid, manually trigger the form submission
        document.getElementById("create").submit();
    }
});

// Get the form element
const form = document.getElementById("create");

// Attach an event listener to the form's submit event
form.addEventListener("submit", function(event) {
    // Prevent the default form submission behavior
    event.preventDefault();

    // Array to store the data
    let data = [];

    // Loop through each div inside the form
    document.querySelectorAll("#create div[class^='sku_price_number_']").forEach(function(div) {
        // Extract data from input fields within the div
        let sku = div.querySelector("input[id^='sku_']").value;
        let price = div.querySelector("input[id^='price_']").value;
        let number = div.querySelector("input[id^='number_']").value;

        // Add the data to the array
        data.push({
            sku: sku,
            price: price,
            number: number
        });
    });

    // Convert the data array to JSON string
    let jsonData = JSON.stringify(data);

    // Create a hidden input field to store the JSON data
    let hiddenInput = document.createElement("input");
    hiddenInput.setAttribute("type", "hidden");
    hiddenInput.setAttribute("name", "data");
    hiddenInput.setAttribute("value", jsonData);

    // Append the hidden input field to the form
    form.appendChild(hiddenInput);

    // Submit the form
    form.submit();
});
