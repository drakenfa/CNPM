var valueArr = {
    0: "Mặt hàng",
    1: "Khách hàng",
    2: "Đơn hàng",
    3: "Nhân viên",
};
var valueIcon = {
    1: '<i class="fi fi-rr-box-open"></i>',
    2: '<i class="fi fi-rr-users-alt"></i>',
    3: '<i class="fi fi-rr-point-of-sale-bill"></i>',
    4: '<i class="fi fi-rr-users"></i>',
};

const numbers = Array.from(document.querySelectorAll(".card .numbers"));
const cardNames = Array.from(document.querySelectorAll(".card .card-name"));

const cardBox = document.querySelector(".card-box");
const content = document.querySelector(".content-module");
fetch("../InternalManager/GetAllDataHome")
    .then((response) => response.json())
    .then((values) => {
        var cardValues = Object.values(values.cardValue);
        numbers.forEach((number, i) => {
            number.textContent = cardValues[i];
        });
        cardNames.forEach((name, i) => {
            name.textContent = valueArr[i];
        });
    })
    .catch((error) => console.log("Error: ", error));
