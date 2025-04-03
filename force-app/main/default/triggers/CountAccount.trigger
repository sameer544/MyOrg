trigger CountAccount on Account (before insert) {
    for(Account acc:Trigger.New){
        Helping_Class.InserAccount(acc);
    }
}