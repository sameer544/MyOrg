public class AccountComponentDemoApexController {
    @AuraEnabled
    public static List<Object> getAccountList(){
        try {
            return ([Select Id, Name, Type FROM Account Limit 1000]);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Object getContactListAndAccountDetails(String accountId){
        try {
            return ([Select Id,Name, Type, (Select id,FirstName,LastName FROM Contacts) FROM Account where Id=:accountId]);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}