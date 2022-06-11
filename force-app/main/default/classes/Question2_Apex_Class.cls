/***************************************************************************************************
 * Created By 	: Sameer Nandan
 * Created Date : 05-11-108
 * Class Name 	: Question2_Apex_Class
 * Description 	: Update all lead with address match "other info" object field
 * *************************************************************************************************/
public class Question2_Apex_Class {
    public void updateAllLead(){
        List<Other_Info__c> otherinfolist=[select id,city__c,state__c,zipcode__c from Other_Info__c];
        List<Lead> leadList=[select id,PostalCode,State,City from lead];
        for(Lead ld:leadList){
            for(Other_Info__c info:otherinfolist){
                if(ld.State==info.state__c && ld.City==info.city__c){
                 ld.PostalCode= string.valueOf(info.zipcode__c);
                }
            }
        }
        update leadList;
    }
}