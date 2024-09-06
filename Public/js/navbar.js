fetch("../Category/GetAllCategory")
    .then((response) => response.json())
    .then((data) => {
        var categoryDiv = document.querySelector(".category");
        data.forEach((category) => {
            var categoryItem = document.createElement("a");
            categoryItem.href = `../Catalog/Category?context=categories&context-value=${category.category_id}`;
            categoryItem.className = "category-item";
            categoryItem.textContent = category.category_name;
            categoryDiv.appendChild(categoryItem);
        });
    })
    .catch((error) => console.error("Error:", error));
