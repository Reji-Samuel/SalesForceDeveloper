trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
List<Task> newTask=new List<Task>();
    for(Opportunity opp:Trigger.new){
        if(Trigger.isInsert || Trigger.isUpdate){
            if(opp.StageName=='Closed Won'){
                newTask.add(new Task(Subject='Follow Up Test Task',WhatId=opp.Id));
            }
        }
    }
    if (newTask.size()>0){
        insert newTask;
    }
}