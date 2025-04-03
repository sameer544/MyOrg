public class Merge_Account_Controller {
    public boolean redermrebutton{get;set;}
    public boolean enablemergebutton{get;set;}
    public List<checkboxwithAccountinfo> repeaterinfoList{get;set;}
    public boolean rendaredthepageblock{get;set;}
    public string searchstring{get;set;}
    public Merge_Account_Controller(){
        repeaterinfoList=new List<checkboxwithAccountinfo>();
        rendaredthepageblock=false;
        redermrebutton=true;
        enablemergebutton=false;
    }
    public void searchItem(){
         redermrebutton=true;
        enablemergebutton=false;
        repeaterinfoList.clear();
        rendaredthepageblock=true;
        List<Account> searchList=[select Id,Name,industry,rating from Account where name like:'%'+searchstring+'%'];
        for(Account acc:searchList){
            repeaterinfoList.add(new checkboxwithAccountinfo(false,acc));
        }
    }
    public void mergeAccount(){
        List<checkboxwithAccountinfo> tempList=new List<checkboxwithAccountinfo>();
        integer count=0;
        for(checkboxwithAccountinfo var:repeaterinfoList){
            if(var.checkbox==true){
                tempList.add(new checkboxwithAccountinfo(false,var.acc));
                count++;
            }
        }
        if(count==2){
        repeaterinfoList.clear();
        repeaterinfoList.Addall(tempList);
        redermrebutton=false;
        enablemergebutton=true;
        }
        else if(count<2){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Select Two Record'));
        }
        else{
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'You may only select up to two records to merge.'));
        }
    }
    public void cancelmergin(){
        rendaredthepageblock=false;
        repeaterinfoList.clear();
        searchstring=null;
    }
    public void finalMerge(){
        integer count=0;
        Account PrimaryAccount=new Account();
        Account secondaryaccount=new Account();
        for(checkboxwithAccountinfo var:repeaterinfoList){
            if(var.checkbox==true){
                PrimaryAccount=var.acc;
                count++;
            }
            else{
                secondaryaccount=var.acc;
            }
        }
        if(count==1){
        database.merge(PrimaryAccount, secondaryaccount);
        repeaterinfoList.clear();
        rendaredthepageblock=false;
        searchstring=null;
        }
        else if(count>1){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Select only one Account'));
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Select Primary Account'));
        }
    }
    
    public class checkboxwithAccountinfo{
         public boolean checkbox{get;set;}
        public Account acc{get;set;}
        public checkboxwithAccountinfo(boolean checkbox,Account acc){
            this.checkbox=checkbox;
            this.acc=acc;
        }
    }
}