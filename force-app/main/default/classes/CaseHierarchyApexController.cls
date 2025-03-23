public with sharing class CaseHierarchyApexController{
    static final Integer FIRST_LEVEL_RECORD_SIZE = 5;

    @AuraEnabled (cacheable=true)
    public static object getCaseRecordList(Id recordIdInfo){
        Map<String, Object> returnMap = new map<String, Object>();
        try{
            System.debug('requestInformation' + recordIdInfo);
            Integer countOfRecord = [SELECT Count() FROM Case WHERE ParentId=:recordIdInfo];
            List<Case> caseList = [SELECT Id, CaseNumber, Subject, Origin,
                                   (SELECT Id, CaseNumber, Subject, Origin FROM Cases)
                                   FROM Case
                                   WHERE ParentId = :recordIdInfo ORDER BY Id LIMIT :FIRST_LEVEL_RECORD_SIZE];
            List<TreeStructure> treeData = new List<TreeStructure>();
            TreeStructure innerRecord;
            Integer index = 1;
            Id lastCaseId;
            Id firstRecordId;
            for(Case each : caseList){
                if(index == 1){
                    firstRecordId = each.Id;
                }
                innerRecord = new TreeStructure();
                innerRecord.label = each.CaseNumber;
                innerRecord.name = '' + index;
                innerRecord.metatext = 'Subject - '+ each.Subject + ': Origin - ' + each.Origin;
                innerRecord.href = '/'+each.Id;
                innerRecord.expanded = false;
                innerRecord.items = new List<TreeStructure>();
                if(each.Cases != null){
                    innerRecord.items = prepareSecondLevelData(each.Cases,index);
                }
                treeData.add(innerRecord);
                index++;
                lastCaseId = each.Id;
            }
            System.debug('data' + JSON.serialize(treeData));
            returnMap.put('caseInfo' , treeData);
            returnMap.put('isMoreThanConstantValue' , countOfRecord > FIRST_LEVEL_RECORD_SIZE);
            returnMap.put('lastCaseId' , lastCaseId);
            returnMap.put('firstCaseId' , firstRecordId);
            return returnMap;
        } catch (Exception ex){
            returnMap.put('caseInfo' , '[]');
            returnMap.put('errorMessage', ex.getMessage());
            return returnMap;
        }
    }

    private static List<TreeStructure> prepareSecondLevelData(List<Case> listCases,Integer index){
        List<TreeStructure> treeData = new List<TreeStructure>();
        TreeStructure innerRecord;
        Integer childIndex = 1;
        for(Case each : listCases){
            innerRecord = new TreeStructure();
            innerRecord.label = each.CaseNumber;
            innerRecord.name = '' + index + '' + childIndex;
            innerRecord.metatext = 'Subject - '+ each.Subject + ': Origin - ' + each.Origin;
            innerRecord.href = '/'+each.Id;
            innerRecord.expanded = false;
            innerRecord.items = new List<TreeStructure>();
            treeData.add(innerRecord);
            childIndex++;
        }
        return treeData;
    }

    @AuraEnabled (cacheable=true)
    public static object next(Id recordIdInfo, Id nextRecordId){
        Map<String, Object> returnMap = new map<String, Object>();
        try{
            System.debug('requestInformation' + recordIdInfo);
            Integer countOfRecord = [SELECT Count() FROM Case WHERE ParentId=:recordIdInfo AND Id >:nextRecordId ];
            List<Case> caseList = [SELECT Id, CaseNumber, Subject, Origin,
                                   (SELECT Id, CaseNumber, Subject, Origin FROM Cases)
                                   FROM Case
                                   WHERE ParentId = :recordIdInfo AND Id >:nextRecordId ORDER BY Id LIMIT :FIRST_LEVEL_RECORD_SIZE];
            List<TreeStructure> treeData = new List<TreeStructure>();
            TreeStructure innerRecord;
            Integer index = 1;
            Id lastCaseId;
            Id firstRecordId;
            for(Case each : caseList){
                if(index == 1){
                    firstRecordId = each.Id;
                }
                innerRecord = new TreeStructure();
                innerRecord.label = each.CaseNumber;
                innerRecord.name = '' + index;
                innerRecord.metatext = 'Subject - '+ each.Subject + ': Origin - ' + each.Origin;
                innerRecord.href = '/'+each.Id;
                innerRecord.expanded = false;
                innerRecord.items = new List<TreeStructure>();
                if(each.Cases != null){
                    innerRecord.items = prepareSecondLevelData(each.Cases,index);
                }
                treeData.add(innerRecord);
                index++;
                lastCaseId = each.Id;
            }
            System.debug('data' + JSON.serialize(treeData));
            returnMap.put('caseInfo' , treeData);
            returnMap.put('isMoreThanConstantValue' , countOfRecord > FIRST_LEVEL_RECORD_SIZE);
            returnMap.put('lastCaseId' , lastCaseId);
            returnMap.put('firstCaseId' , firstRecordId);
            return returnMap;
        } catch (Exception ex){
            returnMap.put('caseInfo' , '[]');
            returnMap.put('errorMessage', ex.getMessage());
            return returnMap;
        }
    }

    @AuraEnabled (cacheable=true)
    public static object previous(Id recordIdInfo, Id previousRecordId){
        System.debug('previousRecordId' + previousRecordId);
        Map<String, Object> returnMap = new map<String, Object>();
        try{
            System.debug('requestInformation' + recordIdInfo);
            Integer countOfRecord = [SELECT Count() FROM Case WHERE ParentId=:recordIdInfo];
            List<Case> caseList = [SELECT Id, CaseNumber, Subject, Origin,
                                   (SELECT Id, CaseNumber, Subject, Origin FROM Cases)
                                   FROM Case
                                   WHERE ParentId = :recordIdInfo AND Id <:previousRecordId ORDER BY Id DESC LIMIT :FIRST_LEVEL_RECORD_SIZE];
            List<TreeStructure> treeData = new List<TreeStructure>();
            TreeStructure innerRecord;
            Integer index = 1;
            Id lastCaseId;
            Id firstRecordId;
            Integer iterIn = caseList.size() - 1;
            for(Integer val = iterIn;val>=0; val--){
                if(index == 1){
                    firstRecordId = caseList[val].Id;
                }
                innerRecord = new TreeStructure();
                innerRecord.label = caseList[val].CaseNumber;
                innerRecord.name = '' + index;
                innerRecord.metatext = 'Subject - '+ caseList[val].Subject + ': Origin - ' + caseList[val].Origin;
                innerRecord.href = '/'+caseList[val].Id;
                innerRecord.expanded = false;
                innerRecord.items = new List<TreeStructure>();
                if(caseList[val].Cases != null){
                    innerRecord.items = prepareSecondLevelData(caseList[val].Cases,index);
                }
                treeData.add(innerRecord);
                index++;
                lastCaseId = caseList[val].Id;
            }
            System.debug('data' + JSON.serialize(treeData));
            returnMap.put('caseInfo' , treeData);
            returnMap.put('isMoreThanConstantValue' , countOfRecord > FIRST_LEVEL_RECORD_SIZE);
            returnMap.put('lastCaseId' , lastCaseId);
            returnMap.put('firstCaseId' , firstRecordId);
            return returnMap;
        } catch (Exception ex){
            returnMap.put('caseInfo' , '[]');
            returnMap.put('errorMessage', ex.getMessage());
            return returnMap;
        }
    }

    Class TreeStructure{
        @AuraEnabled
        public String label;
        @AuraEnabled
        public String name;
        @AuraEnabled
        public String metatext;
        @AuraEnabled
        public boolean expanded;
        @AuraEnabled
        public string href;
        @AuraEnabled
        public List<TreeStructure> items;
    }
}