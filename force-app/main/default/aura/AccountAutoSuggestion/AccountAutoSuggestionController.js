({
    ScriptLoaded : function(component, event, helper){
        alert('Load');
    },
	doInit : function(component, event, helper) {
       
	//	jQuery("document").ready(function(){
            
      var availableTags;
            var action=component.get('c.getSuggestions');
            action.setCallback(this,function(response){
                 var state = response.getState();
                if(state==="SUCCESS"){
                    availableTags=response.getReturnValue();
                    $( "#tags" ).autocomplete({
      source: availableTags
    });
                }
            });
    $A.enqueueAction(action);
    
	//});
    },
    onchangeMethod : function(component,event,helper){
        var data=document.getElementById("tags").value;
        alert(''+data);
    }
})