/********************************************************************************
 * Trigger Name:Copy_Account_Record_Trigger
 * Description: This Trigger Copy Acoount Record Into Custom Object
 * Created Date:02-11-2018
*********************************************************************************/
trigger Copy_Account_Record_Trigger on Account (After insert,After Update,before Update) {
    Account_Duplicate_Help_Class.createDuplicateRecord(Trigger.new);
}