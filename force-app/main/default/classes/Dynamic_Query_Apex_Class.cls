public class Dynamic_Query_Apex_Class {
    public List<selectOption> pickList{get;set;}
    public List<Account> listrecord{get;set;}
    public renderClass renderfields{get;set;}
   
    public Dynamic_Query_Apex_Class(){
        pickList=new List<selectOption>();
        renderfields=new renderClass();
     pickList.add(new selectoption('Name','Name'));
     pickList.add(new selectoption('Industry','Industry'));
      pickList.add(new selectoption('Rating','Rating'));
        pickList.add(new selectoption('AnnualRevenue','Annual Revenue'));
       renderfields.Namefield=false;
       renderfields.Industryfield=false;
        renderfields.Ratingfield=false;
        renderfields.AnnualRevenuefield=false;
    }
    public void Listrecord(){
        renderfields.querystring='Select Id,';
        renderfields.selectedvalue=renderfields.selectedvalue.substringBetween('[', ']');
        if(renderfields.selectedvalue!=''){
        renderfields.querystring+=renderfields.selectedvalue;
        listofRecords(renderfields.selectedvalue);
        }
    }
    public void listofRecords(string cnd){
        renderfields.Namefield=false;
        renderfields.Industryfield=false;
        renderfields.Ratingfield=false;
        renderfields.AnnualRevenuefield=false;
        renderfields.querystring+=' from account';
        listrecord=database.query(renderfields.querystring);
        cnd=cnd.trim();
        List<String> lt=cnd.split(',');
        for(string v:lt){
            v=v.trim();
            if(v=='Name'){
                renderfields.Namefield=true;
                continue;
            }else
            if(v=='Industry'){
                renderfields.Industryfield=true;
                continue;
            }else
            if(v=='Rating'){
                renderfields.Ratingfield=true;
                continue;
            }else
            if(v=='AnnualRevenue'){
                 renderfields.AnnualRevenuefield=true;
                continue;
            }
        }
    }
}