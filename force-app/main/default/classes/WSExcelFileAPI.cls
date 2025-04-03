@RestResource(urlMapping='/ConvertExcelFile/*')
global with sharing class WSExcelFileAPI {
    global static RestRequest request = RestContext.request;
    global static RestResponse response = RestContext.response;

    @HTTPPOST
    global static Void uploadFile(){
        List<requestPattern> restValue = (List<requestPattern>)(JSON.deserializeStrict(request.requestBody.toString(), List<requestPattern>.class));
        System.debug('Size()'+restValue.size());
       /* Map<String,String> reponseMap = new Map<String,String>();
        responseWrapper respWr = new responseWrapper();
        respWr.listAccount = new List<AggregateResult>();
        try {
            WrapperClass requestedField = (WrapperClass)(JSON.deserializeStrict(request.requestBody.toString(), WrapperClass.class));
            System.debug('requestedField.queryFields:'+requestedField.queryFields);
            if(integer.valueof(requestedField.queryFields) == 1){
                respWr.listAccount  = [SELECT count(Id) CountRe FROM Account where Industry ='Banking'];
                respWr.IndustryName = 'Banking';
            }else if(integer.valueof(requestedField.queryFields) == 2){
                respWr.listAccount = [SELECT count(Id) CountRe FROM Account where Industry ='Agriculture'];
                respWr.IndustryName = 'Agriculture';
            }*/
           /* System.debug('requestedField.queryFields'+requestedField.queryFields);
            List<String> requestedfields = requestedField.queryFields.split(',');
            String condiation = 'Where ';
            Integer sizeOfField = requestedfields.size();
            Integer i = 1;
            for(String each : requestedfields ){
                condiation += ' '+each+'<>null ';
                if(i<2)
                condiation += ' and';
                i++;
            }
            System.debug('condiation:'+condiation);
            String query = 'SELECT '+requestedField.queryFields +' FROM Account '+condiation+'  LIMIT 100';
            System.debug('query:'+query);
            List<Account> listAccount = Database.query(query);
            String csvBody = requestedField.queryFields+'\n';
            for(Account each : listAccount){
                csvBody += ''+String.valueof(each.get(requestedfields[0])).remove(',')+','+String.valueof(each.get(requestedfields[1]))+'\n';
            }
           /* ContentVersion cv = new ContentVersion();
            cv.ContentLocation = 'S';
			blob csvBlob = Blob.valueOf(csvBody);
			String s = EncodingUtil.base64Encode(csvBlob);
            cv.VersionData = EncodingUtil.base64Decode(s);
            cv.Title = 'AccountReport.csv';
            cv.PathOnClient = 'AccountReport.csv';
            insert cv;
            ContentDistribution cdl = new ContentDistribution(ContentVersionId = cv.Id, Name = 'PublicShare' );
            //cdl.ContentVersionId = cv.Id;
            //cdl.Name = 'PublicShare';
            insert cdl;
            cdl = [SELECT DistributionPublicUrl FROM ContentDistribution WHERE Id = :cdl.Id LIMIT 1];

            System.debug(cdl.DistributionPublicUrl);
            response.statusCode = 200;
            reponseMap.put('Status','Ok');
            reponseMap.put('RecordUrl',cdl.DistributionPublicUrl);*/
       /*     String responseString = JSON.serialize(respWr);
            System.debug('responseString:'+responseString);
            response.responseBody = Blob.valueOf(responseString);

        }catch (Exception ex){
                response.statusCode = 400;
                reponseMap.put('Status','Error');
                reponseMap.put('ErrorMessage',ex.getMessage());
                String responseString = JSON.serialize(reponseMap);
                System.debug('reponseMap'+reponseMap);
                response.responseBody = Blob.valueOf(responseString);
        }*/
    }
    public class requestPattern{
        String name;
        String value;
    }
    public class WrapperClass{
        String queryFields;
    }
    public class responseWrapper{
        List<AggregateResult> listAccount;
        String IndustryName;
    }
    public class MessageObject{
        List<ButtonsObject> messages;
    }
    public class ButtonsObject{
        List<openUrlActionObject>  buttons;
        String title;
    }
    public class openUrlActionObject{
        Map<String,String> openUrlAction;
    }
}