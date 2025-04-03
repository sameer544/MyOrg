public with sharing class AccountFetchController {
    @AuraEnabled 
    public static String fetchAccount(Id recordId){
        System.debug('acc rec: '+recordId);
        list<Account> acc= [SELECT Id,Name from Account where Id =: recordId];
        return acc[0].Name;
    }
    @AuraEnabled
    public static Void InsertRecord(String AccountName,String AccountRating,String AccountType,String jsonString){
        System.debug(AccountName);
        System.debug(AccountRating);
        System.debug(AccountType); 
        System.debug(jsonString);
        List<Map<String,String>> obs=(List<Map<String,String>>)JSON.deserialize(jsonString, List<Map<String,String>>.class);
        System.debug(obs[0].get('Name'));
    }
}