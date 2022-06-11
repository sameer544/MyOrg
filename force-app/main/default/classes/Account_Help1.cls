public class Account_Help1 {
    public static void createAccountRecord(List<Account> accList){
        List<Account> Existingrecord=[Select Id,Name from Account];
        set<String> NameList=new set<String>();
        for(Account acc:Existingrecord){
            NameList.add(acc.Name);
        }
        for(Account acc:accList){
            if(!NameList.add(acc.Name)){
                acc.adderror('Duplicate Record');
            }
        }
    }
}