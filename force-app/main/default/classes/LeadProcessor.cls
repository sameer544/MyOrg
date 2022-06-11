public class LeadProcessor implements Database.Batchable<Sobject> {
    
    public Database.QueryLocator  start(Database.BatchableContext bc) {
       return Database.getQueryLocator('Select Id,LeadSource FROM Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> records){
        for(Lead each : records){
            each.LeadSource = 'Dreamforce';
        }
        update records;
    }    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    } 

}