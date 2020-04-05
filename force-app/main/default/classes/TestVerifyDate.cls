@isTest
private class TestVerifyDate {
  @isTest  static void checkDate2validity_within30(){
       Date DateTest1= VerifyDate.CheckDates(System.today(),System.today()+10);
        System.assertEquals(System.today()+10, DateTest1);
    }
  @isTest  static void checkDate2validity_EndOfMonth(){
        Date DateTest2=VerifyDate.CheckDates(System.today(), System.today()+52) ;
        System.assertEquals(System.today()+16, DateTest2);
    }
}