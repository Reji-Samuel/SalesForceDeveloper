public class AccountTriggerTest {
    public static void TestCreate200Records(){
        List<Account> accts=new List<Account>();
        for(Integer i=0;i<200;i++){
            Account act=new Account(Name='Test_Account '+i,BillingState='CA');
            accts.add(act);
        }
        Test.startTest();
       insert accts;
       Test.stopTest();
   
        System.assertEquals(200, [SELECT Count() FROM Account WHERE ShippingState='CA']);
    }
}