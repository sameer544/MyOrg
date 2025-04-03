public class HelpingClassAnnualRevenueDivide {
	public static void InsertContact(List<Contact> conList) {
		Set<Id> AccountIdofContact = new Set<Id> ();
		for (Contact con : conList)
		AccountIdofContact.add(con.AccountId);
		List<AggregateResult> CountWithAccountId = [Select COUNT(Id),AccountId FROM Contact WHERE AccountId=:AccountIdofContact group by AccountId];
		//System.debug(CountWithAccountId);
		Map<Id,Integer> MapOfCountWithAccountId=new Map<Id,Integer>();
		for(Contact con:conList){
		   
		}
	}
}