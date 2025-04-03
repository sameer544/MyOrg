public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        if(true)
        throw new AuraHandledException('Forced error');
        return [
            SELECT Id, FirstName, LastName, Email
            FROM Contact
        ];
    }
}