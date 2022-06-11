/***************************************************************************************************
 * Created By 	: Sameer Nandan
 * Created Date : 05-11-108
 * Class Name 	: Question3_Apex_Class
 * Description 	: Update all lead with address match "other info" object field
 * *************************************************************************************************/
public class Question3_Apex_Class {
	//create duplicate contact
    public void createduplicateAccountContact(){
        List<AggregateResult> countofcontact=[select count(id) ct,accountid actid from contact group by AccountId];
        set<Id> accountids=new set<Id>();
        for(AggregateResult agg:countofcontact){
            if(math.mod((Integer)agg.get('ct'), 2)==0){
            accountids.add((Id)agg.get('actid'));
            }
        }
        list<Contact> conList=[select Id,Name,Account.name,AccountId from contact where accountid in:accountids];
        List<Duplicate_Account_Contact__c> dupRecords=new List<Duplicate_Account_Contact__c>();
        for(contact con:conList){
            Duplicate_Account_Contact__c ob=new Duplicate_Account_Contact__c();
            ob.Account_Name__c=con.Name;
            ob.Contact_Name__c=con.Account.Name;
            ob.AccountId__c=con.accountId;
            dupRecords.add(ob);
        }
        insert dupRecords;
    }
}