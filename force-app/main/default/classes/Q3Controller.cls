public class Q3Controller {
    
 /***************************************************************************************************
 * Created By 	: Sameer Ranjan
 * Created Date : 26-11-108
 * Class Name 	: Q3Controller
 * Description 	: Develop a vf page which should work as a notification dashboard showing total accounts, count of accounts whose rating is hot.
 * *************************************************************************************************/
    
    //Count Account
    public integer countAccount{get;set;}
    
    //Hide Page Block
    public boolean hidblock{get;set;}
    
    //Contractor
    public Q3Controller(){
        hidblock=false;
        hidblock=true;
        List<Account> accList=[Select Id from Account where Rating='Hot'];
        countAccount=accList.size();
    }
    
    //This Method Calculate Number of Account which rating is Hot
    public void countaccount(){
        hidblock=true;
        List<Account> accList=[Select Id from Account where Rating='Hot'];
        countAccount=accList.size();
    }
}