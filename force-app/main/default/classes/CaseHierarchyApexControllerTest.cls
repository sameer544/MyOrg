@isTest
private with sharing class CaseHierarchyApexControllerTest {
    @isTest
    static void testMethod1() {
		Case parentRecord = new Case();
        parentRecord.Origin = 'Phone';
        insert parentRecord;
        Case childRecord = new Case();
        childRecord.Origin = 'Phone';
        childRecord.ParentId = parentRecord.Id;
        insert childRecord;
        Case childRecord2 = new Case();
        childRecord2.Origin = 'Phone';
        childRecord2.ParentId = childRecord.Id;
        insert childRecord2;
        Case childRecord3 = new Case();
        childRecord3.Origin = 'Phone';
        childRecord3.ParentId = parentRecord.Id;
        insert childRecord3;
        CaseHierarchyApexController.getCaseRecordList(parentRecord.Id);
        CaseHierarchyApexController.next(parentRecord.Id, parentRecord.id);
        CaseHierarchyApexController.previous(parentRecord.Id, parentRecord.id);
    } 
}