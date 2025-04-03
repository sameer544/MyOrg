trigger ContactAnnualRevenueDivide on Contact (after insert)  {
HelpingClassAnnualRevenueDivide.InsertContact(Trigger.new);
 }