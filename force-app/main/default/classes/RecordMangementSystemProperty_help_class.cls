public class RecordMangementSystemProperty_help_class {
    public List<Selectoption> AllObjectNamePickList{get;set;}
    public string selectedObjectName{get;set;}
    public List<Selectoption> FieldNameRelatedToObject{get;set;}
    public List<String> SelectObjectFieldName{get;set;} 
    public Map<String,schema.SObjectField> AllFieldNameRelatedToObject{get;set;}
    public List<SObject> ListOfRecords{get;set;}
    public Integer numberofpage{get;set;}
    public Integer numberofrecords{get;set;}
}