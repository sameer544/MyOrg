public class LightningComponentController {
	@AuraEnabled
	public static List<Account> updateRecord(String AccountId) {
		return [Select Id,Name,industry From Account WHERE Id=:AccountId];
	}
}