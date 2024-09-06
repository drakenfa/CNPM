const supplierIdPost = document.querySelector(".modal-edit .modal-footer .supplier_id");

const numbers = Array.from(document.querySelectorAll(".card .numbers"));
const cardNames = Array.from(document.querySelectorAll(".card .card-name"));
const tbody = document.querySelector(".details table tbody");
const theadtr = document.querySelector(".details table thead tr");
const userImage = document.querySelector(".topbar .user img");
fetch("../InternalManager/GetAllDataDecentralization")
    .then((response) => response.json())
    .then((values) => {
        var numberOfModules = values.modules.length;
        values.modules.forEach((value) => {
            var td = document.createElement("td");
            td.textContent = value.module_name;
            theadtr.appendChild(td);
        })
        // var tdDelete = document.createElement("td");
        // tdDelete.textContent = "Xóa chức vụ";
        // theadtr.appendChild(tdDelete);
        var xhr = new XMLHttpRequest();
        xhr.open("GET", '../Decentralization/GetAllDecentralization', true);

        xhr.onreadystatechange = function() {
            if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                var decentralizations = JSON.parse(this.responseText);
                console.log(decentralizations);
                values.roles.forEach((value) => {
                    if(value.role_name != "Khách hàng"){
                        var tr = document.createElement("tr");
                        // Tạo một ô td chứa tên chức vụ
                        var tdRole = document.createElement("td");
                        tdRole.textContent = value.role_name; // Gán tên chức vụ cho ô td
                        tr.appendChild(tdRole); // Thêm ô td vào hàng
                        // Tạo các ô td chứa checkbox
                        for (var j = 0; j < numberOfModules; j++) {
                            (function(j) {
                                var tdModule = document.createElement("td");
                                var checkbox = document.createElement("input");
                                checkbox.type = "checkbox";
                                // Kiểm tra xem decentralization nào tồn tại và đặt checkbox tương ứng thành checked
                                for (var k = 0; k < decentralizations.length; k++) {
                                    if (decentralizations[k].role_id === value.role_id && decentralizations[k].module_id === '' + (j + 1)) {
                                        checkbox.checked = true;
                                        break;
                                    }
                                }
                                if (value.role_id === '1' && j === 11) {
                                    checkbox.disabled = true;
                                }
                                checkbox.addEventListener('change', function() {
                                    var xhr = new XMLHttpRequest();
                                    xhr.open("POST", this.checked ? '../Decentralization/CreateDecentralization' : '../Decentralization/DeleteDecentralization', true);
                                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                
                                    xhr.onreadystatechange = function() {
                                        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                                            console.log(this.responseText);
                                        }
                                    }
                                    console.log(value.role_id, j);
                                    xhr.send("role_id=" + value.role_id + "&module_id=" + '' + (j + 1));
                                });
                                tdModule.appendChild(checkbox); // Thêm checkbox vào ô td
                                tr.appendChild(tdModule); // Thêm ô td vào hàng
                            })(j);
                        }
                        // var tdDelete = document.createElement("td");
                        // var deleteBtn = document.createElement("button");
                        // deleteBtn.classList.add("delete");
                        // deleteBtn.id = "delete-"+value.role_id;
                        // deleteBtn.title = "Xóa chức vụ";
                        // var deleteIcon = document.createElement("i");
                        // deleteIcon.classList.add("fi");
                        // deleteIcon.classList.add("fi-rr-trash");
                        // deleteBtn.appendChild(deleteIcon);
                        // tdDelete.appendChild(deleteBtn);
                        // tr.appendChild(tdDelete);
                        tbody.appendChild(tr);
                    }
                });
            }
        }
        xhr.send();
        // tbody.addEventListener("click", function (event) {
        //     var clickedElement = event.target;
        //     var deleteButton = clickedElement.closest(".delete");
        //     if(deleteButton){
        //         var roleId = deleteButton.id.split("-")[1];
        //         var roleName = "";
        //         values.roles.forEach((role) => {
        //             if (role.role_id == roleId) {
        //                 roleName = role.role_name;
        //             }
        //         });
        //         contentModalDelete.textContent =
        //             "Bạn có chắc là muốn xóa chức vụ " + roleName ;
        //         deleteA.setAttribute(
        //             "href",
        //             "../Role/DeleteRole/" + roleId
        //         );
        //         showModalDelete();
        //     }

        // });
    })
    .catch((error) => console.log("Error: ", error));

    const modal = document.querySelector(".modal");
    const closeIconDelete = document.querySelector("#closeIconDelete");
    const closeBtnDelete = document.querySelector("#closeBtnDelete");
    const closeIconAdd = document.querySelector("#closeIconAdd");
    
    const modalInnerDelete = document.querySelector(".modal-inner.modal-delete");
    const modalInnerAdd = document.querySelector(".modal-inner.modal-add");
    
    const contentModalDelete = document.querySelector(".content-delete");
    const contentModalAdd = document.querySelector(".content-add");
    const deleteA = document.querySelector(".modal-footer a");
    
    const btnAdd = document.querySelector(".add-btn");
    btnAdd.addEventListener("click", showModalAdd);
    
    function hideModalDelete() {
        modal.classList.add("hide");
        modalInnerDelete.classList.add("hide");
    }
    function showModalDelete() {
        modal.classList.remove("hide");
        modalInnerDelete.classList.remove("hide");
    }
    function hideModalAdd() {
        modal.classList.add("hide");
        modalInnerAdd.classList.add("hide");
        refreshAddForm();
    }
    function showModalAdd() {
        modal.classList.remove("hide");
        modalInnerAdd.classList.remove("hide");
    }
    function hideModal() {
        modal.classList.add("hide");
        modalInnerAdd.classList.add("hide");
        refreshAddForm();   
        addRoleNameWarning.style.opacity = "0";
        isRoleNameAddValid = true;
    }
    function refreshAddForm() {
        roleNameAddForm.value = "";
    }
    
    closeIconDelete.addEventListener("click", hideModalDelete);
    closeBtnDelete.addEventListener("click", hideModalDelete);
    closeIconAdd.addEventListener("click", hideModalAdd);
    modal.addEventListener("click", hideModal);
    modalInnerDelete.addEventListener("click", function (event) {
        event.stopPropagation();
    });
    modalInnerAdd.addEventListener("click", function (event) {
        event.stopPropagation();
    });

const confirmAddBtn = document.getElementById("confirmBtnAdd");
const formAdd = document.querySelector(".modal-add .modal-body");

const roleNameAddForm = document.querySelector(".role-name-add-form");
const addRoleNameWarning = document.querySelector(
    ".add-role-name-warning"
);
var isRoleNameAddValid = true;
roleNameAddForm.addEventListener("keyup", function () {
    console.log(this.value)
    var role_name = this.value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../Role/GetRoleByName", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onload = function () {
        if (this.status == 200) {
            var response = this.responseText;
            response = response.trim();
            if (response == "Tên chức vụ đã tồn tại") {
                addRoleNameWarning.textContent = "Tên chức vụ đã tồn tại";
                addRoleNameWarning.style.opacity = "1";
                isRoleNameAddValid = false;
            } else {
                addRoleNameWarning.style.opacity = "0";
                isRoleNameAddValid = true;
            }
        }
        confirmAddBtn.disabled = !(
            isRoleNameAddValid 
        );
    };
    xhr.send("role_name=" + role_name);
});