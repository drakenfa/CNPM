
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
    
    $('form.email-verification-form input.code-input').on('input', function(formElement) {
        $(this).val($(this).val().replace(/[^a-z0-9]/gi, ''));
    });

    $('form').on('submit', doVerifyCode)
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