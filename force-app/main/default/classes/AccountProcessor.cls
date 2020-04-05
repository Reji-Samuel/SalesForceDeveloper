public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<Id>AccountId){
        List<Account>ToBeUpdateAccount=new List<Account>();
        List<Account>ActList =[SELECT Id,Number_of_Contacts__c,(select Id from Contacts) FROM Account where Id=:AccountId];
        for(Account accId:ActList){
            accId.Number_of_Contacts__c=accId.Contacts.size();
            ToBeUpdateAccount.add(accId);
        }
       update ToBeUpdateAccount;
        
    }
}