//Datatable
public class VF2Controller {
    public List<Account> accList{get;set;}
    public VF2Controller(){
        accList=[Select Id,Name,Type,Industry from Account];
    }
}