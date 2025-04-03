public class RecordManagementSystem_Controller {
    public Integer NumberOfRecord{get;set;}
    public Static integer NumberOfpages;
    public boolean nextbuttonenable{get;set;}
    public boolean prebuttonenable{get;set;}
    public boolean navdisable{get;set;}
    public integer numberofrecordsize;
    public integer nameofpage{get;set;}
    string fld;
    public string query;
    public List<RecordMangementSystemProperty_help_class> pagebutton{get;set;}
    public string pageplusrecords{get;set;}
    public RecordMangementSystemProperty_help_class Property{get;set;}
    public RecordManagementSystem_Controller(){
        Property=new RecordMangementSystemProperty_help_class();
        Property.SelectObjectFieldName=new List<String>();
        Property.AllObjectNamePickList=new List<Selectoption>();
        for(string key:schema.getGlobalDescribe().keyset()){
            string labelofthefield=schema.getGlobalDescribe().get(key).getDescribe().getlabel();
            Property.AllObjectNamePickList.add(new selectoption(key,labelofthefield));
        }
    }
    public void FieldNameRelatedToObject(){
        Property.FieldNameRelatedToObject=new List<Selectoption>();
        for(string key :schema.getGlobalDescribe().get(Property.selectedObjectName).getDescribe().Fields.getMap().keyset()){
            string fieldName=schema.getGlobalDescribe().get(Property.selectedObjectName).getDescribe().Fields.getMap().get(key).getDescribe().getlabel();
            Property.FieldNameRelatedToObject.add(new selectOption(key,fieldName));
        }
    }
    public void QueryBuilderData(){
        List<SObject> ListOfRecords=new List<SObject>();
        pagebutton=new List<RecordMangementSystemProperty_help_class>();
        fld=string.join(Property.SelectObjectFieldName, ',');
        query='Select '+fld+' from '+Property.selectedObjectName+' limit 10000';
        if(Property.SelectObjectFieldName!=null)
        ListOfRecords=database.query(query);
        numberofrecordsize=ListOfRecords.size();
        integer sizeofrecord =ListOfRecords.size();
        NumberOfpages=sizeofrecord/100;
        if(Math.mod(sizeofrecord, 100)!=0)
        NumberOfpages++;
           for(Integer x=1;x<=NumberOfpages;x++){
               if(x==NumberOfpages && Math.mod(sizeofrecord, 20)!=0){
                RecordMangementSystemProperty_help_class ob=new RecordMangementSystemProperty_help_class();
                ob.numberofpage=x;
                ob.numberofrecords=(Math.mod(sizeofrecord, 100));
                pagebutton.add(ob);
               }else{
                RecordMangementSystemProperty_help_class ob=new RecordMangementSystemProperty_help_class();
                ob.numberofpage=x;
                ob.numberofrecords=100;
                pagebutton.add(ob);
                
               }
            }
        if(sizeofrecord<100){
            Property.ListOfRecords=database.query(query);
            pagebutton.clear();
        }
        else{
            query='Select '+fld+' from '+Property.selectedObjectName+' order by id limit 100';
            Property.ListOfRecords=database.query(query);
            nameofpage=1;
        }
        NumberOfpages=pagebutton.size();
        if(NumberOfpages==0){
            navdisable=false;
        }
        else{
            navdisable=true;
            nextbuttonenable=false;
        }
        System.debug(pagebutton);
    }
    public void NextButton(){
        NumberOfRecord=0;
        for(RecordMangementSystemProperty_help_class ob:pagebutton){
            
            NumberOfRecord+=ob.numberofrecords;
            if(nameofpage==ob.numberofpage){
                break;
            }
        }
        System.debug(pagebutton.size());
        system.debug(nameofpage);
        system.debug(NumberOfRecord);
		query='Select '+fld+' from '+Property.selectedObjectName+' order by id limit 100'+' offset '+NumberOfRecord;
	    Property.ListOfRecords=database.query(query);
        nameofpage++;
        if(nameofpage==pagebutton.size()){
            nextbuttonenable=true;
        }
    }
    public void prebutton(){
        nameofpage--;
        System.debug(nameofpage);
         for(RecordMangementSystemProperty_help_class ob:pagebutton){
            NumberOfRecord=0;
            NumberOfRecord+=ob.numberofrecords;
            if(nameofpage==ob.numberofpage){
                NumberOfRecord-=ob.numberofrecords;
                break;
            }
           
        }
        system.debug(NumberOfRecord);
        query='Select '+fld+' from '+Property.selectedObjectName+' order by id limit 100'+' offset '+NumberOfRecord;
	    Property.ListOfRecords=database.query(query);
        system.debug(NumberOfRecord);
        system.debug(Property.ListOfRecords.size());
        if(nextbuttonenable){
            nextbuttonenable=false;
        }
    }
}