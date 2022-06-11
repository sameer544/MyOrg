@RestResource(urlMapping='/GoogleDialogFlow/*')
global class RestApiExample {
    //public static string attributes;
    global static RestRequest request = RestContext.request;
    global static RestResponse response = RestContext.response;
    
    @HTTPGET
    global static Void saveAddInvestorDeal1(){
       // RestRequest request = RestContext.request;
       // RestResponse response = RestContext.response;
        Map<String,String> reponseMap = new Map<String,String>();
        try {
               /* System.debug('request:'+ request);
                System.debug('response:'+ response);
                System.debug('request.requestBody: '+request.requestBody);
                String jsonString = request.requestBody.toString();
                WrapperClass newAccount = (WrapperClass)(JSON.deserializeStrict(jsonString, WrapperClass.class));
                Database.insert(newAccount.Acc);
                System.debug('newAccount : '+newAccount.Acc);
                response.statusCode = 200;
                reponseMap.put('Status','Ok');
                reponseMap.put('RecordId', ''+newAccount.Acc.Id);*/
                List<Account> restlAccounts = [SELECT ID FROM Account];
                String responseString = JSON.serialize(restlAccounts);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }catch (Exception ex){
                response.statusCode = 400;
                reponseMap.put('Status','Error');
                reponseMap.put('ErrorMessage',ex.getMessage());
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }
    }

    @HTTPDELETE
    global static void deleteAccount(){
        
        Map<String,String> reponseMap = new Map<String,String>();
        try {
                System.debug('request:'+ request);
                System.debug('response:'+ response);
                System.debug('request.requestBody: '+request.requestBody);
                String jsonString = request.requestBody.toString();
                WrapperClass newAccount = (WrapperClass)(JSON.deserializeStrict(jsonString, WrapperClass.class));
                System.debug('newAccount : '+newAccount.Acc.AccountExternalId__c);
                Account deleteAccount = [Select Id FROM Account where AccountExternalId__c =: newAccount.Acc.AccountExternalId__c limit 1];
                Database.delete(deleteAccount);
                response.statusCode = 200;
                reponseMap.put('Status','Record Updated');
                reponseMap.put('RecordExternalId', ''+newAccount.Acc.AccountExternalId__c);
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }catch (Exception ex){
                response.statusCode = 400;
                reponseMap.put('Status','Error');
                reponseMap.put('ErrorMessage',ex.getMessage());
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }
    }

    @HTTPPOST
    global static Void updateAccount(){
        //RestRequest request = RestContext.request;
        //RestResponse response = RestContext.response;
        Map<String,String> reponseMap = new Map<String,String>();
        try {
                System.debug('request:'+ request);
                System.debug('response:'+ response);
                System.debug('request.requestBody: '+request.requestBody);
                String jsonString = request.requestBody.toString();
                WrapperClass newAccount = (WrapperClass)(JSON.deserializeStrict(jsonString, WrapperClass.class));
                System.debug('newAccount : '+newAccount.Acc.AccountExternalId__c);
                Account updateAccount = [Select Id FROM Account where AccountExternalId__c =: newAccount.Acc.AccountExternalId__c limit 1];
                newAccount.acc.Id = updateAccount.Id;
                Database.update(newAccount.Acc);
                response.statusCode = 200;
                reponseMap.put('Status','Record Updated');
                reponseMap.put('RecordExternalId', ''+updateAccount.AccountExternalId__c);
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }catch (Exception ex){
                response.statusCode = 400;
                reponseMap.put('Status','Error');
                reponseMap.put('ErrorMessage',ex.getMessage());
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }
    }
    
    @HTTPPUT
    global static Void createAccount(){
        //RestRequest request = RestContext.request;
        //RestResponse response = RestContext.response;
        Map<String,String> reponseMap = new Map<String,String>();
        try {
                System.debug('request:'+ request);
                System.debug('response:'+ response);
                System.debug('request.requestBody: '+request.requestBody);
                String jsonString = request.requestBody.toString();
                WrapperClass newAccount = (WrapperClass)(JSON.deserializeStrict(jsonString, WrapperClass.class));
                Database.insert(newAccount.Acc);
                Account createdAccount = [SELECT Id, AccountExternalId__c FROM Account WHERE Id =: newAccount.Acc.Id];
                System.debug('newAccount : '+createdAccount.AccountExternalId__c);
                response.statusCode = 200;
                reponseMap.put('Status','Inserted');
                reponseMap.put('RecordExternalId', ''+createdAccount.AccountExternalId__c);
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }catch (Exception ex){
                response.statusCode = 400;
                reponseMap.put('Status','Error');
                reponseMap.put('ErrorMessage',ex.getMessage());
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }
    }
    public  class WrapperClass {
       Account Acc;
    } 
}