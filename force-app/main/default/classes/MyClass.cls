public with sharing class MyClass {
	public MyClass() {

	}
	public static void sum() {
		/*string val='asdhbdhssahhgdsgdsgahh';
		  List<String> valu2=val.split('a');
		  string vl='';
		  system.debug(valu2);
		  system.debug(val);
		 
		  for(integer x=0;x<valu2.size();x++){
		  system.debug(x+' '+(x<valu2.size()-2));
		  if(x<valu2.size()-2)
		  vl+=valu2[x]+'a';
		  else
		  vl+=valu2[x];
		  }
		  system.debug(vl);*/
		//List<Account> newList;
		//delete newList=[Select id from Account WHERE Name='zxcvbnm1234567890'];
		Map<Id, Account> newMap = new Map<Id, Account> ([select Id from Account]);
		System.debug('Hello' + newMap.size());
	}
}