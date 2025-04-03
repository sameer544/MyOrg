public with sharing class chattingComponentApexController {
    
    @AuraEnabled
    public static string callMethod(String userInput){
        try {
            return userInput;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}