public class demo_class {
    public void test(){
        Demo__c ob= Demo__c.getOrgDefaults();
        string s=ob.IndustryName__c;
        system.debug(''+s);
    }
}