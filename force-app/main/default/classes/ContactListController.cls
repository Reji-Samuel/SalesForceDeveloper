public class ContactListController {
@AuraEnabled
    public static List<Contact> getContactList(String accountId){
        List<Contact> conList=new List<Contact>([SELECT FirstName,LastName,Email,Phone from Contact where Email!=NULL
                                                 AND accountId=:accountId]);
        return conList;
    }
}