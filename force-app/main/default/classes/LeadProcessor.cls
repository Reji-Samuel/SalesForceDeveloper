global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator('SELECT Id,LeadSource FROM Lead');  
    }
    global void execute(Database.BatchableContext bc,List<Lead>scope){
       List<Lead>LeadToBeUpdated=new List<Lead>();
        for(Lead lrec:scope){
            lrec.LeadSource='Dreamforce';
            LeadToBeUpdated.add(lrec);
        }
        update LeadToBeUpdated;
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,JobItemsProcessed,TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];
    }
}