public class AddPrimaryContact implements Queueable {
    
    public Contact conInfo;
    public String state;
    public AddPrimaryContact(Contact conInfo,String state){
        this.conInfo = conInfo;
        this.state = state;
    }
    public void execute(QueueableContext context){
        List<Account> listAccountRecords = [SELECT Id,
                                            	   BillingState 
                                            FROM Account WHERE BillingState =:state LIMIT 200];
        List<Contact> listContacts = new List<Contact>();
        for(Account each : listAccountRecords){
            conInfo.AccountId = each.Id;
            listContacts.add(conInfo.clone());
        }
        insert listContacts;
    }
}