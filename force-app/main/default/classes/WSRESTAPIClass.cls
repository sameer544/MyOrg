@RestResource(urlMapping='/CallRestClass/*')
global with sharing class WSRESTAPIClass {
    @HttpPost
    global static void doPostMethod(){
        System.debug('Post Methid');
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug('request:'+ request);
        System.debug('response:'+ response);
        System.debug('request.requestBody: '+request.requestBody);
        System.debug('String: '+ request.requestBody.toString());
        response.statusCode = 400;
        response.responseBody = Blob.valueOf(request.requestBody.toString());
    }
    
    @HttpGet
    global static void doGetMethod(){
        System.debug('HttpGet Methid');
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug('request:'+ request);
        System.debug('response:'+ response);
        System.debug('request.requestBody: '+request.requestBody);
        System.debug('String: '+ request.requestBody.toString());
    }
    
    @HttpPut
    global static void doPutMethod(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug('request:'+ request);
        System.debug('response:'+ response);
        System.debug('request.requestBody: '+request.requestBody);
        System.debug('String: '+ request.requestBody.toString());
    }
    
    @HttpPatch
    global static void doPatchMethod(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug('request:'+ request);
        System.debug('response:'+ response);
        System.debug('request.requestBody: '+request.requestBody);
        System.debug('String: '+ request.requestBody.toString());
    }
    
    @HttpDelete
    global static void doDeleteMethod(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        System.debug('HttpDelete');
        System.debug('request:'+ request);
        System.debug('response:'+ response);
        System.debug('request.requestBody: '+request.requestBody);
        System.debug('String: '+ request.requestBody.toString());
    }
}