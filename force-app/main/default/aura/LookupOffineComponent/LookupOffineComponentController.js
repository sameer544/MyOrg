({
    seachWindow : function(component, event, helper) {
        component.set('v.OpenSearchWindow',true);
    },
    closeModel: function(component,event,helper){
        component.set('v.OpenSearchWindow',false);
    }
})