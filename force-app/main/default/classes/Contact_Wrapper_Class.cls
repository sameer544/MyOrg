public class Contact_Wrapper_Class {
    public integer indexaccount{get;set;}
    public Account acc{get;set;}
    public List<contact_wp> conList{get;set;}
    public Contact_Wrapper_Class(integer a,Account acc,List<contact_wp> conList){
        this.acc=acc;
        this.conList=conList;
        this.indexaccount=a;
    }
}