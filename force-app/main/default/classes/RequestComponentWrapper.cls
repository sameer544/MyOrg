public with sharing class RequestComponentWrapper {
  @AuraEnabled
  public String relationShipFieldAPIName { get; set; }

  @AuraEnabled
  public String seletedFields { get; set; }

  @AuraEnabled
  public Id recordId { get; set; }

  @AuraEnabled
  public String searchKey { get; set; }

  @AuraEnabled
  public String recordToBeUpdated { get; set; }

  @AuraEnabled
  public List<Column> columns { get; set; }

  public class Column {
    public Column(){}
    public Column(String label,String value){
      this.label = label;
      this.value = value;
    }
    @AuraEnabled
    public String label { get; set; }
    @AuraEnabled
    public String value { get; set; }

    @AuraEnabled
    public String fieldName { get; set; }

    @AuraEnabled
    public boolean editable { get; set; }

    @AuraEnabled
    public String type { get; set; }
    @AuraEnabled
    public String target { get; set; }

    @AuraEnabled
    public Boolean isRequired { get; set; }

    @AuraEnabled
    public TypeAttributes typeAttributes { get; set; }
  }

  public class TypeAttributes{
    @AuraEnabled
    public String placeholder { get; set; }
    @AuraEnabled
    public List<Column> options { get; set; }
    @AuraEnabled
    public Column value { get; set; }
    @AuraEnabled
    public Column context { get; set; }
    @AuraEnabled
    public Map<String,String> label { get; set; }

  }
}