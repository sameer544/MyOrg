public class HelpProperty_Class {
    public string fieldName{get;set;}
    public string QueryString{get;set;}
    public string selectedObjectname{get;set;}
    public string selectedObjectFields{get;set;}
    public List<SObject> objectrecord{get;set;}
    public List<SelectOption> allObjectList{get;set;}
    public Map<String,Schema.SObjectField> allfield{get;set;}
    public List<SelectOption> relatedObjectFieldsList{get;set;}
    public List<HelpProperty_Class> renderfield{get;set;}
    public map<string,Schema.SObjectType> allSchema{get;set;}
    public boolean renderoutput{get;set;}
}