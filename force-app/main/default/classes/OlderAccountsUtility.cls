public class OlderAccountsUtility {
    public static void updateOlderAccounts(){
        Account[] oldAccounts=[select Id,Description from Account order by CreatedDate ASC LIMIT 5];
        for (Account acct:oldAccounts){
            acct.Description='Heritage Account';
        }
        update oldAccounts;
    }
}