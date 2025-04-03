({
	handler : function(component, event, helper) {
		console.log('d');
	},
    handleClick : function(component, event, helper) {
        var compEvent = component.getEvent("sampleComponentEvent");
        compEvent.fire();
    }
})