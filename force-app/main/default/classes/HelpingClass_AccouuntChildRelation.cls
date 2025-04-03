public class HelpingClass_AccouuntChildRelation {
	public static void insertContact(List<Account> accList) {
		Map<Id, List<Contact>> MapCopyRecord = new Map<Id, List<Contact>> ();
		List<Contact> conList = new List<Contact> ();
		for (Account acc : accList) {
			if (PickListValues__c.getOrgDefaults().value1__C == acc.Status__c) {
				Contact con = new Contact(AccountId = acc.Id, lastName = 'New Record');
				conList.add(con);
			}
			else if (PickListValues__c.getOrgDefaults().value2__C == acc.Status__c && acc.ParentId!=null) {
				List<Contact> tempCon = [Select LastName, FirstName FROM Contact WHERE AccountId = :acc.Id];
				MapCopyRecord.put(acc.ParentId, tempCon);
			}
		}
		for (Id var : MapCopyRecord.keySet()) {
			for (Contact con : MapCopyRecord.get(var)) {
				con.AccountId = var;
				con.Id = null;
			}
			conList.addAll(MapCopyRecord.get(var));
		}
		System.debug(conList);
		Database.insert(conList, false);
	}
}