global with sharing class AccountRemoter {

    public String accountName { get; set; }
    public static List<Account> accountList { get; set; }
    public AccountRemoter() { } // empty constructor
    
    @RemoteAction
    global static List<Account> getAccount(String accountName) {
        accountList = [SELECT Id, Name,Industry, Phone, Type, NumberOfEmployees FROM Account];
        system.debug(accountName);
        return accountList;
    }
}