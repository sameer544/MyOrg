public class AccountListExtension {
    public ApexPages.StandardController Controller;
    public List<Contact> conList{get;set;}
    public boolean hideContactlist{get;set;}
    Id accRecord;
    public Id conId{get;set;}
    public AccountListExtension(ApexPages.StandardController controller){
        this.Controller=controller;
        hideContactlist=true;
    }
    public void ConteactRecords(){
        accRecord=Controller.getId();
        conList=[select Id,Name,FirstName,Lastname from Contact where AccountId=:accRecord];
    }
    public void EditContact(){
    } 
}