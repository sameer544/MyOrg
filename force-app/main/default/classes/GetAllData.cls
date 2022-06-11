public class GetAllData {
    public class WrapperClass{
        public Decimal CASE_NO;
    }
    public static void getRecords(){
        String response;
        String endPointURL='http://sfdapi.dtdc.com/salesforce/MULTICONSGDETAILS';
        String setBody='{"Consignment_List":[{"Consignment_No":"B59703578"}]}';
        HttpRequest feedRequest = new HttpRequest();
        feedRequest.setEndpoint(endPointURL);
        feedRequest.setBody(setBody);
        feedRequest.setMethod('POST');
        Http http = new Http();
        HTTPResponse feedResponse = http.send(feedRequest);
        //Json.deserializeUntyped(feedResponse.getBody());
        List<WrapperClass> mapObject=(List<WrapperClass>)Json.deserialize(feedResponse.getBody(),List<WrapperClass>.class);
        for(WrapperClass varRecord:mapObject){
            System.debug(varRecord.CASE_NO);
        }
    }
}