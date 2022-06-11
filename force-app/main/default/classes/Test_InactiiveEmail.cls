@IsTest
public class Test_InactiiveEmail {
	@IsTest
	static void TestTtrigger() {
		Date closeDt = Date.Today();
		date myDate = date.today();
		opportunity oppr = new opportunity(Name = 'testing DIE 4/6/2015', StageName = 'Prospecting', CloseDate = closeDt);
		insert oppr;
		Product2 pro2 = new Product2(Name = 'BXCD', isActive = true);
		insert pro2;
		PricebookEntry pbe2 = new PricebookEntry(unitprice = 0.01, Product2Id = pro2.Id, Pricebook2Id = Test.getStandardPricebookId(), isActive = true, UseStandardPrice = false);
		insert pbe2;
		OpportunityLineItem OPplineitem2 = new OpportunityLineItem(Quantity = 2, OpportunityId = oppr.Id, UnitPrice = 0.01, PriceBookEntryId = pbe2.Id);
		insert OPplineitem2;
		Product2 ob = new Product2(Id = pro2.Id, Isactive = false);
		update ob;
	}
}