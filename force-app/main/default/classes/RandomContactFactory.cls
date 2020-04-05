public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContacts,String LastNameGen ){
        List<Contact> con= new List<Contact>();
        for(Integer i=0;i<numOfContacts;i++){
            Contact c=new Contact(FirstName='Test '+i,LastName=LastNameGen);
            con.add(c);
            
        }
        return con;
       
    }
}