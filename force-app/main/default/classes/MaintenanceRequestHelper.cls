public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders() {
        // TODO: Complete the method to update workorders
        List<Case> listCaseRecords = [SELECT id,
                                      case.Vehicle__c,
                                      Equipment__c,
                                      Equipment__r.Maintenance_Cycle__c,
                                      Type,
                                      Status FROM Case 
                                      WHERE id in: Trigger.NewMap.keySet()];
        List<Case> newMaintenanceRequestList = new List<Case>();
        for(Case eachCase : listCaseRecords){
            if(eachCase.Type=='Routine Maintenance' &&  eachCase.Status=='Closed'){
                case newMaintenanceRequest=new Case();
                newMaintenanceRequest.Subject='test';
                newMaintenanceRequest.Type='Routine Maintenance';
                newMaintenanceRequest.Vehicle__c=eachCase.Vehicle__c;
                newMaintenanceRequest.Equipment__c=eachCase.Equipment__c;
                newMaintenanceRequest.Date_Reported__c=date.Today();
                newMaintenanceRequest.Date_Due__c=Date.today().addDays(Integer.valueOf(eachCase.Equipment__r.Maintenance_Cycle__c));
                newMaintenanceRequest.Status='New';
                newMaintenanceRequest.Origin='Phone';
                newMaintenanceRequestList.add(newMaintenanceRequest);
            }
        }
        insert newMaintenanceRequestList;
    }        
    
}