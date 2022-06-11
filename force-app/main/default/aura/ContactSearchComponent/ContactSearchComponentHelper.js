({
    doInit : function(component, event, helper) {
        var action =component.get('c.onloadMethod');
        action.setCallback(this,function(response){
            // debugger;
            var status = response.getState();
            if(status === "SUCCESS"){
                var result = response.getReturnValue();
                component.set('v.allContact',result);
                component.set('v.allContactTemp',result);
                component.set("v.columns", [{type:"text",label:"Name",fieldName:"Name"}]);
            }
        });
        $A.enqueueAction(action);
    },
    keyCheck : function(component, event, helper){
        var data = component.get("v.allContact"),
            term = component.get("v.searchValue"),
            results = data, regex;
        try {
            regex = new RegExp(term, "i");
            // filter checks each row, constructs new array where function returns true
            results = data.filter(row=>regex.test(row.name) || regex.test(row.age.toString()));
        } catch(e) {
            // invalid regex, use full list
        }
        component.set("v.allContactTemp", results);
    }
})