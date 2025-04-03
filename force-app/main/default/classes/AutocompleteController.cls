public class AutocompleteController {

    @AuraEnabled
    public static List<String> getSuggestions(String sObjectType, String term, String fieldsToGet, Integer limitSize) {
        // could add in logic to remove possible duplicate fields
        List<String> returnList=new List<String>();
        List<Account> ob=[Select Name from Account];
        for(Account var : ob){
            if(var.name!=null)
            returnList.add(var.Name);
        }
        System.debug('Feature changes101');
        return returnList;
    }
}