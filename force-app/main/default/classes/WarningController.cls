public class WarningController {
    public String WarningMessage{get;set;}
    public WarningController(){
        HidepageBlock=false;
    }
    public Integer CountRecords{get;set;}
    public List<ApexLog> Listofrecord{get;set;}
    public boolean HidepageBlock{get;set;}
    public Integer getError(){
        integer Result;
        try{ Integer a=23;
        Integer b=0;
         Result=a/b;
            return Result;
        }
        catch(Exception e){
            HidepageBlock=true;
            WarningMessage=string.valueOf(e);
            return Result;
        }
    }
    
    public void SendReport(){
       /* List<Id> objectMail=new List<Id>();
        objectMail.add(userinfo.getUserId());
        Messaging.MassEmailMessage emails=new Messaging.MassEmailMessage(); 
        emails.setTargetObjectIds(objectMail);
        emails.setTemplateId('00X6F000002ocnD');
        emails.setsubject('note');
        //emails.setplainTextBody('body');
        //emails.setToaddress(address);
        Messaging.SendEmail(New Messaging.MassEmailMessage[] {emails});*/
        string address=EmailList__c.getOrgDefaults().Email__c;
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string [] toaddress= New string[]{''+address};
        email.setSubject('Error');
        email.setPlainTextBody(WarningMessage);
        email.setToAddresses(toaddress);
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }
    
    public void Cancel(){
        HidepageBlock=false;
    }
}