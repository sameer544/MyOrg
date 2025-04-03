({
	fetchAccount : function(component, event, helper) {
        debugger;
		var action = component.get("c.fetchAccount");
        var recordId = component.get("v.recordId");
        console.log(recordId);
        action.setParams({
            "recordId" : recordId
        });
        action.setCallback(this,function(response){
            debugger;
            var status = response.getState();
            if(status === "SUCCESS"){
               var result = response.getReturnValue();
                component.set('v.accountName',result);
            }
        });
        $A.enqueueAction(action);
	},
    InsertAccountRecord : function(component, event, helper){
        alert(component.get('v.account.LastName'));
      /*  debugger;
        //alert(''+component.get("v.account.Name"));
       var action = component.get("c.InsertRecord");
      //  var recordId = component.get("v.recordId");
       // console.log(recordId);
       console.log(component.get("v.account"));
        var jobj=component.get("v.account");
        var Name=jobj["Name"];
        var type=jobj["Type"];
        var Rating=jobj["Rating"];
        var joject=[{"Name": Name,'Type' :type,'Rating':Rating}];
        var jsonstring=JSON.stringify(joject);
        action.setParams({
            "jsonString" : jsonstring,
            "AccountName" : component.get("v.account.Name"),
            "AccountRating" : component.get("v.account.Rating"),
            "AccountType" : component.get("v.account.Type")
        });action.setCallback(this,function(response){
            debugger;
            var status = response.getState();
            if(status === "SUCCESS"){
               var result = response.getReturnValue();
                component.set('v.accountName',result);
            }
        });
        $A.enqueueAction(action); */
    }
})