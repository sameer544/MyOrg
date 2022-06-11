@IsTest
public class AccountProcessorTest {
    public static testMethod void method1(){
        Test.startTest();
        Account accountRecord1 = new Account(name = 'test');
        insert accountRecord1;
        contact conRecord1 = new contact(lastName = 'testCon');
        conRecord1.AccountId = accountRecord1.Id;
        insert conRecord1;
        
        AccountProcessor.countContacts(new List<Id>{accountRecord1.Id});
        test.stopTest();
    }
}