@isTest
public class AddPrimaryContactTest {
	@testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                BillingState = 'TestState'
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact( new Contact(LastName = 'Test') , 'TestState' ) );
        Test.stopTest();
    }
}