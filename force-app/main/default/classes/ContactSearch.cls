public class ContactSearch {
    public static List<Contact> searchForContacts(String LName,String PCode){
     Contact[] con=[select ID,Name from Contact where LastName=:LName AND MailingPostalCode=:PCode ];   
        return con;
    }
}