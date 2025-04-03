trigger TriggerContactSum on Contact (before insert,after insert,before update,after update,after delete,before delete) {
    if(Trigger.isbefore && Trigger.isInsert){
        Trigger_HeplerClass.insertContact(Trigger.new,Trigger.old);
    }
    if(Trigger.isafter && Trigger.isUpdate){
        Trigger_HeplerClass.updateContact(Trigger.new,Trigger.old);
    }
    if(Trigger.isafter && Trigger.isdelete){
        Trigger_HeplerClass.deleteContact(Trigger.old);
    }
}