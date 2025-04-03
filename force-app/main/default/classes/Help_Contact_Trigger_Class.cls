public class Help_Contact_Trigger_Class {
    public static void ContactCount1(List<Contact> conList){
        Integer i=0;
        if(conList.size()>1){
            for(Contact con:conList){  
         Help_Contact_Trigger_Class.ContactCount2(con,i);
            i++;
            }
        }
        else{
        boolean varbool;
  		set<Id> IdList=new set<Id>();
        for(Contact con:conList){
        IdList.add(con.AccountId);
        }
        AggregateResult[] countContactList=[select count(id) ct from contact where accountid in:IdList];
        for(AggregateResult countContact:countContactList){
            Integer var=(Integer)countContact.get('ct'); 
            if(Math.mod(var, 2)==0){
                varbool=false;
            }
            else{
                varbool=true;
            }
        }
            for(Contact con:conList){
           con.Description=''+varbool;
            }
        }
    }
    public static void ContactCount2(Contact con,Integer count1){
        set<Id> IdList=new set<Id>();
        IdList.add(con.AccountId);
        AggregateResult[] countContactList=[select count(id) ct from contact where accountid in:IdList];
        for(AggregateResult countContact:countContactList){
            Integer var=(Integer)countContact.get('ct');
            count1=var+count1;
        }
        if(Math.mod(count1, 2)==0){
                con.Description=''+false;
            }
            else{
                con.Description=''+true;
            }
    }
}