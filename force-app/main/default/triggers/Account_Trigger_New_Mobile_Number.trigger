trigger Account_Trigger_New_Mobile_Number on Account (After update) {
    Help_Account_New_Mobile_Number.NewMobileNumber(Trigger.Newmap);
}