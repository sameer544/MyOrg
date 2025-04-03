public class LineItemTriggerHandler {
     //Method Call After Insert A record in "Line_Item__c" Object.
	 public static void insertAfter(List<Line_Item__c> records){
        integer count=Integer.valueOf([Select Count(Id) countRecords from Line_Item__c][0].get('countRecords'));
        List<Marchandise__c> listofMarchd=[Select Id,S_N__c From Marchandise__c order by CreatedDate DESC Limit 3];
         Map<Decimal,Id> mapmarch=New Map<Decimal,Id>();
         for(Marchandise__c var:listofMarchd){
             mapmarch.put(var.S_N__c,var.Id);
         }
         System.debug(mapmarch);
        Set<Id> lineitemId=new Set<Id>();
        for(Line_Item__c var:records){
            lineitemId.add(var.id);
        }
        Map<Id,Integer> mapOfLineItem=new Map<Id,Integer>();
        for(Line_Item__c data:records){
            if(!mapOfLineItem.containsKey(data.Id)){
               if(Math.mod(count,3)==0){
                    mapOfLineItem.put(data.Id,3);
                }
                else{
                    mapOfLineItem.put(data.Id,Math.mod(count,3));
                }
                count++;
            }
        }
        List<Line_Item__c> updateRecords=new List<Line_Item__c>();
         Id marchdId;
         for(Id recordId:lineitemId){
             marchdId=mapmarch.get(mapOfLineItem.get(recordId));
             updateRecords.add(new Line_Item__c(Id=recordId,S_N__c=mapOfLineItem.get(recordId),Marchandise__c=marchdId));
         }
        Database.update(updateRecords);
    }
}