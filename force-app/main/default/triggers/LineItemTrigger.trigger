trigger LineItemTrigger on Line_Item__c (After insert) {
	if(Trigger.IsInsert && Trigger.IsAfter){
        LineItemTriggerHandler.insertAfter(Trigger.New);
    }
    if(Trigger.IsUpdate && Trigger.IsBefore){
      //  LineItemTriggerHandler.updateBefore(Trigger.New);
    }
    if(Trigger.IsDelete && Trigger.IsAfter){
        
    }
}