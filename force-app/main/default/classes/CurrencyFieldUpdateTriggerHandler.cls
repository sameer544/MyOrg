/*
* Company : Kvp Business Solution 
* Date	  : 03-12-2018
* Author  : Sameer Ranjan
* Description : This Class is help Trigger CurrencyFieldUpdateTrigger.
* History     : N/L
*/
public class CurrencyFieldUpdateTriggerHandler {
    //Update Account Method
    public static void updateAccount(List<Contact> conList,List<Contact> oldConList,Boolean IsUpdate){
        if(!IsUpdate){
            Set<Id> AccountId=new Set<Id>();
            for(Contact con:conList){
                if(con.AccountId!=null)
                AccountId.add(con.AccountId);
            }
        	List<Contact> newList=[Select id,Lastname,CurrencyPickList__c,AccountId from Contact where AccountId in :AccountId];
        	Map<Id,String> mapAccount=new Map<Id,String>();
            Map<String,Decimal> countCurrency=new Map<String,Decimal>();
        	for(Contact con:newList){
                if(countCurrency.ContainsKey(con.AccountId+con.CurrencyPickList__c)){
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,countCurrency.get(con.AccountId+con.CurrencyPickList__c)+1);
                }
                else{
                    countCurrency.put(con.AccountId+con.CurrencyPickList__c,1);
                }
            	if(mapAccount.containskey(con.AccountId)){
                	if(mapAccount.get(con.AccountId)!=con.CurrencyPickList__c){
                 		mapAccount.put(con.AccountId,'INR0');
                	}
            	}
            	else{
                	mapAccount.put(con.AccountId,con.CurrencyPickList__c);
            	}
        	}
        	List<Account> accList=new List<Account>();
        	for(Id acc:AccountId){
                if(countCurrency.get(acc+'INR')!=NULL){
                    accList.add(new Account(Id=acc,Currency__c=(mapAccount.get(acc).substring(0,3)+countCurrency.get(acc+'INR')),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));
                }
                else{
                }
            }
        	if(!accList.isEmpty()){
           		Database.update(accList);
        	}
      	}
        else{
            Set<Id> AccountId=new Set<Id>();
            for(Contact con:conList){
                if(con.AccountId!=null)
                AccountId.add(con.AccountId);
            }
            for(Contact con:oldConList){
               if(con.AccountId!=null)
                AccountId.add(con.AccountId);
            }
        	List<Contact> newList=[Select id,Lastname,CurrencyPickList__c,AccountId from Contact where AccountId in :AccountId];
        	Map<Id,String> mapAccount=new Map<Id,String>();
        	for(Contact con:newList){
            	if(mapAccount.containskey(con.AccountId)){
                	if(mapAccount.get(con.AccountId)!=con.CurrencyPickList__c){
                 		mapAccount.put(con.AccountId,'INR0');
                	}
            	}
            	else{
                	mapAccount.put(con.AccountId,con.CurrencyPickList__c);
            	}
        	}
        	List<Account> accList=new List<Account>();
        	for(Id acc:AccountId){
            	 accList.add(new Account(Id=acc,Currency__c=mapAccount.get(acc))); 
        	}
        	if(!accList.isEmpty()){
           		Database.update(accList);
        	}
        }
    }
}