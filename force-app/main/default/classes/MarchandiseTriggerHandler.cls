public class MarchandiseTriggerHandler {
	//After Record Insert
   public static void insertAfter(List<Marchandise__c> records){
        integer count=Integer.valueOf([Select Count(Id) countRecords from Marchandise__c][0].get('countRecords')); 
        Set<Id> lineitemId=new Set<Id>();
        for(Marchandise__c var:records){
            lineitemId.add(var.id);
        }
        Map<Id,Integer> mapOfLineItem=new Map<Id,Integer>();
        for(Marchandise__c data:records){
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
        List<Marchandise__c> updateRecords=new List<Marchandise__c>();
        Id marchdId;
        for(Id recordId:lineitemId){
            updateRecords.add(new Marchandise__c(Id=recordId,S_N__c=mapOfLineItem.get(recordId)));
        }
        Database.update(updateRecords);
    }
    //After Delete Record
    public static void deleteAfter(){
        List<Marchandise__c> remainingRecords=[Select Id,Name,S_N__c From Marchandise__c order by createdDate];
        List<Marchandise__c> updateRecords=new List<Marchandise__c>();
        system.debug(remainingRecords.size());
        Integer i=1;
        for(Marchandise__c var:remainingRecords){
            if(Math.mod(i, 3)==0){
                 updateRecords.add(new Marchandise__c(Id=var.Id,S_N__c=3));
            }
            else{
                updateRecords.add(new Marchandise__c(Id=var.Id,S_N__c=Math.mod(i, 3)));
            }
            i++;
        }
        Database.update(updateRecords);
    }
}