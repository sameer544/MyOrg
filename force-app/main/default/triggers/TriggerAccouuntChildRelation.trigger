trigger TriggerAccouuntChildRelation on Account (after update)  {
        HelpingClass_AccouuntChildRelation.insertContact(Trigger.new);
 }