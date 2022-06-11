public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountTds){
        
        List<AggregateResult> listCOntact = [SELECT count(Id) coCon,AccountId accId FROM Contact where AccountId in:accountTds group by AccountId];
        List<Account> listAccounts = new List<Account>();
        for(AggregateResult each : listCOntact){
            listAccounts.add(new Account(Id = (Id)each.get('accId'), Number_of_Contacts__c = (Decimal) each.get('coCon')));
        }
        update listAccounts;
        
    }
}