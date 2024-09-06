$('form.sign-up-form').on('submit', processSignUp);

setup()
function setup(){
    let searchParams = new URLSearchParams(window.location.search)
    let status = searchParams.get("status")
    if(status == "signup_invalid_input"){
        showSliderDialogMessage("Tạo tài khoản thất bại: Thông tin đăng nhập không đúng yêu cầu")
    }
    else if(status == "signup_email_exists"){
        showSliderDialogMessage("Email đã được sử dụng, vui lòng đăng ký tài khoản sử dụng email khác")
    }
    else if(status == "signup_phone_exists"){
        showSliderDialogMessage("Số điện thoại đã được sử dụng, vui lòng đăng ký tài khoản sử dụng số điện thoại khác")
    }
    for (key in searchParams.keys()){
        searchParams.delete(key)
    }
    const newURL = window.location.origin + window.location.pathname
    window.history.pushState({},document.title,newURL)
}

function processSignUp(){
    try{
        const formElement = document.querySelector('form.sign-up-form')
        const emailInput = new InputElement(formElement.querySelector('#input_email'))
        const phoneInput = new InputElement(formElement.querySelector('#input_phone_number'))
        const passwordInput = new InputElement(formElement.querySelector('#input_password'))
        const confirmPasswordInput = new InputElement(formElement.querySelector('#input_confirm_password'))

        let email = emailInput.getInputValue()
        let phone = phoneInput.getInputValue()
        let password = passwordInput.getInputValue()
        let confirm_password = confirmPasswordInput.getInputValue()
        email = email.length!=0?email:null
        phone = phone.length!=0?phone:null
        password = password.length!=0?password:null
        confirm_password = confirm_password.length!=0?confirm_password:null

        let constraints = {
            email: {
                presence:{
                    message:"Email không được để trống"
                },
                email:{
                    message:"Email không đúng định dạng"
                }
            },
            phone_number:{
                presence:{
                    message:"Số điện thoại không được để trống"
                },
                format:{
                    pattern:/^0[0-9]{9}$/,
                    message:"Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0"
                }
            },
            password:{
                presence:{
                    message:"Mật khẩu không được để trống"
                },
                format:{
                    pattern:/^[a-zA-z0-9]{8,20}$/,
                    message:"Mật khẩu phải có ít nhất 8 ký tự từ A-Z, a-z, 0-9"
                }
            },
            confirm_password:{
                presence:{
                    message:"Mật khẩu không được để trống"
                },
                equality:{
                    attribute:'password',
                    message:"Mật khẩu phải khớp với nhau"
                }
            }
        };
        let inputs = {
            email: email,
            phone_number: phone,
            password: password,
            confirm_password: confirm_password
        }
        const result = validate(inputs, constraints,{fullMessages:false});
        if(result!=undefined){
            if(result["email"]){
                emailInput.showError(result["email"])
                return false
            }
            if(result["phone_number"]){
                phoneInput.showError(result["phone_number"])
                return false
            }
            if(result["password"]){
                passwordInput.showError(result["password"])
                return false
            }
            if(result["confirm_password"]){
                confirmPasswordInput.showError(result["confirm_password"])
                return false
            }
        }
        

        let checkEmailData = new FormData()
        checkEmailData.append("user_email",emailInput.getInputValue())
        checkEmailData.append("user_phone_number",phoneInput.getInputValue())

        let checkEmailRequest = new XMLHttpRequest();
        checkEmailRequest.onreadystatechange = function() {
            console.log(this.responseText)
            if (this.readyState == 4 && this.status == 200) {
                let responseData = JSON.parse(this.responseText)
                let status = responseData["exist_status"]
                if(status=="non_exists"){
                    let signUpData = new FormData()
                    signUpData.append("input_email",emailInput.getInputValue())
                    signUpData.append("input_phone_number",phoneInput.getInputValue())
                    signUpData.append("input_password",passwordInput.getInputValue())
                    signUpData.append("input_confirm_password",confirmPasswordInput.getInputValue())
            
                    let signUpRequest = new XMLHttpRequest();
                    signUpRequest.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            window.location= "../SignUp/VerifyAccount"
                        }
                    };
                    signUpRequest.open("POST", "../SignUp/CreateAccount", true);
                    signUpRequest.send(signUpData);
                }
                else if(status=="email_exists"){
                    showSliderDialogMessage("Email đã được sử dụng, vui lòng sử dụng email khác.")
                }
                else if(status=="phone_exists"){
                    showSliderDialogMessage("Số điện thoại đã được sử dụng, vui lòng đăng ký tài khoản sử dụng số điện thoại khác")
                }
            }
        };
        checkEmailRequest.open("POST", "../SignUp/CheckEmailExist", true);
        checkEmailRequest.send(checkEmailData);
    }
    catch(e){
        console.log(e)
        return false
    }
}