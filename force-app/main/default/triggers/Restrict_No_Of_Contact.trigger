trigger Restrict_No_Of_Contact on Contact (before insert) {
    Restrict_Helping_Class.InsertContact(Trigger.New);
}