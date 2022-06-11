public class ctrlAccountMerging
{

    public string strAccSearchString {get; set;}
    public Boolean pbhide {get;set;}
    public Boolean pbhide1 {get;set;}
    public Boolean Flag{get;set;}
    public List<Account> lstAccount {get; set;}
    public List<Account> selectedAccount {get; set;}
    public Account mergeAccount {get; set;}
    public List<Account> mergeAccWithoutCheckbox {get; set;}
    public Boolean isResultDisplay {get; set;}
   
    Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
     
    //  constructor
    public ctrlAccountMerging(){
        lstAccount = new List<Account>();
        isResultDisplay = false;
        pbhide=true;
        pbhide1=false;
        Flag=false;
        
    }
}