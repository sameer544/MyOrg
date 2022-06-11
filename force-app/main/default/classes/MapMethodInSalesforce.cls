/**********************************************************
*@Created By   : Sameer Ranjan
*@Created Date : 07/10/2018
*@Class Name   : MapMethodInSalesforce
*@Description  : To make Use of Map Class Method.
***********************************************************/
public class MapMethodInSalesforce {
    //static Method that have map methods.
    public static void mapMethod(){
        Map<Integer, String> mapVar = new Map<Integer, String>();
        mapVar.put(1, 'First item');
        mapVar.put(2, 'Second item');
        Map<Integer, String> mapVar2 = new Map<Integer, String>(mapVar);
        // The map elements of m2 are copied from m1
        System.debug('1:'+mapVar2);
        List<Account> listVar = [select Name from Account];
        //for(Account var:listVar)
        //System.debug(var.Name);
        Map<Id, Account> mapVar3 = new Map<Id, Account>(listVar);
        for(Account var : mapVar3.values())
        System.debug('2:Id='+var.Id+',Acount='+var.Name);
        // Create a generic sObject variable.
        System.debug('3:'+mapVar3.get('0016F00002THqZzQAL'));
        List<SObject> sObj = Database.query('SELECT Id FROM Account LIMIT 1');
        // Verify if that sObject variable is an Account token.
        for(SObject var :sObj)
        System.debug('4:'+var);
        System.debug('4:'+sObj.getSObjectType());
        Map<String, String> colorCodes = new Map<String, String>();
        System.debug('5:'+colorCodes.put('Red', 'ff0000'));
        System.debug('6:'+colorCodes.put('Red', '#FF0000'));
        System.debug('7:'+colorCodes.put('Red', '14FF0000'));
        System.debug('8:'+colorCodes.get('Red'));
        colorCodes.put('Blue', '0000A0');
        System.debug('9:'+colorCodes.remove('Blue'));
        System.debug('10:'+colorCodes.get('Blue'));
        Map<String, String> mapVar4 = new Map<String, String>();
        mapVar4.put('Red','FF0000');
        Map<String, String> mapVar5 = new Map<String, String>();
        mapVar5.put('Blue','0000FF');
        // Add map1 entries to map2
        mapVar5.putAll(mapVar4);
        for(Object var:mapVar5.keySet())
        System.debug('11:'+var);
    }
}