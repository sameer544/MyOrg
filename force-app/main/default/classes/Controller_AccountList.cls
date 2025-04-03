public class Controller_AccountList {
   
    public boolean removeButton{get;set;}
    public Integer IndexNumber{get;set;}
    public  List<Account> TempAccount{get;set;}
    public Integer counter =0;
    
    public Controller_AccountList(){
         TempAccount=new List<Account>();
         Account ob=new Account();
        TempAccount.add(ob);
    }
    public void AddAccount(){ 
       Account ob=new Account();
        TempAccount.add(ob);
        if(TempAccount.size()==1){
            removeButton=true;
        }
        else{
            removeButton=false;
        }
    }
    public void removeAccount(){
        Integer indexof=Integer.valueOf(ApexPages.currentPage().getParameters().get('Index'));
        TempAccount.remove(indexof-1);
          if(TempAccount.size()==1){
            removeButton=true;
        }
        else{
            removeButton=false;
        }
    }
    public void saveAllAccount(){
        upsert TempAccount;
        TempAccount.clear();
         Account ob=new Account();
        TempAccount.add(ob);
       
    }
    public void cancelsave(){
         TempAccount.clear();
         Account ob=new Account();
        TempAccount.add(ob);
    }
}