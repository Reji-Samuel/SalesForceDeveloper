@isTest
public class UserCommentsUnitTest {
    @isTest
    private static void testsaveCaseComment(){
        String comment='Test Comment';
        Case testCase=TestUtilityClass.createCase('New','Phone');
        Test.startTest();
        insert testCase;
        
        UserComments.saveCaseComment(testCase.Id, comment);
        Test.stopTest();
        List<Case>newDescription=[SELECT Description FROM Case WHERE ID=:testCase.Id LIMIT 1]; 
       System.assertEquals('Test Comment',newDescription[0].Description);   
    }
}