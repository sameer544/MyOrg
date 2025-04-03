({
    handlekeyup :function(component, event, helper){
        var src=event.getSource();
        component.set('v.valueenter',src);
    },
	handlefocus : function(component, event, helper) {
        var listval=component.get('v.value3');
        for(var i=0;i<listval.length;i++){
            if(i==0){
                listval[i]=component.get('v.value1');
            }
        }
        component.set('v.value3',listval);
	},
    handlefocusv : function(component, event, helper){
        component.set('v.value3',component.get('v.value2'));
    }
})