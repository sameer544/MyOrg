trigger AccountChangeEventTrigger on AccountChangeEvent (after insert) {
    System.debug('AccountChangeEventTrigger after');
}