public class NewCaseListController {
    public list<Case>getNewCases(){
       list<Case> rcases=[select CaseNumber from case where status='New'];
    //  list<Case> rcases=Database.query('select CaseNumber from case where status='New'');
        return rcases;
    }
}