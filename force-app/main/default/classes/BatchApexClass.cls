public class BatchApexClass implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return database.getQueryLocator([Select Id,Name,parentId From Task]);
    }
    public void execute(database.BatchableContext bc,List<Task> taskList){
        Set<Id> caseIdsToUpdated = new Set<Id>();

        for(task eachtask : taskList){
            caseIdsToUpdated.add(eachtask.parentId);
        }
        List<Case> fetchCaseRecords = [Select id,Ismark__c from Case where Id in:caseIdsToUpdated for update];
        for(Case eachCaseRecord: fetchCaseRecords){
            eachCaseRecord.Ismark__c = true;
        }
        if(!fetchCaseRecords.isEmpty()){
            update fetchCaseRecords;
        }
    }
    public void finish(database.BatchableContext bc){
        
    }
}