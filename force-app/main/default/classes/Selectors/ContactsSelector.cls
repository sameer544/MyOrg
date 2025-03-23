public class ContactsSelector extends fflib_SObjectSelector {
    
    public Schema.SObjectType getSObjectType() {
        return Contact.sObjectType;
    }
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Contact.Id,
            Contact.AccountId,
            Contact.FirstName,
            Contact.LastName,
            Contact.Email,
            Contact.Phone
        };
    }
    
    public List<Contact> selectById(Set<Id> contactIds) {
        return (List<Contact>) selectSObjectsById(contactIds);
    }
    
    public Map<Id, Integer> selectContactCountsByAccountId(Set<Id> accountIds) {
        Map<Id, Integer> results = new Map<Id, Integer>();
        
        for(AggregateResult ar : [
            SELECT AccountId, COUNT(Id) contactCount 
            FROM Contact 
            WHERE AccountId IN :accountIds 
            AND IsDeleted = false
            GROUP BY AccountId
        ]) {
            results.put((Id)ar.get('AccountId'), (Integer)ar.get('contactCount'));
        }
        
        return results;
    }
} 