trigger RestrictContact on Contact(before insert) {
    RestrictHelperClass.InsertContact(Trigger.new);
}