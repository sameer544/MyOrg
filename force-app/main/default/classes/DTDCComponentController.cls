public class DTDCComponentController {
    public class WrapperClass{
        @AuraEnabled
        public Decimal CASE_NO;
        @AuraEnabled
        public List<Tracking_Information> Tracking_Information; 
    }
    public class Tracking_Information{
        @AuraEnabled
        public String CN_MANIFEST_NO;
        @AuraEnabled
        public String CN_ORGIN;
        @AuraEnabled
        public String CN_DEST;
        @AuraEnabled
        public String CN_ACTION;
        @AuraEnabled
        public String CN_ACTION_DATE;
        @AuraEnabled
        public String CN_ACTION_TIME;
        @AuraEnabled
        public String DateTimeValue;
    }
    @AuraEnabled
    public static List<WrapperClass> getJSONResult(){
        String endPointURL='http://sfdapi.dtdc.com/salesforce/MULTICONSGDETAILS';
        String setBody='{"Consignment_List":[{"Consignment_No":"B59703578"}]}';
        HttpRequest dtdcRecordRequest = new HttpRequest();
        dtdcRecordRequest.setEndpoint(endPointURL);
        dtdcRecordRequest.setBody(setBody);
        dtdcRecordRequest.setMethod('POST');
        Http http = new Http();
        HTTPResponse dtdcRecordResponse = http.send(dtdcRecordRequest);
        //Json.deserializeUntyped(feedResponse.getBody());
        System.debug(dtdcRecordResponse.getBody());
        List<WrapperClass> mapObject=(List<WrapperClass>)Json.deserialize(dtdcRecordResponse.getBody(),List<WrapperClass>.class);
        System.debug(mapObject);
        String datevalue;
        String TimeValue;
        for(Tracking_Information varTInfo:mapObject[0].Tracking_Information){
            datevalue=varTInfo.CN_ACTION_DATE;
            datevalue=datevalue.substring(0, datevalue.length()-11);
            TimeValue=varTInfo.CN_ACTION_TIME;
            TimeValue=TimeValue.substring(0, 2)+':'+TimeValue.substring(2, TimeValue.length());
            varTInfo.DateTimeValue=datevalue+TimeValue;
        }
        return mapObject;
    }
    
}