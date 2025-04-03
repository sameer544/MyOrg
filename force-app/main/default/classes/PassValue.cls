public class PassValue {
    public WrapprClass wclass{get;set;}
    public List<Account> AllRecords{
        get{return [Select Id,Name,Industry,Rating From Account];}
    }
}