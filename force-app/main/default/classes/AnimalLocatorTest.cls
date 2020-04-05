@isTest
public class AnimalLocatorTest {
@isTest 
    static void AnimalLocatorTest(){
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
    String result=AnimalLocator.getAnimalNameById(1);
    String executedResult='chicken';
    System.assertEquals(result,executedResult);
    }
}