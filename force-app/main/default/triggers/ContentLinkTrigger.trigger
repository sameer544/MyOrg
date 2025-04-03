trigger ContentLinkTrigger on ContentDocumentLink (after insert) {
	if(Trigger.isInsert && Trigger.isafter && ContentLinkTriggerHandler.isDisable){
        ContentLinkTriggerHandler.afterinserMenthod();
    }
}