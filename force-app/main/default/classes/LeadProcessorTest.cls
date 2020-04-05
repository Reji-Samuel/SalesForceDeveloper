@isTest
private class LeadProcessorTest {
@testSetup
    static void setup(){
        List<Lead>bulkLead=new List<Lead>();
        
        for (Integer i=0;i<200;i++){
            bulkLead.add(new Lead(LastName='Lead_'+i,Company='Lead', Status='Open - Not Contacted'));
        }
        insert bulkLead;
        
    }
    static testmethod void test(){
        Test.startTest();
        LeadProcessor lproc=new LeadProcessor();
        Id BatchId=Database.executeBatch(lproc);
        Test.stopTest();
        System.assertEquals(200, [select count() from lead where leadsource = 'DreamForce']);
    }
}