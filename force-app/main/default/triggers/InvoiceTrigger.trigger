trigger InvoiceTrigger on Invoice__c (after insert,after update) {
    if(Trigger.IsInsert && Trigger.Isafter){
        	InvoiceTriggerHandler.insertInvoice(Trigger.New);
    }
    if(Trigger.IsUpdate && Trigger.IsAfter){
            InvoiceTriggerHandler.updateInvoiceRecord(Trigger.New,Trigger.Old);
    }
}