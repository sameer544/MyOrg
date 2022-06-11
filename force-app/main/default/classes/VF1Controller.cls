/* Seach Account by Name retrive fiels name,type,active etc
 * 
 * 
 */
public class VF1Controller {
    public string searchName{get;set;}
    public List<Account> result{get;set;}
    public VF1Controller(){
        result=new List<Account>();
    }
    public void displayAccount(){
        result.clear();
        if(searchName!='')
        result=[Select Id,Name,rating,type,active__c from Account where Name like :'%'+searchName+'%'];
    }
}