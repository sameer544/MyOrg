({
	helperMethod : function(component, event, helper) {
		var action = component.get("c.mapCreate");
         action.setCallback(this,function(response){
           // debugger;
            var status = response.getState();
            if(status === "SUCCESS"){
               var result = response.getReturnValue();
                component.set('v.MapAccount',result);
                console.log(result);
            }
        });
        
        $A.enqueueAction(action);
	}
})