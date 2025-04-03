public class ContentLinkTriggerHandler {
    public static boolean isDisable = true;
    public static void afterinserMenthod(){
        Map<Id,ContentDocumentLink> mapValue = (Map<Id,ContentDocumentLink>)Trigger.newmap;
        Map<Id,Id> accountIdWithContentDocId = new Map<Id,Id>();
        for(ContentDocumentLink eachlink : mapValue.values()){
            // Validate Object
            if(''+eachlink.LinkedEntityId.getSObjectType() == 'Account' ){
                accountIdWithContentDocId.put(eachlink.LinkedEntityId,eachlink.ContentDocumentId);
            }
        }
        List<ContentDocumentLink> insertRecords = new List<ContentDocumentLink>();
        for(Contact eachCon : [Select Id,AccountId FROM Contact where AccountId IN: accountIdWithContentDocId.keySet()]){
            ContentDocumentLink newRecord = new ContentDocumentLink(
                LinkedEntityId = eachCon.Id,
                ContentDocumentId = accountIdWithContentDocId.get(eachCon.AccountId),
                ShareType = 'I'
            );
            insertRecords.add(newRecord);
        }
        isDisable = false;
        insert insertRecords;
    }
}