class ItemWidget{
    constructor(element){
        this.currentItem = 0;

        this.widgetElement = element;     
        this.widgetList = element.querySelector(".widget-list")        
        this.widgetItems = element.querySelectorAll(".widget-item")

        this.itemSize = {"width" : this.widgetItems[0].offsetWidth, "height" : this.widgetItems[0].offsetHeight};
        this.itemCount = this.widgetItems.length
        this.isMoving=false
    }

    moveToPrevItem(){
        if(!this.isMoving){
            this.isMoving=true
            let prevItem = this.currentItem-1
            if(prevItem<0){
                prevItem=this.itemCount-1
                this.widgetList.style.animation=`${this.widgetElement.id}-slide-to-end 1s ease-in-out`
            }
            else{
                this.widgetList.style.animation=`${this.widgetElement.id}-slide-left 1s ease-in-out`
            }
            setTimeout(()=>{
                this.moveToItem(prevItem)
                this.widgetList.style.animation=""
                this.isMoving=false
            }, 1000);
        }
    }

    moveToNextItem(){
        if(!this.isMoving){
            this.isMoving=true
            let nextItem = this.currentItem+1
            if(nextItem>=this.itemCount){
                nextItem=0
                this.widgetList.style.animation=`${this.widgetElement.id}-slide-to-start 1s ease-in-out`
            }
            else{
                this.widgetList.style.animation=`${this.widgetElement.id}-slide-right 1s ease-in-out`
            }
            setTimeout(()=>{
                this.moveToItem(nextItem)
                this.widgetList.style.animation=""
                this.isMoving=false
            }, 1000);
        }
    }

    moveToItem(item_index){
        const currentOffset = this.widgetItems[this.currentItem].offsetLeft
        const nextOffset = this.widgetItems[item_index].offsetLeft

        this.widgetList.style.left = `-${nextOffset}px`
        this.currentItem = item_index
    }
}

widget_setup()
function widget_setup(){
    widget_elements = Array.from(document.querySelectorAll(".widget-container"));
    for(widget of widget_elements){
        widget.itemWidget = new ItemWidget(widget);
    }
}   