public class Controller_Dynamic_pickList {
    public List<SelectOption> DynamicPickList{get;set;}
    public Account acc{get;set;}
    public Controller_Dynamic_pickList(){
        acc=new Account();
        DynamicPickList=new List<SelectOption>();
        DynamicPickList.add(new selectOption('--none--','--none--'));
    }
    public void enablePickList(){
        DynamicPickList.clear();
        String selectedValue=acc.Industry;
        List<Account> accList=[Select Id,Name from account where industry=:selectedValue]; 
        //System.debug(accList.size());
        for(Account acc:accList){
            DynamicPickList.add(new selectoption(acc.Name,acc.name));
        }
    }
}