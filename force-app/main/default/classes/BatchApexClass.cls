public class BatchApexClass implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return database.getQueryLocator([Select Id,Name From Account]);
    }
    public void execute(database.BatchableContext bc,List<Account> accList){
        
    }
    public void finish(database.BatchableContext bc){
        
    }
}