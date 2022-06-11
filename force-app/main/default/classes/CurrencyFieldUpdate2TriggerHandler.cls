/*
 * Company     : Kvp Business Solution
 * Date        : 04-12-2018
 * Author      : Sameer Ranjan
 * Description : N/L
 * History     : N/L
 */
public class CurrencyFieldUpdate2TriggerHandler {
    //This Method Call After Insert
    public static void afterInsertMethod(List<Contact> newConList){
        Set<Id> accountIdSet=new Set<Id>();
        for(Contact con:newConList){
            if(con.AccountId!=NULL)
             accountIdSet.add(con.AccountId);
        }
        Map<Id,String> updateRecords=new Map<Id,String>();
        Map<String,Decimal> countCurrency=new Map<String,Decimal>();
        List<Contact> conList=[SELECT p.Id,p.CurrencyPickList__c,p.AccountID FROM Contact p WHERE p.AccountId in:accountIdSet];
        for(Contact con:conList){
            if(countCurrency.ContainsKey(con.AccountId+con.CurrencyPickList__c)){
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,countCurrency.get(con.AccountId+con.CurrencyPickList__c)+1);
            }
            else{
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,1);
            }
            if(updateRecords.ContainsKey(con.AccountId)){
                integer lastIndex=con.CurrencyPickList__c.length();
                 if(con.CurrencyPickList__c==updateRecords.get(con.AccountId).substring(0,lastIndex)){
                    integer las=updateRecords.get(con.AccountId).length();
                    String Numbervalue=updateRecords.get(con.AccountId).substring(lastIndex,las);
                    Integer val=Integer.valueOf(Numbervalue)+1;
                    System.debug(val);
                    updateRecords.put(con.AccountId,con.CurrencyPickList__c+''+val);
                }
                else{
                    updateRecords.put(con.AccountId,'INR0');
                }
            }
            else{
                updateRecords.put(con.AccountId,con.CurrencyPickList__c+'1');
            }
        }
        List<Account> newList=new List<Account>();
        for(Id acc:accountIdSet){
            if(countCurrency.get(acc+'INR')!=NULL){
            newList.add(new Account(Id=acc,Currency__c=(updateRecords.get(acc).substring(0,3)+countCurrency.get(acc+'INR')),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));    
            Continue;
            }
            newList.add(new Account(Id=acc,Currency__c=updateRecords.get(acc),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));
        }
        Database.update(newList);
    }
    //This Method Call After Update
    public static void afterUpdateMethod(List<Contact> newConList,List<Contact> oldConList){
        Set<Id> accountIdSet=new Set<Id>();
        for(Contact con:newConList){
            if(con.AccountId!=NULL)
             accountIdSet.add(con.AccountId);
        }
        for(Contact con:oldConList){
             if(con.AccountId!=NULL)
             accountIdSet.add(con.AccountId);
        }
        Map<Id,String> updateRecords=new Map<Id,String>();
        Map<String,Decimal> countCurrency=new Map<String,Decimal>();
        List<Contact> conList=[SELECT p.Id,p.CurrencyPickList__c,p.AccountID FROM Contact p WHERE p.AccountId in:accountIdSet];
        for(Contact con:conList){
            if(countCurrency.ContainsKey(con.AccountId+con.CurrencyPickList__c)){
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,countCurrency.get(con.AccountId+con.CurrencyPickList__c)+1);
            }
            else{
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,1);
            }
            if(updateRecords.ContainsKey(con.AccountId)){
                integer lastIndex=con.CurrencyPickList__c.length();
                 if(con.CurrencyPickList__c==updateRecords.get(con.AccountId).substring(0,lastIndex)){
                    integer las=updateRecords.get(con.AccountId).length();
                    String Numbervalue=updateRecords.get(con.AccountId).substring(lastIndex,las);
                    Integer val=Integer.valueOf(Numbervalue)+1;
                    System.debug(val);
                    updateRecords.put(con.AccountId,con.CurrencyPickList__c+''+val);
                }
                else{
                    updateRecords.put(con.AccountId,'INR0');
                }
            }
            else{
                updateRecords.put(con.AccountId,con.CurrencyPickList__c+'1');
            }
        }
        List<Account> newList=new List<Account>();
        for(Id acc:accountIdSet){
            if(countCurrency.get(acc+'INR')!=NULL){
            newList.add(new Account(Id=acc,Currency__c=(updateRecords.get(acc).substring(0,3)+countCurrency.get(acc+'INR')),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));    
            Continue;
            }
            newList.add(new Account(Id=acc,Currency__c=updateRecords.get(acc),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));
        }
        Database.update(newList);  
    }
    //This method Call After Delete
    public static void afterDeleteMethod(List<Contact> oldConList){
	Set<Id> accountIdSet=new Set<Id>();
        for(Contact con:oldConList){
            if(con.AccountId!=NULL)
             accountIdSet.add(con.AccountId);
        }
        Map<Id,String> updateRecords=new Map<Id,String>();
        Map<String,Decimal> countCurrency=new Map<String,Decimal>();
        List<Contact> conList=[SELECT p.Id,p.CurrencyPickList__c,p.AccountID FROM Contact p WHERE p.AccountId in:accountIdSet];
        for(Contact con:conList){
            if(countCurrency.ContainsKey(con.AccountId+con.CurrencyPickList__c)){
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,countCurrency.get(con.AccountId+con.CurrencyPickList__c)+1);
            }
            else{
                countCurrency.put(con.AccountId+con.CurrencyPickList__c,1);
            }
            if(updateRecords.ContainsKey(con.AccountId)){
                integer lastIndex=con.CurrencyPickList__c.length();
                 if(con.CurrencyPickList__c==updateRecords.get(con.AccountId).substring(0,lastIndex)){
                    integer las=updateRecords.get(con.AccountId).length();
                    String Numbervalue=updateRecords.get(con.AccountId).substring(lastIndex,las);
                    Integer val=Integer.valueOf(Numbervalue)+1;
                    System.debug(val);
                    updateRecords.put(con.AccountId,con.CurrencyPickList__c+''+val);
                }
                else{
                    updateRecords.put(con.AccountId,'INR0');
                }
            }
            else{
                updateRecords.put(con.AccountId,con.CurrencyPickList__c+'1');
            }
        }
        List<Account> newList=new List<Account>();
        for(Id acc:accountIdSet){
            if(countCurrency.get(acc+'INR')!=NULL){
            newList.add(new Account(Id=acc,Currency__c=(updateRecords.get(acc).substring(0,3)+countCurrency.get(acc+'INR')),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));    
            Continue;
            }
            newList.add(new Account(Id=acc,Currency__c=updateRecords.get(acc),INR__c=countCurrency.get(acc+'INR'),USD__c=countCurrency.get(acc+'USD'),EURO__c=countCurrency.get(acc+'EURO')));
        }
        Database.update(newList);      
    }
}