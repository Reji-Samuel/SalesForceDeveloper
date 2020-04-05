public class BeerSearchAuraService {
@AuraEnabled
    public static List<sObject> searchBeer(string searchParam){
        String LikeParam='%'+ searchParam + '%';
        String Query='';
        if(searchParam !=null){
           Query='SELECT Id,Name,Alcohol__c,Brewery_Id__c,Brewery_Name__c,Id__c,Price__c,Tags__c,Image__c,Total_Quantity__c,Remaining_Quantity__c from Beer__c where Name like :LikeParam LIMIT 50'; 
        }
        else {
          Query='SELECT Id,Name,Alcohol__c,Brewery_Id__c,Brewery_Name__c,Id__c,Price__c,Tags__c,Image__c,Total_Quantity__c,Remaining_Quantity__c from Beer__c LIMIT 50';  
        }
        
        List<sObject>sObjectList=Database.query(Query);
        return sObjectList;
    }
}