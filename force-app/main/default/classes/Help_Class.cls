public class Help_Class {
    public static void insertaccount(List<Account> accList){
        set<Id> Setkey=new set<Id>();
        for(Account accountVar:accList){
            setkey.add(accountVar.id);
        }
        List<Account> accountList=new List<Account>();
       // accountList.addAll(accList);
        for(Account accountVar:[Select id,Name,createddate,description from account where id in:setkey]){
           accountVar.Description='Name='+accountVar.Name +' CreatedDate='+ accountVar.CreatedDate;
           accountList.add(accountVar);
        }
        //for(Account accountVar:accountList){
           // accountVar.Description='Name='+accountVar.Name +' CreatedDate='+ accountVar.CreatedDate;
        //}
        //for(Account accountVar:accountList){
          //  System.debug(accountVar.id);
        //}
         upsert accountList;
    }
}