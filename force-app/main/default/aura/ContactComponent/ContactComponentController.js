({
	doInit : function(component, event, helper) {
		debugger;
        console.log(component);
        component.set("v.NewId",component.get("v.recordId"));
	}
})