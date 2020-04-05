public class UserComments {
    @AuraEnabled
    public static void saveCaseComment(Id caseId, String comment){
        Case c=[SELECT CaseNumber,Description,Id FROM Case where Id=:caseId];
        c.Description=comment;
        try{
           update c; 
        }
        catch(DmlException e){
            System.debug('The Following Exception occured :'+e.getMessage());
        }
        
    }
    
    @AuraEnabled
    public static List<String> getcaseStatus(Id caseId){
         List<Case> cstatus=[SELECT Status FROM Case where Id=:caseId];
        String[] visibility=new List<String>();
        String status=cstatus[0].Status;
        if(status=='New'){
            visibility.add('false');
            visibility.add('true');
            visibility.add('true');
        }
        else if(status=='Working'){
            visibility.add('true');
            visibility.add('false');
            visibility.add('true');
        }
        else if(status=='Escalated'){
            visibility.add('true');
            visibility.add('true');
            visibility.add('false');
        }
        return visibility;
    }
}