public class AddPrimaryContact implements Queueable {
    private Contact Primecon;
    private String state;
    public AddPrimaryContact(Contact aCon , String astate){
        this.Primecon=aCon;
        this.state=astate;
    }
    public void execute(QueueableContext context){
        List<Contact>conList=new List<Contact>();
        List<Account>stateList=[SELECT Name from Account WHERE BillingState=:state LIMIT 200];
        for(Account acc:stateList){
            Contact con=Primecon.clone(false,false,false,false);
            con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
    }
}