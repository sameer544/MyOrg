public class ContactTriggerHandler {
    public static void updateAccountContactCount(List<Contact> newContacts, List<Contact> oldContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        // Collect account IDs from new and old contacts
        if (newContacts != null) {
            for (Contact con : newContacts) {
                if (con.AccountId != null) {
                    accountIds.add(con.AccountId);
                }
            }
        }
        
        if (oldContacts != null) {
            for (Contact con : oldContacts) {
                if (con.AccountId != null) {
                    accountIds.add(con.AccountId);
                }
            }
        }
        
        // If no accounts to process, exit
        if (accountIds.isEmpty()) {
            return;
        }
        
        // Query to get the count of contacts for each account
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        for (AggregateResult ar : [
            SELECT AccountId, COUNT(Id) contactCount 
            FROM Contact 
            WHERE AccountId IN :accountIds 
            GROUP BY AccountId
        ]) {
            Id accountId = (Id)ar.get('AccountId');
            Integer contactCount = (Integer)ar.get('contactCount');
            
            accountsToUpdate.put(accountId, new Account(
                Id = accountId,
                Contact_Count__c = contactCount
            ));
        }
        
        // Update accounts with zero contacts that weren't returned in the aggregate query
        for (Id accId : accountIds) {
            if (!accountsToUpdate.containsKey(accId)) {
                accountsToUpdate.put(accId, new Account(
                    Id = accId,
                    Contact_Count__c = 0
                ));
            }
        }
        
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate.values();
        }
    }
} 