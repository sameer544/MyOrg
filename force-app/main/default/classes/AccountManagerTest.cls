@isTest
public class AccountManagerTest {
    static testMethod void method1(){
        Account accRecord = new Account();
        accRecord.Name = 'Test';
        insert accRecord;
        Contact conRecord = new Contact();
        conRecord.AccountId = accRecord.Id;
        conRecord.LastName = 'TestContact';
        insert conRecord;
        
        RestRequest request = new RestRequest();
        String value = 'https://sameerranjan-dev-ed.my.salesforce.com/services/apexrest/Accounts?Id='+accRecord.Id;
        System.debug(''+value);
        request.requestUri = value;
        request.httpMethod = 'GET';
        request.params.put('Id',accRecord.Id);
        RestContext.request = request;
        AccountManager.getAccount();
        
    }
}