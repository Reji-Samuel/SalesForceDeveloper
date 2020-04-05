public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String checkParam){
       List<List<SObject>> smithSearch=[FIND :checkParam IN ALL FIELDS RETURNING
                                       Contact(FirstName,LastName),Lead(FirstName,LastName)]; 
        return smithSearch;
    }
}