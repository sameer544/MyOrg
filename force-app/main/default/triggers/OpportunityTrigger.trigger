trigger OpportunityTrigger on Opportunity (After update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accountIds = new Set<Id>();
        Map<Id,Decimal> accountWithSunAmount = new Map<Id,Decimal>();
        for(Opportunity eachOpp : Trigger.new){
            if(eachOpp.AccountId == Trigger.oldMap.get(eachOpp.Id).AccountId && eachOpp.status == 'Closed-Won' && Trigger.oldMap.get(eachOpp.Id).status != 'Closed-Won' && eachOpp.Amount != null){
                accountIds.add(eachOpp.AccountId);
                if(accountWithSunAmount.containsKey(eachOpp.AccountId)){
                    accountWithSunAmount.put(eachOpp.AccountId,accountWithSunAmount.get(achOpp.AccountId)+eachOpp.Amount);
                } else {
                    accountWithSunAmount.put(eachOpp.AccountId,eachOpp.Amount);
                }
            }
            if(eachOpp.AccountId != Trigger.oldMap.get(eachOpp.Id).AccountId && ){

            }
        }
        List<Account> getListAccounts = [Select id,Amount from account where Id IN:accountIds for update];
        for(Account each : getListAccounts){
            each.amount += accountWithSunAmount.get(each.Id);
        }
        if(!getListAccounts.isEmpty()){
            update getListAccounts;
        }
    }
}