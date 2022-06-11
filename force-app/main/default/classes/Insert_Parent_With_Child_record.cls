public class Insert_Parent_With_Child_record {
    public List<AccountWithContact> ListofWrapperClass{get;set;}
    public Insert_Parent_With_Child_record(){
        ListofWrapperClass=new List<AccountWithContact>();
    }
   
    public void addAccount(){
        AccountWithContact addaccount=new AccountWithContact();
        addaccount.acc=new account();
        addaccount.conList=new List<Contact>();
        ListofWrapperClass.add(addaccount);
    }
    public void CancelProcess(){
        ListofWrapperClass.clear();
    }
    public void removeaccount(){
        integer indexofaccount=integer.valueof(ApexPages.currentPage().getParameters().get('indexof'));
        ListofWrapperClass.remove(indexofaccount-1);
    }
    public void addContact(){
         integer indexofaccount=integer.valueof(ApexPages.currentPage().getParameters().get('indexof'));
         contact con=new contact();
        System.debug(ListofWrapperClass[indexofaccount-1].acc.Name);
        //con.lastName='0';
        //con.Account.Name=ListofWrapperClass[indexofaccount-1].acc.Name;
        //System.debug(con);
         ListofWrapperClass[indexofaccount-1].conList.add(con);
    }
    public void removecontact(){
        integer indexofconatct=integer.valueof(ApexPages.currentPage().getParameters().get('indexofcontact'));
        integer indexofaccount=integer.valueof(ApexPages.currentPage().getParameters().get('indexof'));
        system.debug(indexofconatct);
        system.debug(indexofaccount);
        ListofWrapperClass[indexofaccount-1].conList.remove(indexofconatct-1);
    }
    public void saveallrecord(){
        integer noofAccount=ListofWrapperClass.size();
        List<Account> accList=new List<Account>();
        for(integer i=0;i<noofAccount;i++)
            accList.add(ListofWrapperClass[i].acc);
        insert accList;
       
        List<Contact> contactwithaccountId=new List<Contact>();
        /* map<Id,List<Contact>> conwAccountId=new map<Id,List<Contact>>();
        for(Integer i=0;i<noofAccount;i++){
            conwAccountId.put(ListofWrapperClass[i].acc.id,ListofWrapperClass[i].conList);
        }*/
            
        for(AccountWithContact inst:ListofWrapperClass){
            for(Contact con:inst.conList){
                Contact con1=new Contact();
                con1=con;
                con1.AccountId=inst.acc.id;
                contactwithaccountId.add(con1);
            }
        }
        insert contactwithaccountId;
        ListofWrapperClass.clear();
    }
     public class AccountWithContact{
        public Account acc{get;set;}
        public List<Contact> conList{get;set;}
    }
}