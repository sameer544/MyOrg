@RestResource(urlMapping='/Accounts/*')
global class AccountManager {
	global static RestRequest request = RestContext.request;
    global static RestResponse response = RestContext.response;
    
    @HTTPGET
    global static Account getAccount(){
        Id accountId = request.params.get('Id');
        System.debug('accountId'+accountId);
        Account accountRecord = [SELECT Id,
                                 		Name,
                                 		(SELECT Id,Name FROM Contacts) FROM Account WHERE Id =:accountId];
        return accountRecord;
    }
}