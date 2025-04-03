public with sharing class CustomRelatedListController {
  static String childsObjectAPIName;
  static String childRelationShipFieldAPIName;
  static String childRelationShipFieldAPILabel;
  static Map<String, String> mapOfFieldAPINameWithRelationShipName;
  static Set<String> fieldToBeIgnoreWhileSearch;
  @AuraEnabled
  public static Map<String, Object> getRelatedListRecords(
    RequestComponentWrapper requestParams
  ) {
    try {
      Map<String, Object> returnMap = new Map<String, Object>();
      returnMap.put('columns', columnBuilder(requestParams));

      System.debug('childsObjectAPIName--test' + childsObjectAPIName);
      System.debug('seletedFields--test' + requestParams.seletedFields);
      System.debug(
        'childRelationShipFieldAPIName--test' + childRelationShipFieldAPIName
      );
      System.debug(
        'childRelationShipFieldAPILabel--test' + childRelationShipFieldAPILabel
      );
      String queryString =
        'Select Id,' +
        requestParams.seletedFields +
        ' FROM ' +
        childsObjectAPIName +
        ' WHERE ' +
        childRelationShipFieldAPIName +
        '=\'' +
        requestParams.recordId +
        '\'';
      returnMap.put('data', Database.query(queryString));
      System.debug('returnMap--test' + returnMap);
      return returnMap;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }

  static private List<RequestComponentWrapper.Column> columnBuilder(
    RequestComponentWrapper requestParams
  ) {
    fieldToBeIgnoreWhileSearch = new Set<String>();
    Schema.DescribeSObjectResult sObjectRecordSchema = Schema.getGlobalDescribe()
      .get(requestParams.recordId.getSObjectType().toString())
      .getDescribe();
    List<Schema.ChildRelationship> childRelationShip = sObjectRecordSchema.childrelationships;
    Map<String, Schema.ChildRelationship> mapOfObjectWithChildRelationShip = new Map<String, Schema.ChildRelationship>();
    System.debug('childRelationShip--test' + JSON.serialize(childRelationShip));
    for (Schema.ChildRelationship eachChildRelationShip : childRelationShip) {
      if (
        eachChildRelationShip.relationshipName ==
        requestParams.relationShipFieldAPIName
      ) {
        System.debug(
          'getRelationshipName--test' +
          eachChildRelationShip.getRelationshipName()
        );
        mapOfObjectWithChildRelationShip.put(
          eachChildRelationShip.relationshipName,
          eachChildRelationShip
        );
      }
    }
    System.debug(
      'mapOfObjectWithChildRelationShip--test' +
      mapOfObjectWithChildRelationShip
    );
    System.debug('childRelationShip--test' + childRelationShip);
    List<RequestComponentWrapper.Column> columns = new List<RequestComponentWrapper.Column>();
    childsObjectAPIName = mapOfObjectWithChildRelationShip.get(
        requestParams.relationShipFieldAPIName
      )
      .childsobject.toString();
    Schema.DescribeFieldResult childFielddResult = mapOfObjectWithChildRelationShip.get(
        requestParams.relationShipFieldAPIName
      )
      .field.getDescribe();
    childRelationShipFieldAPIName = childFielddResult.name;
    childRelationShipFieldAPILabel = childFielddResult.label;
    Schema.DescribeSObjectResult sObjectSchema = Schema.getGlobalDescribe()
      .get(childsObjectAPIName)
      .getDescribe();
    Map<String, Schema.SObjectField> mapOfFieldWithSchema = sObjectSchema.fields.getMap();
    mapOfFieldAPINameWithRelationShipName = new Map<String, String>();
    for (String eachField : requestParams.seletedFields.split(',')) {
      Schema.DescribeFieldResult fieldInfo = mapOfFieldWithSchema.get(eachField)
        .getDescribe();
      RequestComponentWrapper.Column colum = new RequestComponentWrapper.Column();
      colum.fieldName = fieldInfo.name;
      colum.label = fieldInfo.label;
      colum.editable = fieldInfo.updateable;
      colum.isRequired = fieldInfo.isNillable();
      //colum.editable = false;
      System.debug('type--test' + fieldInfo.getType().toString());
      System.debug('fieldInfo--test' + JSON.serialize(fieldInfo));
      System.debug('fieldInfo.sobjecttype--test' + fieldInfo.sobjecttype);
      colum.type = fieldInfo.getType().toString().toLowerCase();
      if(colum.type == 'datetime'){
        colum.type = 'date';
      }
      if(colum.fieldName == 'LastName'){
        colum.fieldName = 'Id';
        colum.type = 'url';
        colum.target = '_blank';
        colum.typeAttributes = new RequestComponentWrapper.TypeAttributes();
        colum.typeAttributes.label = new Map<String,String>();
        colum.typeAttributes.label.put('fieldName', 'LastName');
      }
      if(colum.type == 'boolean' || colum.type == 'reference' || colum.type == 'datetime' || colum.type == 'date'){
        fieldToBeIgnoreWhileSearch.add(colum.fieldName);
      }
      if(colum.type == 'picklist' ){
        colum.typeAttributes = new RequestComponentWrapper.TypeAttributes();
        colum.typeAttributes.options = new List<RequestComponentWrapper.Column>();
        colum.typeAttributes.options.add(new RequestComponentWrapper.Column('test','test'));
      }
      if (colum.type == 'reference') {
        mapOfFieldAPINameWithRelationShipName.put(
          fieldInfo.name,
          fieldInfo.relationshipName + '.Name'
        );
        colum.type = 'text';
        //colum.fieldName = fieldInfo.relationshipName+'Name';
        requestParams.seletedFields +=
          ',' +
          fieldInfo.relationshipName +
          '.Name';
      }
      columns.add(colum);
    }
    System.debug('columns--test' + columns);
    return columns;
  }

  @AuraEnabled
  public static object handleSearch(RequestComponentWrapper requestParams) {
    try {
      Map<String, Object> returnMap = new Map<String, Object>();
      returnMap.put('columns', columnBuilder(requestParams));
      String queryString =
        'Select Id,' +
        requestParams.seletedFields +
        ' FROM ' +
        childsObjectAPIName +
        ' WHERE ' +
        childRelationShipFieldAPIName +
        '=\'' +
        requestParams.recordId +
        '\'';
      queryString += buildSearchTerms(requestParams);
      System.debug('queryString--test'+queryString);
      returnMap.put('data', Database.query(queryString));
      System.debug('returnMap--test' + returnMap);
      return returnMap;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }

  static String buildSearchTerms(RequestComponentWrapper requestParams) {
    String searchCondition = ' AND (';
    for (String eachField : requestParams.seletedFields.split(',')) {
      if(fieldToBeIgnoreWhileSearch.contains(eachField)){
        continue;
      }
      searchCondition +=
        ' '+eachField +
        ' LIKE \'%' +
        requestParams.searchKey +
        '%\''+' OR';
    }
    searchCondition = searchCondition.removeEnd('OR');
    searchCondition += ')';
    return searchCondition;
  }
}