public with sharing class OptionHandler {
    
    public void beforeInsertMenthod(List<SObject> newRecords){
        List<Option__c> newOptionRecords = (List<Option__c>)newRecords;
        for(Option__c each : newOptionRecords){
            each.Response_Count__c += 1;
        }
    }
}