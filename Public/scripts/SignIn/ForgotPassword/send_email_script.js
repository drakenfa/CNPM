setup()

function setup(){
    let searchParams = new URLSearchParams(window.location.search)
    let status = searchParams.get("status")
    if(status == "email_not_exist"){
        showSliderDialogMessage("Không tìm thấy email liên kết đến tài khoản")
    }
    if(status == "verification_timed_out"){
        showSliderDialogMessage("Thời gian xác nhận email hết hạn")
    }
    for (key in searchParams.keys()){
        searchParams.delete(key)
    }
    const newURL = window.location.origin + window.location.pathname
    window.history.pushState({},document.title,newURL)

    $('form.forgot-password-form').on('submit', doSendEmail)
}

function doSendEmail(){
    try{
        const formElement = document.querySelector("form")
        const emailInputElement = new InputElement(formElement.querySelector(`#input_email`))
    
        let emailInput = emailInputElement.getInputValue() 
        
        let constraints = {
            email_input:{
                presence:{
                    message:"Email không được để trống"
                },
                email:{
                    message:"Email không đúng định dạng"
                }
            }
        };
        let inputs = {
            email_input: emailInput
        }
        const result = validate(inputs, constraints,{fullMessages:false});
        console.log(result)
        if(result!=undefined){
            if(result["email_input"]){
                emailInputElement.showError(result["email_input"])
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