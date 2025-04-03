public class Controller_Assignment1 {
    public Account acc{get;set;}
    public Controller_Assignment1(){
        acc=new Account();
    }
    public void onchnagepicklist(){
        acc.Site=ApexPages.currentPage().getParameters().get('emailId');
        acc.Description=UserInfo.getLastName();
        acc.Phone='jdjdshj';
    }
}