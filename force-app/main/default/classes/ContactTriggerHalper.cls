public class ContactTriggerHalper {
    public static void run(ContactTriggerHandler1 handler){
        if(Trigger.isAfter){
            callAfterMenthod(handler);
        }
    }
    
    public static void callAfterMenthod(ContactTriggerHandler1 handler){
        if(Trigger.isInsert){
            handler.afterInsertMenthod(Trigger.NewMap);
        }
        if(Trigger.isDelete){
            handler.afterDeleteMenthod(Trigger.OldMap);
        }
        if(Trigger.isUpdate){
            handler.afterUpdateMetod(Trigger.NewMap,Trigger.oldMap);
        }
        if(Trigger.isUnDelete){
            handler.afterInsertMenthod(Trigger.NewMap);
        }
    }
}