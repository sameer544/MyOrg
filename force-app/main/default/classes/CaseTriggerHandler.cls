public class CaseTriggerHandler {
    public class WrapperClass{
        public String CASE_NO;
        public String CONSG_NUMBER;
        public String CN_REF_NUMBER;
        public String CN_TYPE;
        public String CN_TYPE_CODE;
        public String CN_TYPE_NAME;
        public String CN_PROD_TYPE;
        public String CN_MODECODE;
        public String CN_MODE;
        public String CN_PROD_COD_FOD;
        public String CN_ORIGIN_AT;
        public String CN_ORGIN_REMARKS;
        public String CN_BOOKING_DATE;
        public String CN_BOOKING_TIME;
        public String ConsignmentNumber;
    }
    public static void beforeInsertMethod(List<Case__c> caseList, Map<Id, Case__c> mapCase){
        Set<Id> setCaseIds=new Set<Id>();
        for(Case__c varId:caseList){
            setCaseIds.add(varId.Id);
        }
        updateRecords(mapCase.keySet());
    }
    @future(callout=true)
    public static void updateRecords(Set<Id> setCaseIds){
        List<Case__c> caseList=[Select Id,Name From Case__c where Id in :setCaseIds]; 
        Map<String,List<WrapperClass>> mapUpdateRecords=new Map<String,List<WrapperClass>>();
        string subsetBody='';
        for(Case__c varCase:caseList){
            subsetBody+='{"Consignment_No":"'+varCase.Name+'"},';
            String endPointURL='http://sfdapi.dtdc.com/salesforce/MULTICONSGDETAILS';
            String setBody='{"Consignment_List":[{"Consignment_No":"'+varCase.Name+'"}]}';
            HttpRequest dtdcRecordRequest = new HttpRequest();
            dtdcRecordRequest.setEndpoint(endPointURL);
            dtdcRecordRequest.setBody(setBody);
            dtdcRecordRequest.setMethod('POST');
            Http http = new Http();
            HTTPResponse dtdcRecordResponse = http.send(dtdcRecordRequest);
            List<WrapperClass> mapObject=(List<WrapperClass>)Json.deserialize(dtdcRecordResponse.getBody(),List<WrapperClass>.class);           
            mapObject[0].ConsignmentNumber=varCase.Name;
            if(!mapUpdateRecords.containsKey(varCase.Id)){
				mapUpdateRecords.put(varCase.Id,mapObject);
            }
        }
        List<Case__c> updateRecords=new List<Case__c>();
        for(Id varId:setCaseIds){
            updateRecords.add(new Case__c(Id=varId,Name=mapUpdateRecords.get(varId)[0].ConsignmentNumber,Mode__c=mapUpdateRecords.get(varId)[0].CN_MODE));
        }
        update updateRecords;
    }
}