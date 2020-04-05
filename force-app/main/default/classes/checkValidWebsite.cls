public class checkValidWebsite {
@AuraEnabled
    public static String checkWebsite(String RID){
        String qString='SELECT Website FROM Account where Id=:RID LIMIT 1';
        List<Account> ListwebSite= Database.query(qString);
        String webSite='';
        if(ListwebSite.size() != 0)
       webSite = ListwebSite[0].Website;
    return webSite;
        
    }
}