public class ChangeAccountTriggerHandler {
    public static void userOwnerDeactivate(List<Account> newRecords,Map<Id,Account> mapOldRecords){
       set<Id> userDeactiveId=new set<Id>();
        for(Account acc:newRecords){
            if(acc.OwnerId!=mapOldRecords.get(acc.Id).OwnerId){
                userDeactiveId.add(mapOldRecords.get(acc.Id).OwnerId);
            }
        }
        futureMethod(userDeactiveId);
    }
    @future
    public static void futureMethod(set<Id> userDeactiveId){
        List<User> updaterecords=[Select Id,IsActive from user where Id in:userDeactiveId and Profile.name!='System Administrator'];
        for(User ur:updaterecords){
            ur.IsActive=false;
        }
        if(!updaterecords.isEmpty())
        Database.update(updaterecords);
    }
}