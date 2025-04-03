public class DailyLeadProcessor implements Schedulable {
	public void execute(SchedulableContext ctx) {
        List<Lead> findBlankLeadRecords = [SELECT Id,
                                          		  LeadSource
                                           FROM LEAD 
                                           WHERE LeadSource = null];
        for(Lead each : findBlankLeadRecords){
            each.LeadSource = 'Dreamforce';
        }
        update findBlankLeadRecords;
    }
}