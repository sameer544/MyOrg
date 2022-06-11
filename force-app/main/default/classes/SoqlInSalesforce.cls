/***************************************************************************************************************
 * @created By : KVP
 * @created Date : 10/10/2018
 * @Class Name : SoqlInSalesforce
 * @Description : This class show the example of soql use in salesforce.
 * **************************************************************************************************************
 * Modification History : 
 * Method Name : 
 ************************************************************************/
public class SoqlInSalesforce {
    //SOQL Method
    public static void soqlMethod(){
       Map<String,Integer> mapvar=new Map<String,Integer>();
       List<sObject> aggregateFunctionResult=[SELECT Industry IId, Count(Name) CId FROM Account GROUP BY Industry];
       for (sObject var : aggregateFunctionResult)  
           mapvar.put((String)var.get('IId'),(Integer)var.get('CId'));
        System.debug(aggregateFunctionResult);
    }
    public static void parentChildSoqlQuery(){
        //List<Account> parentChild=[SELECT Id,Name,(SELECT ID,Name FROM )]
        /*List<Account> accountId=[SELECT Id FROM Account];
        List<New_Object_Record__c> newObjectRecordList=new List<New_Object_Record__c>();
        Integer i=1;
        for(Account var:accountId){
            New_Object_Record__c  record=new New_Object_Record__c();
            record.Name='NewRecordName'+i;
            record.Account__c=var.ID;
            i++;
            newObjectRecordList.add(record);
        }
        insert newObjectRecordList;*/
        Map<Account,List<New_Object_Record__c>> mapList=new Map<Account,List<New_Object_Record__c>>();
        for(Account var: [SELECT ID,Name,(SELECT Id,Name, Account__r.Name FROM New_Object_Records__r) FROM Account])
            mapList.put(var,var.New_Object_Records__r);
        //for(Account var:mapList.keySet())
          //  System.debug('New Object Record ID='+mapList.get(var)[1].Name+',Account Name='+var.name);
        for(List<New_Object_Record__c> var:mapList.values())
            System.debug('New Object Record ID='+var[1].Name+',Account Name='+var[1].Account__r.Name);
    }
    public static void aggregateQuery(){
        Map<Account,List<Contact>> mapResult1=new Map<Account,List<Contact>>();
        for(Account acc:[SELECT ID,Name, (SELECT ID,Name FROM Contacts) FROM Account where Id!=null]){
            mapResult1.put(acc,acc.contacts);
        }
        Map<Id,Integer> mapResult2=new Map<Id,Integer>();
        for(Account acc:[SELECT ID,Name, (SELECT ID,Name FROM Contacts) FROM Account where Id!=null]){
            if(acc.contacts.size()>0){
                mapResult2.put(acc.Id,acc.contacts.size());
            }
        }
        //System.debug(mapResult2);
        mapResult2.clear();
        for(Contact con:[SELECT ID,Name,AccountId FROM Contact Account where AccountId!=null]){
            if(mapResult2.get(con.AccountId)==null){
                mapResult2.put(con.AccountId,1);
            }
            else{
                Integer i=mapResult2.get(con.AccountId);
                i++;
                mapResult2.put(con.AccountId,i);
            }
        }
        //System.debug(mapResult2);
        mapResult2.clear();
        for(AggregateResult agg:[SELECT  Accountid AID,Count(id) CID from contact group by  AccountId])
            mapResult2.put((ID)agg.get('AID'),(Integer)agg.get('CID'));
        System.debug(mapResult2);
    }
}