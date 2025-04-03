public class Work_Bench_Functionality_Controller {
   	
    public HelpProperty_Class helpob{get;set;}
    
    public Work_Bench_Functionality_Controller(){
        
        helpob=new HelpProperty_Class();
        helpob.renderoutput=false;
        helpob.objectrecord=new List<SObject>();
        helpob.renderfield=new List<HelpProperty_Class>();
        helpob.renderfield=new List<HelpProperty_Class>();
        helpob.allObjectList =new List<SelectOption>();
        helpob.relatedObjectFieldsList=new List<SelectOption>();
        helpob.allSchema=Schema.getGlobalDescribe();
        helpob.allObjectList.add(new selectoption('None','None'));
        for(String srt:helpob.allSchema.keyset()){
            string objectlable=helpob.allSchema.get(srt).getDescribe().getLabel();
            helpob.allObjectList.add(new selectoption(srt,objectlable));
            helpob.allObjectList.sort();
        }
    }
    public void relatedAllobjectFields(){
        if(helpob.selectedObjectname!='None'){
            helpob.renderoutput=false;
        helpob.QueryString=null;
        helpob.objectrecord.clear();
        helpob.renderfield.clear();
        helpob.relatedObjectFieldsList.clear();
        helpob.allfield=helpob.allSchema.get(helpob.selectedObjectname).getDescribe().fields.getMap();
        for(String srt:helpob.allfield.keyset()){
            if(!srt.contains('address')){
            string objectlable=helpob.allfield.get(srt).getDescribe().getLabel();
            helpob.relatedObjectFieldsList.add(new selectoption(srt,objectlable));
                }
        }
        }
        else{
            helpob.renderoutput=false;
             helpob.QueryString=null;
        helpob.objectrecord.clear();
        helpob.renderfield.clear();
        helpob.relatedObjectFieldsList.clear();
        }
        //relatedObjectFieldsList.sort();
    }
    public void buildQuery(){
        helpob.selectedObjectFields=helpob.selectedObjectFields.substringBetween('[', ']');
        helpob.QueryString='Select '+helpob.selectedObjectFields+' from '+ helpob.selectedObjectname;
    }
    public void ListOfRecord(){
        if(helpob.QueryString!=null){
            
        
        helpob.renderoutput=true;
        helpob.selectedObjectFields=helpob.selectedObjectFields.substringBetween('[', ']');
        helpob.renderfield.clear();
        helpob.objectrecord=database.query(helpob.QueryString+' LIMIT 1000');
       // System.debug(objectrecord);
       helpob.selectedObjectname=helpob.selectedObjectname.trim();
            for(string v:helpob.selectedObjectFields.split(',')){
                v=v.trim();
                HelpProperty_Class ob=new HelpProperty_Class();
                ob.fieldName=v;
                helpob.renderfield.add(ob);
            }
            }
    }
    
}