({
    init: function(component, event, helper) {
        var action =component.get('c.onloadMethod');
        action.setCallback(this,function(response){
            // debugger;
            var status = response.getState();
            if(status === "SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.columns", [{type:"text",label:"Name",fieldName:"Name"},{type:"text",label:"First Name",fieldName:"FirstName"},{type:"text",label:"Last Name",fieldName:"LastName"}]);
                component.set("v.data", result);
                component.set("v.filteredData", result);
            }
        });
        $A.enqueueAction(action);
    },
    filter: function(component, event, helper) {
        var data = component.get("v.data"),
            term = component.get("v.filter"),
            results = data, regex;
        try {
            regex = new RegExp(term, "i");
            // filter checks each row, constructs new array where function returns true
            results = data.filter(row=>regex.test(row.Name) || regex.test(row.FirstName));
        } catch(e) {
            // invalid regex, use full list
        }
        component.set("v.filteredData", results);
    }
})