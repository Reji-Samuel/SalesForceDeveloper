public with sharing class AccountHandler {
    public static Account insertNewAccount(String inputStr){
        try
        {
        Account acct=new Account(Name=inputStr);
        insert acct;
 		return acct;
        }
        catch(DmlException e){
            return (null);
        }
    }
}