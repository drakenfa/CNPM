$('form.sign-in-form').on('submit', processSignIn);

setup()
function setup(){
    let searchParams = new URLSearchParams(window.location.search)
    let status = searchParams.get("status")
    if(status == "login_failed"){
        showSliderDialogMessage("Thông tin đăng nhập không chính xác")
    }
    else if(status == "verify_success"){
        showSliderDialogMessage("Xác nhận email thành công")
    }
    else if(status == "change_password_success"){
        showSliderDialogMessage("Đổi mật khẩu thành công")
    }
    for (key in searchParams.keys()){
        searchParams.delete(key)
    }
    const newURL = window.location.origin + window.location.pathname
    window.history.pushState({},document.title,newURL)

    //cookies
    let formElement = document.querySelector('form.sign-in-form')
    let usernameInput = new InputElement(formElement.querySelector('#input_username'))
    let passwordInput = new InputElement(formElement.querySelector('#input_password'))
    let isRememberPasswordInput = new InputElement(formElement.querySelector('#input_remember_password'))
    
    const rememberUsername = getCookie("remember_username")
    const rememberPassword = getCookie("remember_password")
    if(rememberUsername!=""){
        usernameInput.setInputValue(rememberUsername)
        passwordInput.setInputValue(rememberPassword)
        isRememberPasswordInput.setChecked(true)
    }
}

function processSignIn(){
    try{
        let formElement = document.querySelector('form.sign-in-form')
        let usernameInput = new InputElement(formElement.querySelector('#input_username'))
        let passwordInput = new InputElement(formElement.querySelector('#input_password'))
        let isRememberPasswordInput = new InputElement(formElement.querySelector('#input_remember_password'))

        if(usernameInput.getInputValue()==""){
            usernameInput.showError("Thông tin đăng nhập không được để trống")
            return false
        }
        else if(passwordInput.getInputValue()==""){
            passwordInput.showError("Mật khẩu không được để trống")
            return false
        }
        
        return true
    }
    catch(e){
        console.log(e)
        return false
    }
}

function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for(let i = 0; i <ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }