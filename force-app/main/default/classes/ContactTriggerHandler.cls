public class ContactTriggerHandler {
    //After Insert Call This Method
    public static void afterInsertContact(List<Contact> conList){
       /* Set<Id> AccountId=new Set<Id>();
        for(Contact con:conList){
            if(AccountId!=NULL)
            AccountId.add(con.AccountId);
        }
        Map<Id,Set<boolean>> boolSet=new Map<id,Set<boolean>>();
        Set<boolean> setvalue; 
        for(Contact con:[Select id,Cbox__c,AccountId from Contact where Accountid in :AccountId order by AccountId]){
            if(boolSet.containskey(con.AccountId)){
                setvalue.add(con.CBox__c);
                boolSet.put(con.AccountId,setvalue);
            }
            else{
                setvalue=new Set<boolean>();
                setvalue.clear();
                setvalue.add(con.CBox__c);
                boolSet.put(con.AccountId,setvalue);
            }
        }
        System.debug(boolSet);
        List<Account> accList=new List<Account>();
        for(Id acc:AccountId){
            if(boolSet.get(acc).size()>1){
                accList.add(new Account(Id=acc,All_Contact_Checked_v__c=false));
            }
            else{
                List<boolean> templist=new List<boolean>(boolSet.get(acc));
                accList.add(new Account(Id=acc,All_Contact_Checked_v__c=templist[0]));
            }
        }
        Database.update(accList);*/
        Set<Id> RecordIds=new Set<Id>();
        for(Contact Ids : conList){
            if(Ids.Id!=Null){
                RecordIds.add(Ids.Id);
            }
        }
        Map<Id,String> submittedUser=new Map<Id,String>();
        for(Contact varCon:[Select Id,OwnerId,OwnerManagerId__c,Manager1__c,Manager2__c,Manager3__c FROM Contact WHERE Id in:RecordIds]){
            if(!submittedUser.containsKey(varCon.Id)){
                submittedUser.put(varCon.Id,varCon.OwnerId+','+varCon.OwnerManagerId__c+','+varCon.Manager1__c+','+varCon.Manager2__c+','+varCon.Manager3__c);
            }
        }
        /*Set<Id> managersId=new Set<Id>();
        for(String varId:submittedUser.values()){
            managersId.add(varId.split(',')[1]);
        }*/
        Approval.ProcessSubmitRequest req1;
        List<Approval.ProcessSubmitRequest> allApproval=new List<Approval.ProcessSubmitRequest>();
        for(Id varId:RecordIds){
            req1=new Approval.ProcessSubmitRequest();
            req1.setComments('Submitting request for approval.');
            req1.setObjectId(varId);
            req1.setSubmitterId(submittedUser.get(varId).split(',')[0]);
            allApproval.add(req1);
        }
        Approval.Process(allApproval);
    }
    //After Delete Call This Method
    public static void afterDeleteContact(List<Contact> conList){
        Set<Id> AccountId=new Set<Id>();
        for(Contact con:conList){
            if(AccountId!=NULL)
            AccountId.add(con.AccountId);
        }
        Map<Id,Set<boolean>> boolSet=new Map<id,Set<boolean>>();
        Set<boolean> setvalue; 
        for(Contact con:[Select id,Cbox__c,AccountId from Contact where Accountid in :AccountId order by AccountId]){
            if(boolSet.containskey(con.AccountId)){
                setvalue.add(con.CBox__c);
                boolSet.put(con.AccountId,setvalue);
            }
            else{
                setvalue=new Set<boolean>();
                setvalue.clear();
                setvalue.add(con.CBox__c);
                boolSet.put(con.AccountId,setvalue);
            }
        }
        System.debug(boolSet);
        List<Account> accList=new List<Account>();
        for(Id acc:AccountId){
            if(boolSet.get(acc).size()>1){
                accList.add(new Account(Id=acc,All_Contact_Checked_v__c=false));
            }
            else{
                List<boolean> templist=new List<boolean>(boolSet.get(acc));
                accList.add(new Account(Id=acc,All_Contact_Checked_v__c=templist[0]));
            }
        }
        Database.update(accList);
    }
    //After Update Call This Method
     public static void afterUpdateContact(List<Contact> conList,List<Contact> oldRecords){
        Set<Id> AccountId=new Set<Id>();
        for(Contact con:conList){
            if(AccountId!=NULL)
            AccountId.add(con.AccountId);
        }
        for(Contact con:oldRecords){
             if(AccountId!=NULL)
            AccountId.add(con.AccountId);
        }
        Map<Id,Set<boolean>> boolSet=new Map<id,Set<boolean>>();
        Set<boolean> setvalue; 
        for(Contact con:[Select id,Cbox__c,AccountId from Contact where Accountid in :AccountId order by AccountId]){
            if(boolSet.containskey(con.AccountId)){
                setvalue.add(con.CBox__c);
                boolSet.put(con.AccountId,setvalue);
            }
            else{
                setvalue=new Set<boolean>();
                setvalue.clear();
                setvalue.add(con.CBox__c);
                boolSet.put(con.AccountId,setvalue);
            }
        }
        System.debug(boolSet);
        List<Account> accList=new List<Account>();
        for(Id acc:AccountId){
            if(boolSet.get(acc).size()>1){
                accList.add(new Account(Id=acc,All_Contact_Checked_v__c=false));
            }
            else{
                List<boolean> templist=new List<boolean>(boolSet.get(acc));
                accList.add(new Account(Id=acc,All_Contact_Checked_v__c=templist[0]));
            }
        }
        Database.update(accList);
    }
}