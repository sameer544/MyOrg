@RestResource(urlMapping='/case/*/close')
global class CaseCloseResource {

    @HttpPost
    global static void closeCase (String closeReason){
        CaseService.closeCases(new Set<Id> {RestContext.request.requestURI.split('/')[2]},closeReason);
    }
}