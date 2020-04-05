//Class to search car Types
public with sharing class CarTypeSearch {
@AuraEnabled
    public static List<Car_Type__c> getcarTypes(){
        return [SELECT Id,Name from Car_Type__c];
    }
}