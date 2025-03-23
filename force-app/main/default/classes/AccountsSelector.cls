public with sharing class AccountsSelector extends fflib_SObjectSelector {
    public AccountsSelector() {
        super(false);
    }
    public AccountsSelector(Boolean includeFieldSetFields) {
        super(includeFieldSetFields);
    }
    public List<Account> selectById(Set<Id> idSet) {
        return (List<Account>) selectSObjectsById(idSet);
    }
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Account.Name,
            Account.Description,
            Account.AnnualRevenue};
    }
    
    public Schema.SObjectType getSObjectType() {
        return Account.sObjectType;
    }
}