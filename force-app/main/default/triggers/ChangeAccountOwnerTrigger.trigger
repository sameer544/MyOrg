/*
* Company : Kvp Business Solution 
* Date    : 04-12-2018
* Author  : Sameer Ranjan
* Description : N/L
* History     : N/L
*/
trigger ChangeAccountOwnerTrigger on Account (before update) {
  ChangeAccountTriggerHandler.userOwnerDeactivate(Trigger.New,Trigger.OldMap);
}