trigger Duplicate_COntact_Phone_Number on Contact (before insert,before update) {
    for(Contact con:Trigger.New)
    Duplicate_Contact_Number.ValidateContactNumber(con);
    
}