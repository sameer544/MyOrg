public class Restrict_Helping_Class {
	public static void InsertContact(List<Contact> conList) {
		Map<Id, Decimal> countAccount = new Map<Id, Decimal> ();
		set<Id> AccountId = new set<Id> ();
		for (Contact con : conList)
		AccountId.add(con.AccountId);
		List<AggregateResult> accList = [Select COUNT(Id) ctcontact, AccountId atId FROM Contact WHERE AccountId = :AccountId group by AccountId];
		for (AggregateResult acc : accList)
		countAccount.put((Id) acc.get('atId'), Integer.valueOf(acc.get('ctcontact')));
		List<Account> tempList = new List<Account> ();
		for (Contact con : conList) {
			Decimal cut = [Select Available_Contact__c from Account where Id = :con.AccountId] [0].Available_Contact__c;
			if (countAccount.get(con.AccountId) == null)
			countAccount.put(con.AccountId, cut - 1);
			else if (cut > 0)
			countAccount.put(con.AccountId, cut - 1);
			else
			con.addError('Error');
		}
		for (Id acc : countAccount.keySet()) {
			Account accountTemp = new Account(Id = acc, Available_Contact__c = countAccount.get(acc));
			tempList.add(accountTemp);
		}
		update tempList;
	}
}