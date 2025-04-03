public class Help_Account_New_Mobile_Number {
    public static void NewMobileNumber(map<Id,Account> OldRecord){
        System.debug(OldRecord.values().Phone);
        List<Contact> conList=[Select Id,Phone,AccountId,Account.Phone from Contact where AccountID in:OldRecord.keyset() and Phone!=:OldRecord.values().Phone];
        System.debug(conList.size());
        for(Contact con:conList){
            con.Phone=con.account.phone;
        }
        update conList;
    }
}