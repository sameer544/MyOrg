public class ContactsDomain extends fflib_SObjectDomain {
    
    public ContactsDomain(List<Contact> records) {
        super(records);
    }
    
    public override void onAfterInsert() {
        updateAccountContactCount(Records);
    }
    
    public override void onAfterUpdate(Map<Id, SObject> existingRecords) {
        List<Contact> contactsWithChangedAccount = new List<Contact>();
        for(Contact newContact : (List<Contact>)Records) {
            Contact oldContact = (Contact)existingRecords.get(newContact.Id);
            if(newContact.AccountId != oldContact.AccountId) {
                contactsWithChangedAccount.add(newContact);
            }
        }
        if(!contactsWithChangedAccount.isEmpty()) {
            updateAccountContactCount(contactsWithChangedAccount);
        }
    }
    
    public override void onAfterDelete() {
        updateAccountContactCount(Records);
    }
    
    public override void onAfterUndelete() {
        updateAccountContactCount(Records);
    }
    
    private void updateAccountContactCount(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : contacts) {
            if(con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
            // For updates and deletes, also include old AccountId
            if(Trigger.isUpdate || Trigger.isDelete) {
                Contact oldContact = (Contact)Trigger.oldMap.get(con.Id);
                if(oldContact.AccountId != null) {
                    accountIds.add(oldContact.AccountId);
                }
            }
        }
        
        if(!accountIds.isEmpty()) {
            // Query for accounts and their contacts
            Map<Id, AggregateResult> contactCounts = new Map<Id, AggregateResult>();
            for(AggregateResult ar : [
                SELECT AccountId, COUNT(Id) contactCount 
                FROM Contact 
                WHERE AccountId IN :accountIds 
                AND IsDeleted = false
                GROUP BY AccountId
            ]) {
                contactCounts.put((Id)ar.get('AccountId'), ar);
            }
            
            // Update account contact counts
            List<Account> accountsToUpdate = new List<Account>();
            for(Id accountId : accountIds) {
                AggregateResult ar = contactCounts.get(accountId);
                accountsToUpdate.add(new Account(
                    Id = accountId,
                    Contact_Count__c = ar != null ? (Integer)ar.get('contactCount') : 0
                ));
            }
            
            if(!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> records) {
            return new ContactsDomain(records);
        }
    }
} 