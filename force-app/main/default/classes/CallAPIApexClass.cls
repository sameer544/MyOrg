public class CallAPIApexClass{
	public static void callAPI(){
		Http apiCall = new Http();
		HttpRequest reApiCall = new HttpRequest();
		reApiCall.setEndpoint('callout:self_Auth_JWT//services/data/v52.0/query/?q=SELECT+name+from+Account');
		reApiCall.setMethod('GET');
		HTTPResponse res = apiCall.send(reApiCall);
		System.debug(res.getBody());
	}
}