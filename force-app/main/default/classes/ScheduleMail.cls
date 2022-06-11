public class ScheduleMail implements Schedulable {
  String EmailId;
  public ScheduleMail(String EmailId) {
    this.EmailId = EmailId;
  }
  public void execute(SchedulableContext sc) {
    sendmail(EmailId);
  }
  public void sendmail(String EmailId) {
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    string[] toaddress = new List<string>{ EmailId };
    email.setSubject('Testing Apex Scheduler-Subject');
    email.setPlainTextBody('Testing Apex Scheduler-Body');
    email.setToAddresses(toaddress);
    Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
  }
}