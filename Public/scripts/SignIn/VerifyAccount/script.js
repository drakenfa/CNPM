
setup()

function setup(){
    let searchParams = new URLSearchParams(window.location.search)
    let status = searchParams.get("status")
    if(status == "timed_out"){
        showSliderDialogMessage("Mã xác nhận hết hạn, vui lòng gửi lại mã xác nhận")
    }
    if(status == "invalid_code"){
        showSliderDialogMessage("Mã xác nhận không đúng, vui lòng kiểm tra lại mã xác nhận")
    }
    for (key in searchParams.keys()){
        searchParams.delete(key)
    }
    const newURL = window.location.origin + window.location.pathname
    window.history.pushState({},document.title,newURL)

    
    $('form.email-verification-form input.code-input').on('input', function(formElement) {
        $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
    });

    $('form.email-verification-form').on('submit', doVerifyCode)
}

function doVerifyCode(){
    try{
        const formElement = document.querySelector("form")
        const codeInputElement = new InputElement(formElement.querySelector(`#input-verification-code`))
    
        let verificationCode = codeInputElement.getInputValue()
        
        let constraints = {
            code:{
                presence:{
                    message:"Mã xác nhận không được để trống"
                },
                length:{
                    is:6,
                    wrongLength:"Mã xác nhận không đủ 06 ký tự."
                }
            }
        };
        let inputs = {
            code: verificationCode
        }
        const result = validate(inputs, constraints,{fullMessages:false});
        if(result!=undefined){
            if(result["code"]){
                codeInputElement.showError(result["code"])
                return false
            }
        }
        return true
    }
    catch(exception){
        console.log(exception.message)
        return false
    }
}

function doResendVerificationCode(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let responseData = JSON.parse(this.responseText)
            let resendStatus = responseData["resend_status"]
            if(resendStatus=="success"){
                showSliderDialogMessage("Gửi lại mã xác nhận thành công")
            }
            else if(resendStatus=="resend_too_soon"){
                showSliderDialogMessage("Vui lòng chờ 30 giây để gửi lại mã xác nhận")
            }
        }
    };
    xhttp.open("GET", "../SignUp/ResendVerificationCode", true);
    xhttp.send();
}