public inherited sharing class CaseService {
    public static void closeCases(Set<Id> caseIds, String closeResson){
        List<Case> caseRecords = [SELECT Id, Reason FROM Case WHERE Id IN:caseIds];
        for(Case eachCase : caseRecords){
            eachCase.Reason = closeResson;
            eachCase.Status = 'Closed';
        }
        
        update caseRecords;
    }
}