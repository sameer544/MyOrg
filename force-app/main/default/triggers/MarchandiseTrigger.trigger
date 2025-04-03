trigger MarchandiseTrigger on Marchandise__c (After insert,After Delete) {
    if(Trigger.IsInsert && Trigger.IsAfter){
        MarchandiseTriggerHandler.insertAfter(Trigger.New);
    }
    if(Trigger.IsDelete && Trigger.IsAfter){
        MarchandiseTriggerHandler.deleteAfter();
    }
}