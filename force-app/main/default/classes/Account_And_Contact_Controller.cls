public class Account_And_Contact_Controller {
    public List<Contact> tempContactList{get;set;}
    public List<Account> tempAccountList{get;set;}
    public List<Contact_Wrapper_Class> wrapperclass{get;set;}
    public integer i=0;
    public Account_And_Contact_Controller(){
      wrapperclass =new List<Contact_Wrapper_Class>();
    }
    public void addAccount(){
        i++;
        System.debug('Hello');
        List<contact_wp> ltc=new List<contact_wp>();
        Contact_Wrapper_Class ob =new Contact_Wrapper_Class(i, new Account(),ltc);
       wrapperclass.add(ob);
    }
    public void addContact(){
        string s=ApexPages.currentPage().getParameters().get('Indexof');
        Integer i=Integer.valueof(s);
        System.debug(s);
        System.debug(ApexPages.currentPage().getParameters().get('Indexof'));
        for(Contact_Wrapper_Class data:wrapperclass){
            if(data.indexaccount==i){
                contact_wp ob=new contact_wp();
                ob.contactindex=i+0.1;
                ob.con=new Contact();
              data.conList.add(ob);
            }
      }
    }
    public void removeContact(){
         double i=double.valueof(ApexPages.currentPage().getParameters().get('Indexof'));
         Integer accountindex=(Integer)i;
                
        List<contact_wp> copycontactList=new List<contact_wp>();
        for(Contact_Wrapper_Class data:wrapperclass){
            if(data.indexaccount==accountindex)
                copycontactList.addAll(data.conList);
        }
        for(Integer x=0;x<copycontactList.size();x++){
            if(copycontactList[x].contactindex==i){
                copycontactList.remove(x);
                break;
            }
        }
         for(Contact_Wrapper_Class data:wrapperclass){
             if(data.indexaccount==accountindex){
                 data.conList.clear();
                 data.conList.addAll(copycontactList);
             }
        }
        
    }
    public void saveAll(){
       /* List<Account> ListAccount=new  List<Account>();
        for(Contact_Wrapper_Class data:wrapperclass){
             ListAccount.add(data.acc);
        }
        insert ListAccount;
        List<contact_wp> copycontactList=new List<contact_wp>();
        List<Id> idofaccount=new List<Id>();
        for(Integer x=0;x<ListAccount.size();x++){
            idofaccount.add(ListAccount[x].id);
        }
        map<Id,List<Contact>> savecontact=new map<Id,List<Contact>>();
        for(Id ac:idofaccount){
            for(Integer x=0;x<wrapperclass.size();x++){
                if(wrapperclass[x].indexaccount==(x+1)){
                    for(Integer y=0;y<wrapperclass[x].conList.size();y++){
                        wrapperclass[x].conList[y].con.id=ac;
                       // insert wrapperclass[x].conList[y].con;
                    }
                }
            }
        }*/
		wrapperclass.clear();        
    }
 }