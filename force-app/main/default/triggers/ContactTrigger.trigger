trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    fflib_SObjectDomain.triggerHandler(ContactsDomain.class);
}