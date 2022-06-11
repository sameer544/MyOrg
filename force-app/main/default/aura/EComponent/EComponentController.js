({
    childComponentEvent : function(component, event, helper) {
        var evet = component.getEvent("sampleCmpEvent");
        evet.setParams({"message" : "child message"});
        evet.fire();
    }
})