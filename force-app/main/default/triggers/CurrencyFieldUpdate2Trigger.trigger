/*
 * Company     : Kvp Business Solution 
 * Date        : 04-12-2018
 * Author      : Sameer Ranjan
 * Description : N/L
 * History     : N/L
 */
trigger CurrencyFieldUpdate2Trigger on Contact (After insert,After Update,After delete) {
    //After insert call a static Method afterInsertMethod
    if(Trigger.IsInsert && Trigger.IsAfter)
     CurrencyFieldUpdate2TriggerHandler.afterInsertMethod(Trigger.New);
    //After Update call a static Method afterUpdateMethod
    if(Trigger.IsUpdate && Trigger.IsAfter)
     CurrencyFieldUpdate2TriggerHandler.afterUpdateMethod(Trigger.New,Trigger.Old);
    //After delete call a static Method afterUpdateMethod
    if(Trigger.IsDelete && Trigger.IsAfter)
     CurrencyFieldUpdate2TriggerHandler.afterDeleteMethod(Trigger.Old);
}