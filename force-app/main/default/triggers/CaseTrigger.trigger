trigger CaseTrigger on Case__c (after insert) {
	CaseTriggerHandler.beforeInsertMethod(Trigger.New, Trigger.NewMap);
}