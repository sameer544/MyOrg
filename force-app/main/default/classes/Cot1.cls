public class Cot1 {
    public string QueryString{get;private set;}
    //public string temp=QueryString;
    string Id;
    public Cot1(){
        QueryString=ApexPages.currentPage().getParameters().get('id');
        
    }
    public void doReturnContactInfo(){
        System.debug('Hello');
    }
}