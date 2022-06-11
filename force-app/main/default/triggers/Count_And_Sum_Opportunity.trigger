trigger Count_And_Sum_Opportunity on Opportunity (After insert,After update,Before delete,After Delete) {
    if(Trigger.IsInsert || Trigger.IsUpdate)
        Help_Opportunity_Tripper_Class.updateAccount(Trigger.New,Trigger.Old);
    if(Trigger.Isdelete && Trigger.IsAfter)
        Help_Opportunity_Tripper_Class.updateAccountwhenDelete(Trigger.Old);
    if(Trigger.IsDelete && Trigger.IsBefore){
        Help_Opportunity_Tripper_Class.updateAccountwhenDeleteBefore(Trigger.Old);
    }
}