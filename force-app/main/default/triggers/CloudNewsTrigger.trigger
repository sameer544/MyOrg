// Trigger for listening to Cloud_News events.
trigger CloudNewsTrigger on Cloud_News__e (after insert) {    
    // List to hold all cases to be created.
    try{
        
        
        List<Case> cases = new List<Case>();
        System.debug('Recreate');
        // Get queue Id for case owner
        Group queue = [SELECT Id FROM Group WHERE Name='Queue' AND Type='Queue'];
        
        // Iterate through each notification.
        for (Cloud_News__e event : Trigger.New) {
            System.debug('event.Urgent__c'+event.Urgent__c);
            if (event.Urgent__c == true) {
                // Create Case to dispatch new team.
                Case cs = new Case();
                cs.Priority = 'High';
                cs.Subject = 'News team dispatch to ' + 
                    event.Location__c;
                cases.add(cs);
            }
        }
        
        // Insert all cases corresponding to events received.
        insert cases;
        
        System.debug('JSOn'+JSON.serialize(cases));
    }catch(exception ex){
        System.debug(''+ex.getMessage());
    }
    
}