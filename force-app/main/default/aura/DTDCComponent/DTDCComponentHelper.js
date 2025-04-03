({
	pageLoad : function(component, event, helper) {
        var action = component.get("c.getJSONResult");
		 action.setCallback(this,function(response){
            debugger;
            var status = response.getState();
            if(status === "SUCCESS"){
               var result = response.getReturnValue();
                component.set('v.CaseNumber','Case Number: '+result[0].CASE_NO);
                component.set('v.ListTrackingInformation',result[0].Tracking_Information);
            }
        });
        $A.enqueueAction(action);
        var sa="Sameer";
	}
})