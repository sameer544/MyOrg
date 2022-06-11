/***************************************************************************************************
 * Created By 	: Sameer Nandan
 * Created Date : 05-11-108
 * Class Name 	: Question4_Apex_Class
 * Description 	: Create Opportunities Duplicate record type
 * *************************************************************************************************/
public class Question4_Apex_Class {
    public void createDuplicateRecord(){
        List<Opp_Duplicator__c> oppList1=new List<Opp_Duplicator__c>();
        List<Opportunity> oppList= [select id,name,RecordTypeId from Opportunity];
        for(Opportunity opp:oppList){
            Opp_Duplicator__c ob=new Opp_Duplicator__c();
             ob.Opportunity__c=opp.Name;
             ob.Opportunity_Id__c=opp.Id;
             ob.RecordType.name=opp.RecordType.name;
            System.debug(opp.RecordTypeId);
            oppList1.add(ob);
        }
        insert oppList1;
    }
}