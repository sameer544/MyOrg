trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    System.debug('I am account trigger');
    System.debug('Triger.isInsert' + Trigger.isInsert);
    System.debug('Triger.update' + Trigger.isupdate);
}