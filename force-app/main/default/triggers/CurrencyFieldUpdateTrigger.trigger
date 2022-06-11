/*
* Company : Kvp Business Solution 
* Date    : 03-12-2018
* Author  : Sameer Ranjan
* Description : N/L
* History     : N/L
*/
trigger CurrencyFieldUpdateTrigger on Contact (After insert,After Update,After Delete) {
    if(Trigger.IsInsert || Trigger.IsUpdate){
       CurrencyFieldUpdateTriggerHandler.updateAccount(Trigger.New,Trigger.Old,Trigger.IsUpdate);
    }
    if(Trigger.IsDelete){
        CurrencyFieldUpdateTriggerHandler.updateAccount(Trigger.Old,Trigger.Old,Trigger.IsUpdate);
    }
    
}