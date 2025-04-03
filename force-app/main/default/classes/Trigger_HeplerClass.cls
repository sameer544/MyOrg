/***********************************************************************
 * Class Name: Trigger_HeplerClass
 * Description:This Class Method use in Trigger class 
************************************************************************/
public class Trigger_HeplerClass {
    public static void cheakAccountBillingAddressAndShippingAddress(List<Account> accList){
        List<Account> AccountList=new List<Account>();
        for(Account acc:accList){
            if(acc.AutoMatch__c==true){
                if(acc.BillingCountry!=acc.ShippingCountry){
                    acc.adderror('error');
                }
            }
        }
    }
    public static void createAccount(List<Account> accList){
        for(Account acc:accList){
            acc.Description=acc.Name+system.today();
        }
    }
    public static void createContact(List<Contact> conNewRecord){
       List<Contact> con=new List<Contact>();
        for(Contact var :conNewRecord){
            for(Contact var2:[Select Id,Name,AccountId,IsPrimary__c FROM Contact]){
                if(var.AccountId==var2.AccountId){
                    if(var2.IsPrimary__c==true)
                        var.adderror('error');
                }
            }
        } 
    }
    public static void insertContact(list<Contact> recordNew,list<Contact> recordOld){
        List<Contact> conList=[select Id,AccountId,Account.Sum_Of_Annual_Revenue__c,Annual_Revenue_Pay__c FROM Contact where AccountId!=null];
        decimal data=0;
        for(Contact con:conList){
            if(con.AccountId==recordNew[0].Accountid){
                data=con.Account.Sum_Of_Annual_Revenue__c;
            }
        }
        if(data==null)
            data=0;
        Account acc=new Account();
        acc.Id=recordNew[0].Accountid;
        acc.Sum_Of_Annual_Revenue__c=data+recordNew[0].Annual_Revenue_Pay__c;
        update acc;
    }
    public static void updateContact(List<Contact> recordnew,List<Contact> recordold){
       List<Contact> conList=[select Id,AccountId,Account.Sum_Of_Annual_Revenue__c,Annual_Revenue_Pay__c FROM Contact where AccountId!=null];
       decimal sum=0;
        if(recordnew[0].accountId==recordold[0].AccountId){
        for(Contact con:conList){
          if(recordold[0].AccountId==con.AccountId){
                sum=sum+con.Annual_Revenue_Pay__c;
            }
        }
        Account acc=new Account();
        acc.Id=recordold[0].Accountid;
        acc.Sum_Of_Annual_Revenue__c=sum;
        update acc;
        }
        else{
        for(Contact con:conList){
          if(recordnew[0].AccountId==con.AccountId){
                sum=sum+con.Annual_Revenue_Pay__c;
            }
        }
        List<Account> acclist=new List<Account>();
        Account acc=new Account();
        acc.Id=recordnew[0].Accountid;
        acc.Sum_Of_Annual_Revenue__c=sum;
        acclist.add(acc);
        sum=0;
        for(Contact con:conList){
          if(recordold[0].AccountId==con.AccountId){
                sum=sum+con.Annual_Revenue_Pay__c;
            }
        }
        Account acc1=new Account();
        acc1.Id=recordold[0].Accountid;
        acc1.Sum_Of_Annual_Revenue__c=sum;
        acclist.add(acc1);    
        update acclist;
        }
    }
    public static void deleteContact(List<Contact> recordNew){
         List<Contact> conList=[select Id,AccountId,Account.Sum_Of_Annual_Revenue__c,Annual_Revenue_Pay__c FROM Contact where AccountId!=null];
         System.debug(recordNew[0].Name);
        decimal sum=0;
        for(Contact con:conList){
            
            if(recordNew[0].AccountId==con.AccountId){
                sum=sum+con.Annual_Revenue_Pay__c;
            }
        }
        Account acc=new Account();
        acc.Id=recordNew[0].Accountid;
        acc.Sum_Of_Annual_Revenue__c=sum;
        update acc;
    }
}