trigger OptionTrigger on Option__c (before update) {
    System.debug('Trigger');
    OptionDispatcher.run(new OptionHandler());
}