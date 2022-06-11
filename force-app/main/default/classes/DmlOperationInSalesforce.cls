/**********************************************************
*@Created By   : Sameer Ranjan
*@Created Date : 09/10/2018
*@Class Name   : DmlOperationInSalesforce
*@Description  : This Class Make use of DML Operation.
***********************************************************/
public class DmlOperationInSalesforce {
    //Dml Operation Method
    Public static void dmlOperation(){
        //Insert
        Account accobject=new Account();
        accobject.Name='NewRecord';
        insert accobject;
        //Insert List Of Object
        List<Account> accList=new List<Account>();
        accobject=new Account();
        accobject.Name='NewRecord1';
        accList.add(accobject);
        accobject=new Account();
        accobject.Name='NewRecord2';
        accList.add(accobject);
        insert accList;
        //Update 
        for(Account var:accList){
            var.Active__c='Yes';
        }
        update accList;
        //Upsert
        for(Account var:accList){
            var.Active__c='No';
        }
        accobject=new Account();
        accobject.Name='NewRecord3';
        accList.add(accobject);
        upsert accList;
        //Delete
        delete accList;
    }
   //Method for create Account in Account Object.
   public static void createAccount(){
       List<Account> listAccount=new List<Account>();
       for(Integer i=0;i<20;i++){
           Account Acc=new Account();
           Acc.Name='Record'+i;
           Acc.Industry='Agriculture';
           listAccount.Add(Acc);
       }
       insert listAccount;
   }
    //This Method Create Contact And Opportunity Record in Account Object
    public static void createContactOpportunity(){
       List<Contact> listContact=new List<Contact>();
       List<Opportunity> listOpportunity=new List<Opportunity>();
        for(Integer  i=0;i<5;i++){
            Contact ConVar=new Contact();
            Opportunity OppVar=new Opportunity();
            OppVar.AccountId='0016F00002gngEg';
            OppVar.Name='Contact'+i;
            OppVar.CloseDate=Date.valueOf('2018-10-10');
            OppVar.StageName='Prospecting';
            ConVar.AccountId='0016F00002gngEg';
            ConVar.LastName='ContactRecord'+i;
            listContact.add(ConVar);
            listOpportunity.add(OppVar);
        } 
        insert listContact;
        insert listOpportunity;
    }
    //This Method Insert record in Account Object and store record in map.
    public static void mapMethodData(){
		List<Account> Listacct=new List<Account>();
        for(Integer i=0;i<5;i++){
            Account acc=new Account();
            acc.Name='Sameerranjansam'+i;
            Listacct.add(acc);
        }
        insert Listacct;
        Map<Id,Account>  MapView=new Map<Id,Account>(Listacct);
        // for(Account accountdata:Listacct)
        //MapView.put(accountdata.Id,accountdata);
        for(Id key:MapView.keyset())
           System.debug('Map Key='+key+',Value='+MapView.get(key));
        Listacct.clear();
        //for(Id key:MapView.keyset())
        // System.debug('Map Key='+key+',Value='+MapView.get(key));
    }
}