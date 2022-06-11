public class Q4Controller {
    /***************************************************************************************************
 * Created By 	: Sameer Ranjan
 * Created Date : 26-11-108
 * Class Name 	: Q4Controller
 * Description 	: Develop a vf page which implements sosl.
 * *************************************************************************************************/
    
    //Seach variable
    public string searchvalue{get;set;}
    
    //Account list Variable
    public list<Account> acclist{get;set;}
    
    //Contractor
    public Q4Controller(){
        acclist=new list<Account>();
    }
    
    //this method give Sosl Result
    public void SoslResult(){
        acclist.clear();
        acclist= [FIND :searchvalue RETURNING Account(Name)][0];
    }
}