public class AccountEmailUpdate implements Database.Batchable<sObject>,Database.Stateful {
    String EmailFieldUpdateValue='';
    String QueryString;
    Account Info;
    public AccountEmailUpdate(Account value){
        QueryString='Select Id,Email From Contact Where Email!=NULL';
        Info=value;
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator(QueryString);
  }
   public void execute(Database.BatchableContext bc,List<Contact> conList){
       for(Contact con:conList){
      EmailFieldUpdateValue=EmailFieldUpdateValue+','+con.Email;   
       }
  }
    public void finish(Database.BatchableContext bc){
        Account ob=[Select Id,Name,Email__C from Account where Id=:Info.Id];
        ob.Email__C=EmailFieldUpdateValue.removeStart(',');
        System.debug(EmailFieldUpdateValue);
       update ob;
    }
}