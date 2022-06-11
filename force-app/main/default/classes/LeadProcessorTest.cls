@IsTest
public class LeadProcessorTest {
    static testMethod void method1(){
        test.startTest();
        List<Lead> listLead = new List<Lead>();
        for(Integer i = 0 ; i < 200 ; i++ ){
            listLead.add(new Lead(LastName = 'Sameer', company = 'Test'+i ));
        }
        insert listLead;
        Database.executeBatch(new LeadProcessor());
        test.stopTest();
    }
}