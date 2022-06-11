/***************************************************************************************************
 * Created By 	: Sameer Nandan
 * Created Date : 05-11-108
 * Class Name 	: Question3_Apex_Class
 * Description 	: Send email when case origin is email
 * *************************************************************************************************/
public class Question5_Apex_Class {
    public void sendEmail(){
        List<case> caseList=[select id,Origin,ContactId,contact.email from case];
        set<Id> em=new set<Id>();
        List<Contact> conList=new  List<Contact>();
        for(case cs:caseList){
            if(cs.Origin=='Email'){
             Contact con=new Contact();
             con.id=cs.ContactId;
             con.Description=cs.contact.email;
                conList.add(con);
            }
        }
        Update conList;
    }
}