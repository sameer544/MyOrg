public class Help_Class_New {
    public static void UserIsInactive(User UserRecord){
        if(UserRecord.IsActive==false){
           futuremethod(UserRecord.Id);
        }
    }
    @future
    public static void futuremethod(Id UserRecord){
         List<Account> accList=[Select Id,Name,OwnerId from account where OwnerId=:UserRecord];
        Id UserAdminId=(Id)SystemAdminId__c.getOrgDefaults().AdminId__c;
           user AdminNameUserId=[Select Id,Name from User where ProfileId=:UserAdminId][0];
        System.debug(AdminNameUserId);
             //  System.debug(UserAdminId);
            //System.debug(AdminNameUserId);
            for(Account acc:accList){
                acc.ownerId=AdminNameUserId.Id;
            }
            update accList;
    }
}