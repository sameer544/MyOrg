public class Help_Opportunity_Tripper_Class {
    public static void updateAccount(List<Opportunity> oppList,List<Opportunity> NewRecords){
        set<Id> oppor=new set<Id>();
        List<Account> accList=new List<Account>();
        for(Opportunity op:oppList)
            oppor.add(op.AccountId);
        List<AggregateResult> aquery=[Select Count(Id) countofopp,sum(Amount) sumofopp,AccountId aid from Opportunity where StageName='Closed Won' and AccountId in:oppor group by AccountId];
        System.debug('NewRecords='+NewRecords);
        System.debug('Agg Query='+aquery);
        for(AggregateResult agg:aquery){
            Account acc=new Account();
            acc.Opportunity_Count__c=(decimal)agg.get('countofopp');
            acc.AnnualRevenue=(decimal)agg.get('sumofopp');
            acc.Id=(Id)agg.get('aid');
            accList.add(acc);
        }
        System.debug(accList);
        update accList;
    }
     public static void updateAccountwhenDelete(List<Opportunity> oppList){
        set<Id> oppor=new set<Id>();
        List<Account> accList=new List<Account>();
        for(Opportunity op:oppList)
            oppor.add(op.AccountId);
        List<AggregateResult> aquery=[Select Count(Id) countofopp,sum(Amount) sumofopp,AccountId aid from Opportunity where StageName='Closed Won' and AccountId in:oppor group by AccountId];
        for(AggregateResult agg:aquery){
            Account acc=new Account();
            acc.Opportunity_Count__c=(decimal)agg.get('countofopp');
            acc.AnnualRevenue=(decimal)agg.get('sumofopp');
            acc.Id=(Id)agg.get('aid');
            accList.add(acc);
        }
             
        System.debug(accList);
        update accList;
    }
     public static void updateAccountwhenDeleteBefore(List<Opportunity> oppList){
        set<Id> oppor=new set<Id>();
        List<Account> accList=new List<Account>();
        for(Opportunity op:oppList)
            oppor.add(op.AccountId);
        List<AggregateResult> aquery=[Select Count(Id) countofopp,sum(Amount) sumofopp,AccountId aid from Opportunity where StageName='Closed Won' and AccountId in:oppor group by AccountId];
         
        System.debug('Agg Query='+aquery);
        for(AggregateResult agg:aquery){
            Account acc=new Account();
            acc.Opportunity_Count__c=(decimal)agg.get('countofopp');
            if(acc.Opportunity_Count__c==1){
            acc.AnnualRevenue=0;
            acc.Opportunity_Count__c=0;    
            acc.Id=(Id)agg.get('aid');
                accList.add(acc);
            }
        }
         if(accList.Size()==1){
             update accList;
         }
        //System.debug(accList);
        //update accList;
    }
}