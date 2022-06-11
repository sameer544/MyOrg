trigger ChangeOwnerOfAccount on User (after update) {
   HelpClassChangeOwner.updateRecord(Trigger.New);
}