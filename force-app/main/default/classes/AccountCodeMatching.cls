@RestResource(urlmapping='/matchAccountCode/*')
global class AccountCodeMatching {
    @HttpPost
    global static Temp insertAccount(String Name,Integer AccountCode){
        Temp result=new Temp();
    Account_Custom_Object__c ob=new Account_Custom_Object__c();
        ob.Name=result.NameOfCustomObject=Name;
        ob.Account_Code__c=result.AccountCode=AccountCode;
        Account acc=[Select Id,Name from Account where Account_Code__c=:AccountCode][0];
        if(acc!=null){
        	ob.Account__c=acc.id;
            result.AccountName=acc.Name;
            result.AccountId=acc.Id;
            insert ob;
        }
        return  result;
    }
    global class Temp{
        String NameOfCustomObject;
        string AccountName;
        integer AccountCode;
        Id AccountId;
    }
}