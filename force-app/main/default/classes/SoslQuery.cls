public class SoslQuery {
    public void ShowSoslResult(){
        List<List<SObject>>  recordob=[Find 'sameer' IN All FIELDS returning Account(Name),Contact(Name)];
        for(Account var1:(List<Account>)recordob[0]){
            System.debug('Account Name'+var1.Name);
        }
        for(Contact var1:(List<Contact>)recordob[1]){
            System.debug('Contact Name'+var1.Name);
        }
        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String> {'sameerranjan544@gmail.com'});
        email.setSubject('Admin');
        email.setPlainTextBody('Who are U');
        Messaging.sendEmail(new List<messaging.SingleEmailMessage>{email});
        String ob=PickListValues__c.getOrgDefaults().Value1__c;
        System.debug(ob);
    }
}