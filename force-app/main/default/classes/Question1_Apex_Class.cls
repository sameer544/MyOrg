/***************************************************************************************************
 * Created By 	: Sameer Nandan
 * Created Date : 05-11-108
 * Class Name 	: Question1_Apex_Class
 * Description 	: Create all contact records
 * *************************************************************************************************/
public class Question1_Apex_Class {
    public void updatecontact(){
        Account1__c customsetting=Account1__c.getOrgDefaults();
        String industryna=customsetting.IndustryName__c;
        list<String> csindustry=industryna.split(',');
        set<String> setindustry=new set<String>(csindustry);
        //System.debug(setindustry);
    	List<Contact> accList=[select Id,Name,Account.Industry,	Description,Account.Description from contact where Account.Industry in:setindustry];
        for(Contact con:accList){
            con.Description=con.account.Description;
        }
        update accList;
    }
}