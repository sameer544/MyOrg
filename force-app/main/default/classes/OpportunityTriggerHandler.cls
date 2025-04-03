public class OpportunityTriggerHandler {
    public static void aafterUpdate(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        for(Opportunity each : newList){
            if(each.StageName == 'Closed Won' && oldMap.get(each.Id).StageName != 'Closed Won'){
                callAPI(JSON.serialize(each));
            }
        }
    }

    @future(callout = true)
    public static void callAPI(String opp){
        
        Opportunity record = (Opportunity) JSON.deserialize(opp, Opportunity.class);
        record = [SELECT ID, Name, Account.Name, CloseDate, Amount
                                                   FROM Opportunity
                                                   WHERE Id =:record.Id];
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:ProjectService/');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('token', ServiceTokens__c.getInstance('ProjectServiceToken').Token__c);
        String setBody='{"opportunityId": "'+ record.Id +'", "opportunityName" : "'+record.Name+'","accountName" : "'+record.Account.Name+'","closeDate" : "'+record.CloseDate+'","amount" : "'+record.Amount+'"}';
        request.setBody(setBody);
        HttpResponse response = http.send(request);
        System.debug('response++'+response.getBody());
        if(response.getStatusCode() == 201 && response.getStatus() == 'OK'){
            record.StageName = 'Submitted Project';
        }
        else if(response.getStatusCode() == 500){
            record.StageName = 'Resubmit Project';
        }
        
        update record;  
    }
}