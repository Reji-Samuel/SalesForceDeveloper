public class AccountUtils {
public static List<Account> accountsByState(String st){
List<Account> acctList=[SELECT Id,Name from Account WHERE billingState=:st];
return acctList;
}
}