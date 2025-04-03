@isTest
public class DailyLeadProcessorTest {
	@testSetup 
    static void setup() {
        List<Lead> testLeads = new List<Lead>();
        testLeads.add( new Lead(
            LastName = 'TestLead',
            Company = 'TestCompanyName'
        ));
        insert testLeads;
    }
    
    static testmethod void testQueueable() {
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
            '0 0 0 15 3 ? 2022', 
            new DailyLeadProcessor());   
        Test.stopTest();
    }
}