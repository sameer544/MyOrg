public class ScheduleExampleData implements System.Schedulable {
  public void execute(System.SchedulableContext sc){
      OpportunityBatchProcessing opcity = new OpportunityBatchProcessing();
      Database.executeBatch(opcity);
  }
  
}