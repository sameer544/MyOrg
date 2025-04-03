public class Query_Controller {
    public Contact con{get;set;}
   // String Id;
   //Contact con=new Contact();
    public Query_Controller(ApexPages.StandardController setAcc){
        con=new Contact();
        con=(Contact)setAcc.getRecord();
    }
}