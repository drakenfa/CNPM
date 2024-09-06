
setup()

function setup(){
    let searchParams = new URLSearchParams(window.location.search)

    $('form').on('submit', doVerifyPassword)
}

function doVerifyPassword(){
    try{
        const formElement = document.querySelector("form")
        const passwordInputElement = new InputElement(formElement.querySelector(`#input_new_password`))
    
        let password = passwordInputElement.getInputValue()
        
        let constraints = {
            password:{
                presence:{
                    message:"Mật khẩu không được để trống"
                },
                format:{
                    pattern:/^[a-zA-z0-9]{8,20}$/,
                    message:"Mật khẩu phải có ít nhất 8 ký tự từ A-Z, a-z, 0-9"
                }
            }
        };
        let inputs = {
            password: password
        }
        const result = validate(inputs, constraints,{fullMessages:false});
        if(result!=undefined){
            if(result["password"]){
                passwordInputElement.showError(result["password"])
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