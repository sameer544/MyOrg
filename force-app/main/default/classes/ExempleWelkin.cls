public class ExempleWelkin {
	public ExempleWelkin() {
		System.debug('Hello');
	}
	public void runsoql() {
		List<Account> accList = [Select Id, Name FROM Account];
		for (Account acc : accList) {
			System.debug(acc.Name);
		}
	}
}