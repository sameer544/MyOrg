public class schulerApex implements System.Schedulable {
    Account value;
    public schulerApex(Account record){
        value=record;
    }
    public void execute(System.SchedulableContext sc){
        AccountEmailUpdate ob=new AccountEmailUpdate(value);
        Database.executeBatch(ob);
    }
}