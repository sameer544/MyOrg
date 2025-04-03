public class ContactSearchComponentController {
	@AuraEnabled
    public static List<Contact> onloadMethod(){
        return [Select Name,FirstName,LastName  From Contact];
    }
    @AuraEnabled
    public static List<Contact> filterCondition(String Name){
        return [Select Name,FirstName,LastName From Contact where Name like :'%'+Name+'%'];
    }
}