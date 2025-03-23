public class Accounts extends fflib_SObjectDomain {
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }
    
    public override void onApplyDefaults(){
        for(Account acc : (List<Account>) Records) {
            acc.Description = 'Domain classes rock!';
        }
    }
    
    public override void onBeforeUpdate(Map<Id,Sobject> existingRecords){
        for(Account acc : (List<Account>) Records) {
            if(acc.Description != (String)existingRecords.get(acc.Id).get('Description')){
                acc.AnnualRevenue = ((String)existingRecords.get(acc.Id).get('Description')).getLevenshteinDistance(acc.Description);
            }
        }
    }
}