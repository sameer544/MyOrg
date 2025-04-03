trigger ContactTriggerFW on Contact (after insert, after update, after delete,after undelete) {
    ContactTriggerHalper.run(new ContactTriggerHandler1());
}