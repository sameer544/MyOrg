/*
 * Company : Kvp Business Solution 
 * Date    : 10-12-2018
 * Author  : Sameer Ranjan
 * Description : 
 * History     : N/L
 */
trigger AccountTrigger on Account (After Insert) {
  /*if(Trigger.isAfter && Trigger.IsInsert){
    AccountTriggerHandler.AfterInsertAccountRecord(Trigger.New);
  }*/
    List<Contact> inssertedContactList = new List<Contact>();
    Contact InnerCon;
    for(Account each : Trigger.New){
        InnerCon = new Contact();
        InnerCon.AccountId = each.Id;
        InnerCon.LastName = 'Test';
        inssertedContactList.add(InnerCon);
    }
    insert inssertedContactList;
}