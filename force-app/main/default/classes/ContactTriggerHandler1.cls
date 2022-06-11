public class ContactTriggerHandler1 {
    
    public void afterInsertMenthod(Map<Id,SObject> newMap){
        Map<Id,Contact> mapNewContact = (Map<Id,Contact>)newMap;
        Map<Id,Integer> parentexustingCountWithAccountId = new Map<Id,Integer>();
        for(Contact each : mapNewContact.values()){
            parentexustingCountWithAccountId.put(each.AccountId,parentexustingCountWithAccountId.containskey(each.AccountId) ? parentexustingCountWithAccountId.get(each.AccountId) + 1 : Integer.valueOf(each.CountCon__c)+1);
        }
        List<Account> listAccounts = new List<Account>();
        for(Id each : parentexustingCountWithAccountId.keyset()){
            listAccounts.add(new Account(Id =each,Available_Contact__c = parentexustingCountWithAccountId.get(each)));
        }
        update listAccounts;
    }
    
    public void afterDeleteMenthod(Map<Id,SObject> oldMap){
        Map<Id,Contact> mapNewContact = (Map<Id,Contact>)oldMap;
        Map<Id,Integer> parentexustingCountWithAccountId = new Map<Id,Integer>();
        for(Contact each : mapNewContact.values()){
            parentexustingCountWithAccountId.put(each.AccountId,parentexustingCountWithAccountId.containskey(each.AccountId) ? parentexustingCountWithAccountId.get(each.AccountId) - 1 : Integer.valueOf(each.CountCon__c)-1);
        }
        List<Account> listAccounts = new List<Account>();
        for(Id each : parentexustingCountWithAccountId.keyset()){
            listAccounts.add(new Account(Id =each,Available_Contact__c = parentexustingCountWithAccountId.get(each)));
        }
        update listAccounts;
    }
    
    public void afterUpdateMetod(Map<Id,SObject> newMap,Map<Id,SObject> oldMap){
        Map<Id,Contact> listNewContact = new Map<Id,Contact>();
        Map<Id,Contact> listOldContact = new Map<Id,Contact>();
        for(Id each : newMap.keySet()){
            if(newMap.get(each).get('AccountId') != oldMap.get(each).get('AccountId')){
                listNewContact.put(each,(contact)newMap.get(each));
                listOldContact.put(each,(contact)oldMap.get(each));
            }
        }
        List<Account> listAccount = new List<Account>();
        listAccount.addAll(updateNewValue(listNewContact));
        listAccount.addAll(updateOldValue(listOldContact));
        update listAccount;
    }
    
    private list<Account> updateNewValue(Map<Id,SObject> newMap){
        Map<Id,Contact> mapNewContact = (Map<Id,Contact>)newMap;
        Map<Id,Integer> parentexustingCountWithAccountId = new Map<Id,Integer>();
        for(Contact each : mapNewContact.values()){
            parentexustingCountWithAccountId.put(each.AccountId,parentexustingCountWithAccountId.containskey(each.AccountId) ? parentexustingCountWithAccountId.get(each.AccountId) + 1 : Integer.valueOf(each.CountCon__c)+1);
        }
        List<Account> listAccounts = new List<Account>();
        for(Id each : parentexustingCountWithAccountId.keyset()){
            listAccounts.add(new Account(Id =each,Available_Contact__c = parentexustingCountWithAccountId.get(each)));
        }
        return listAccounts;
    }
    
    private list<Account> updateOldValue(Map<Id,SObject> oldMap){
        Map<Id,Contact> mapNewContact = (Map<Id,Contact>)oldMap;
        Map<Id,Integer> parentexustingCountWithAccountId = new Map<Id,Integer>();
        for(Contact each : mapNewContact.values()){
            parentexustingCountWithAccountId.put(each.AccountId,parentexustingCountWithAccountId.containskey(each.AccountId) ? parentexustingCountWithAccountId.get(each.AccountId) - 1 : Integer.valueOf(each.CountCon__c)-1);
        }
        List<Account> listAccounts = new List<Account>();
        for(Id each : parentexustingCountWithAccountId.keyset()){
            listAccounts.add(new Account(Id =each,Available_Contact__c = parentexustingCountWithAccountId.get(each)));
        }
        return listAccounts;
    }
}