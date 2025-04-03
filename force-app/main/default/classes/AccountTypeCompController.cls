public class AccountTypeCompController {
    class WrapperClass{
        @AuraEnabled
        public string Key;
        @AuraEnabled
        public List<Account> accList;
    }
	@AuraEnabled
    public static List<WrapperClass> mapCreate(){
        List<Account> accList=[Select Id,name,Type,rating From Account where rating!=null order by rating];
        Map<String,List<Account>> mapAccount=new Map<String,List<Account>>();
        List<Account> TempAccount;
        for(Account varAcc:accList){
            if(mapAccount.containsKey(varAcc.rating)){
                TempAccount.add(new Account(Name=varAcc.Name,rating=varAcc.rating));
                mapAccount.put(varAcc.rating,TempAccount);
            }
            else{
                TempAccount=new List<Account>();
                //TempAccount.clear();
                TempAccount.add(new Account(Name=varAcc.Name,rating=varAcc.rating));
                mapAccount.put(varAcc.rating,TempAccount);
            }
        }
        List<WrapperClass> returnvalue=new List<WrapperClass>();
        WrapperClass objectvalue;
        for(String keyvalue:mapAccount.keyset()){
            objectvalue=new WrapperClass();
            objectvalue.key=keyvalue;
            objectvalue.accList=new List<Account>(mapAccount.get(keyvalue));
            returnvalue.add(objectvalue);
        }
        System.debug(objectvalue);
        return returnvalue;
    }
}