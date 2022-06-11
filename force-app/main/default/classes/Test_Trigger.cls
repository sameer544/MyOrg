@isTest
public class Test_Trigger {
    public static testMethod  void TextAccountTrigger(){
        Account acc1=new Account(Name='sameer');
        insert acc1;
        Account acc2=new Account(Name='sameer');
        insert acc2;
       /* List<Contact> conList=new List<Contact>();
        //Insert Multiple Record
        for(Integer i=0;i<11;i++){
            Contact con=new Contact();
            con.LastName='Sameer'+i;
            con.AccountId=acc1.Id;
            conList.add(con);
        }
        insert conList;
        Contact con=new Contact();
        con.LastName='sameer';
        insert con;
        //Contact con1=new Contact();
        //con.LastName='sameer2';
        //insert con1;*/
    }
}