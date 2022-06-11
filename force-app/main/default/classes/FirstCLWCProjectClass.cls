public with sharing class FirstCLWCProjectClass {
    public FirstCLWCProjectClass() {

    }
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContactList(){
        return [SELECT Id,Name,FirstName FROM Contact LIMIT 1000];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, Title, Phone, Email FROM Contact WHERE Name LIKE :key LIMIT 10];
    }
}