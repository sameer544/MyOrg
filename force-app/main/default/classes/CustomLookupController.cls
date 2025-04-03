public with sharing class CustomLookupController {
    public CustomLookupController() {

    }
    @AuraEnabled(cacheable = true)
    public static List<SObject> findRecords(String searchKey,String searchfield,String objectName){
        String query = 'SELECT Name FROM '+objectName+' where Name like \'%'+searchKey+'%\'';
        System.debug('query'+query);
        return Database.query(query);
    }
}