class InputElement{
    constructor(c_inputElement){
        if(!c_inputElement.classList.contains("c-input")){
            throw new Error("invalid c-input element")
        }

        this.errorMessageElement = c_inputElement.querySelector("div.input-error-message")
        this.inputElement = c_inputElement.querySelector(".input")
    }

    hideError(){
        this.errorMessageElement.style.display='none'
        if(this.inputElement){
            this.inputElement.classList.remove('input-error-highlight')
        }
    }
    
    showError(strMessage){
        this.setErrorMessage(strMessage)
        this.errorMessageElement.style.display='block'
        if(this.inputElement){
            this.inputElement.classList.add('input-error-highlight')
        }
    }

    setErrorMessage(strMessage){
        this.errorMessageElement.innerText=`*${strMessage}`
    }

    getInputValue(){
        return this.inputElement.value
    }

    setInputValue(value){
        this.inputElement.value = value
    }

    isChecked(){
        return this.inputElement.checked
    }

    setChecked(boolVal){
        this.inputElement.checked = boolVal
    }
}

function show_notification_dialog(notificationID){
    notificationWrapperElement = document.querySelector(".notification-wrapper")

    notificationBoxElement = notificationWrapperElement.querySelector(`#${notificationID}`)

    notificationWrapperElement.style.display = "block"
}

function hide_notification_dialog(notificationID){
    
}

function showSliderDialogMessage(message){
    dialogElement = document.querySelector("#notifications-wrapper .slider-notification-wrapper")
    dialogElement.style.display="block"
    dialogElement.style.animation="slider-dialog-slide-down-effect 0.3s"
    dialogElement.querySelector(".notification-message").innerText = message
    
    setTimeout(() => {
        closeSliderDialog(dialogElement)
    }, 3000);
}

function closeSliderDialog(dialogElement){
    dialogElement.style.animation="slider-dialog-slide-up-effect 0.3s"
    setTimeout(function(){
        dialogElement.style.display="none"
    }, 300); 
}