@isTest
private class CountRestrictionTestClass {

	@isTest
	private static void testName() {
		Account InsertAccount = new Account(Name = 'sameer', Available_Contact__c = 4);
		insert InsertAccount;
		for (Integer x = 0; x< 5; x++) {
			Contact ob = new Contact(LastName = 'same' + x, AccountId = InsertAccount.Id);
			insert ob;
		}
	}
}