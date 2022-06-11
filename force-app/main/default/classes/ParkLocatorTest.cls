@isTest
public class ParkLocatorTest {
	static testMethod void method1(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        ParkLocator.country('India');
    }
}