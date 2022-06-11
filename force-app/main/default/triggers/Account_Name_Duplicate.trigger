trigger Account_Name_Duplicate on Account (before insert) {
    Account_Help1.createAccountRecord(Trigger.New);
}