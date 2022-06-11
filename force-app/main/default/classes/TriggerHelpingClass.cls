public class TriggerHelpingClass {
    public static void insertAccountAnnualRevenue(List<Contact> NewRecord,List<Contact> OldRecord){
        Account var=new Account();
        for(Account AccVar:[SELECT ID,Sum_Of_Annual_Revenue__c FROM Account]){
            if(AccVar.Id==NewRecord[0].AccountId){
                var.Sum_Of_Annual_Revenue__c=(AccVar.Sum_Of_Annual_Revenue__c==null?0:AccVar.Sum_Of_Annual_Revenue__c)+NewRecord[0].Annual_Revenue_Pay__c;
            }
        }
        update var;
    }
}