trigger ContactTrigger on Contact (after insert,After Delete,After Update) {
    System.debug('Con Trigger');
    
   
    
    if(Trigger.Isupdate || Trigger.IsInsert){
         Map<Id,Integer> mapIn = new Map<Id,Integer>();
        for(Contact each : Trigger.new){
            if(mapIn.containsKey(each.AccountId) ){
                mapIn.put(each.AccountId,mapIn.get(each.AccountId) + 1 );
            } else {
                mapIn.put(each.AccountId,1 );
            }
        }
        if(Trigger.Isupdate){
            for(Contact each : Trigger.old ){
                if(mapIn.containsKey(each.AccountId) ){
                    mapIn.put(each.AccountId,mapIn.get(each.AccountId)-1);
                } else {
                    mapIn.put(each.AccountId,0);
                }
            }
        }
        
        List<Account> liAccount = [Select Id, Count__c FROM Account where Id in:mapIn.keySet() ];
        system.debug('liAccount'+liAccount);
        for(Account each :liAccount){
            each.Count__c = (each.Count__c == null? 0 : each.Count__c) + Decimal.valueOf(''+mapIn.get(each.Id));
            System.debug('each.Count__c'+each.Count__c);
        }
        
        if(Trigger.Isinsert){
            update liAccount;
        }
        
        if(Trigger.Isupdate){
            update liAccount;
        }
    }
    
    if(Trigger.isDelete){
        Map<Id,Integer> delemap = new Map<Id,Integer>();
        for(Contact each : Trigger.old ){
            if(delemap.containsKey(each.AccountId) ){
                delemap.put(each.AccountId,delemap.get(each.AccountId) + 1);
            } else {
                delemap.put(each.AccountId, 1);
            }
        }
        List<Account> liExAccount = [Select Id, Count__c FROM Account where Id in:delemap.keySet() ];
        for(Account each : liExAccount){
            each.Count__c = each.Count__c -delemap.get(each.Id);
        }
        update liExAccount;
    }
    
    
}