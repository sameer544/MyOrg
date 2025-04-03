public class HelpClassChangeOwner {
    public static void updateRecord(List<user> uList){
        if(!uList[0].isActive){
   		futureMethod();
        }
    }
    @future
    public static void futureMethod(){
        List<Account> accList=[select OwnerId,Name from account where OwnerId in (select Id from user where IsActive=false)];
        if(accList!=null){
    id accId=[Select Id from User where IsActive=true][0].Id;
        List<Contact> conList=[Select Id,Name from contact where AccountId in :accList];
   // User un= Trigger.New[0]
    for(Account acc:accList){
        acc.OwnerId =accId;
    }
            update accList;
    }
    
}
}