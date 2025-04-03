public class EmailNotification implements Database.Batchable<sObject>,Database.stateful {
    List<Id> EmailList;
    Integer i=0;
    String  Query;
    public EmailNotification(){
        EmailList=new List<Id>();
        Query='Select Id,Email from Contact where Email!=Null';
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(Query);
    }
    public void execute(Database.BatchableContext bc,List<Contact> conList){
        for(Contact con:conList){
         EmailList.add(con.id);
        }
    }
    public void finish(Database.BatchableContext bc){
         Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
         mail.setTargetObjectIds(EmailList);
         mail.setTemplateID('00X6F000002ocnF');
         Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});  
    }
}