public class Helping_Class {
    public static void InserAccount(Account acc){
        Integer maxvalue=integer.valueOf([Select Max(Count__C) maxvalue from Account where Calendar_Year(CreatedDate)=:Date.today().year()][0].get('maxvalue'));
        if(maxvalue==null)
            acc.Count__C=1;
        else
            acc.Count__c=maxvalue+1;
    }
}