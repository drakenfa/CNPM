function submitInfo(element){
    if(!element.classList.contains("disabled")){
        try{
            const formElement = document.querySelector('.input-info-wrapper')
            const emailInput = new InputElement(formElement.querySelector('#input_email'))
            const phoneInput = new InputElement(formElement.querySelector('#input_phone_number'))
            const passwordInput = new InputElement(formElement.querySelector('#input_password'))
            const fullname = new InputElement(formElement.querySelector('#input_customer_fullname')).getInputValue()
            
            let email = emailInput.getInputValue() 
            let phoneNumber = phoneInput.getInputValue()
            let password = passwordInput.getInputValue()

            const gender = formElement.querySelector("#input_gender select").value
            const address = formElement.querySelector("#input_address textarea").value


            email = email.length!=0?email:null
            phoneNumber = phoneNumber.length!=0?phoneNumber:null
            password = password.length!=0?password:null

            let constraints = {
                email: {
                    presence:{
                        message:"Email không được để trống"
                    },
                    email:{
                        message:"Email không đúng định dạng"
                    }
                },
                phoneNumber: {
                    presence:{
                        message:"Số điện thoại không được để trống"
                    },
                    format:{
                        pattern:/^0[0-9]{9}$/,
                        message:"Số điện thoại không đúng định dạng"
                    }
                }
            };
            let inputs = {
                email: email,
                phoneNumber:phoneNumber
            }
            if(password){
                constraints["password"] = {
                    presence:{
                        message:"Mật khẩu không được để trống"
                    },
                    format:{
                        pattern:/^[a-zA-z0-9]{8,20}$/,
                        message:"Mật khẩu phải có ít nhất 8 ký tự từ A-Z, a-z, 0-9"
                    }
                }
                inputs["password"]= password
            }
            
            const result = validate(inputs, constraints,{fullMessages:false});
            if(result!=undefined){
                if(result["email"]){
                    emailInput.showError(result["email"])
                    return false
                }
                if(result["phoneNumber"]){
                    phoneInput.showError(result["phoneNumber"])
                    return false
                }
                if(result["password"]){
                    passwordInput.showError(result["password"])
                    return false
                }
            }
            

            let userInfoData = new FormData()
            userInfoData.append("email",email)
            userInfoData.append("phone_number",phoneNumber)
            if(password!=""){
                userInfoData.append("password",password)
            }
            userInfoData.append("gender",gender)
            userInfoData.append("address",address)
            userInfoData.append("customer_fullname",fullname)
            

            let changeInfoReq = new XMLHttpRequest();
            changeInfoReq.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    let responseData = JSON.parse(this.responseText)[0]
                    let status = responseData["status"]
                    if(status =="email_exists"){
                        emailInput.showError("Email đã được sử dụng")
                    }
                    if(status =="phone_number_exists"){
                        phoneInput.showError("Số điện thoại đã được sử dụng")
                    }
                    if(status=="success"){
                        alert("Đổi thông tin thành công")
                        let refreshSession = new XMLHttpRequest()
                        refreshSession.open("GET","../DataRequest/RefreshSessionData")
                        refreshSession.send()
                    }
                }
            };
            changeInfoReq.open("POST", "../CustomerInfo/ChangeCustomerInfo", true);
            changeInfoReq.send(userInfoData);
        }
        catch(e){
            console.log(e)
            return false
        }
    }
}

function enableEdit(){
    document.querySelector(".info-edit-options .save-info").classList.remove("disabled")
}

function changeImage(element){
    if(element.size>50*1024*1024){
        alert("File hình ảnh phải nhỏ hơn 50MB")
        return
    }
    let accountId = document.querySelector(".hidden-info [attrib='account_id']").getAttribute("value")

    let reqData = new FormData()
    reqData.append("table","accounts")
    reqData.append("table_id","account_id")
    reqData.append("account_id",accountId)
    
    let imgExtension = element.name.split(".")
    let newImgPath = `customerAvatar/${imgExtension[imgExtension.length-2].trim().toLowerCase()}.${imgExtension[imgExtension.length-1]}`
    reqData.append("avatar",element,newImgPath)

    let req = new XMLHttpRequest()
    req.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText)
            let responseData = JSON.parse(this.responseText)
            if(responseData["status"]=="success"){
                let refreshSession = new XMLHttpRequest()
                refreshSession.open("GET","../DataRequest/RefreshSessionData")
                refreshSession.send()
            }
        }
    };

    req.open("POST", "../DataRequest/Update", true);
    req.send(reqData);
}