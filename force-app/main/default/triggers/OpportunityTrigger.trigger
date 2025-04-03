trigger OpportunityTrigger on Opportunity (After update) {
    OpportunityTriggerHandler.aafterUpdate(Trigger.New,Trigger.oldMap);
}