public class OpportunityBatchProcessing implements Database.Batchable<sObject>,Database.Stateful {

  Decimal totalValue ;
  String query;
  public OpportunityBatchProcessing(){
      totalValue = 0;
      query = 'SELECT Id,Name,StageName,CloseDate,Amount from Opportunity';
  }
  public Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator(query);
  }
  public void execute(Database.BatchableContext bc,List<Opportunity> oppList){
      System.debug('current batch infor='+bc.getJobId());
      List<Opportunity> updateList = new List<Opportunity>();
      for(Opportunity opp : oppList){
          if(opp.Amount!=null){
              totalValue  = totalValue+opp.Amount;
          }
          //System.debug('i want to know howm many times my batch executed with value= '+totalValue);
          opp.Description = 'Updated this opportunity from Batch Apex - VARMA';
          updateList.add(opp);
      }
      if(!updateList.isEmpty()){
          update updateList;
      }
  }
  public void finish(Database.BatchableContext bc){
      Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
      email.setToAddresses(new List<String>{'sameer.ranjan@kvpcorp.com'});
      email.setSubject('Kya kar ra varma');
      email.setPlainTextBody('Kya huva ??????????????????????????????????????????'+'===ITNA PAISA KA KYA KARGEY GA===>'+totalValue);
      Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {email};
      Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
  }
}