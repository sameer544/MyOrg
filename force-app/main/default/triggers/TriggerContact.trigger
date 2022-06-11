trigger TriggerContact on Contact (before insert) {
    Trigger_HeplerClass.createContact(Trigger.new);
}