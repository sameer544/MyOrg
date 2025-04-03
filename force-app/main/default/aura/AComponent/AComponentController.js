({
    parentComponentEvent : function(component, event, helper) {
        var message = event.getParam("message"); 
        //Set the handler attributes based on event data 
        component.set("v.eventMessage", message + 'Biswajeet'); 
    }
})