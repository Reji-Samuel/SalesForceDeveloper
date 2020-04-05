@isTest
public class AccountProcessorTest {
@isTest
    public static void testAccountProcessor(){
        Account acc1=new Account(Name='Test_Account');
        insert acc1;
        Contact con1=new Contact(FirstName='Test',LastName='Async',Accountid=acc1.id);
        insert con1;
        Contact con2=new Contact(FirstName='Test',LastName='Async2',Accountid=acc1.id);
        insert con2;
        
        List<Account> testaccount=[SELECT Id,Number_of_Contacts__c,(select Id from Contacts) FROM Account where Id=:acc1.Id];
        List<Id>aList=new List<Id>();
        for(Account a:testaccount){
            aList.add(a.Id);
        }
        test.startTest();
        AccountProcessor.countContacts(aList);
        test.stopTest();
        Account act=[SELECT Id,Number_of_Contacts__c from Account WHERE Name='Test_Account'];
        System.assertEquals(2, act.Number_of_Contacts__c);
    }
}