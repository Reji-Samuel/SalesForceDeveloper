public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accList){
        for(Account act:accList){
            if(act.ShippingState!=act.BillingState){
                act.ShippingState=act.BillingState;
            }
        }
    }
}