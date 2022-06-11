@isTest
public with sharing class TestClass{
	public static testMethod void methodName(){
		Test.startTest();
		HelloWorld ob = new HelloWorld();
		HelloWorld.sum(2, 3);
		Test.stopTest();
	}
}