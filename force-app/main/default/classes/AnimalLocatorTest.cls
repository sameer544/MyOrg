@isTest
public class AnimalLocatorTest {
    static testMethod void method1(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        AnimalLocator.getAnimalNameById(1);
    }
}