({
	doinit : function(component, event, helper) {
		//alert('my new');
	},
    handleSuccess : function(component, event, helper){
        alert('success');
    },
    handleSubmit : function(component, event, helper){
        alert('submit');
    },
    handleLoad : function(component, event, helper){
        alert('onload');
    }
})