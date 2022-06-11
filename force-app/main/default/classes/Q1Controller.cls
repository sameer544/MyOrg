public class Q1Controller {
 /***************************************************************************************************
 * Created By 	: Sameer Ranjan
 * Created Date : 26-11-108
 * Class Name 	: Q1Controller
 * Description 	: Develop an vf page with search functionality using onkeyup event, for lead object.
 * *************************************************************************************************/
    //Search Variable
    public String searchValue{get;set;}
    
    //List of lead Variable
    public List<Lead> leadList{get;set;}
    
    //Hide Page Block through this boolean Variable
    public boolean Hidpagebl{get;set;}
    
    //Contractor
    public Q1Controller(){
        Hidpagebl=false;
        leadList=new List<Lead>();
    }
    
    //Search Lead By Name
    public void searchLead(){
        if(searchValue!=''){
            Hidpagebl=true;
            leadList.clear();
            leadList=[Select Id,Name from Lead where Name like :'%'+searchValue+'%'];
        }
        else{
            leadList.clear();
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Enter !'));
        }
    }
}