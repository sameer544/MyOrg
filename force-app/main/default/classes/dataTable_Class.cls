public class dataTable_Class {
    public List<Account> accList{get;set;}
    public dataTable_Class(){
        accList=new List<Account>();
        accList=[Select Id,Name,Industry,Rating,Phone from Account limit 1000];
    }
}