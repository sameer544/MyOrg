trigger NewTrigger on Contact (after insert,after Update,after delete) {
    if(Trigger.isAfter && Trigger.isInsert){
        List<Account> listAccounts = new List<Account>();
        for(Contact con : trigger.new){
            listAccounts.add(new Account(Id = con.AccountId, Name = 'test101'));
        }
        update listAccounts;
    }
}