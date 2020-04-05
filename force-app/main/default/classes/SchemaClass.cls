public class SchemaClass {
    public static void schemaDetails(){
        Map<String,Schema.SObjectType>schemaMap=Schema.getGlobalDescribe();
        System.debug('The Map: '+schemaMap);
        Set<String>sobjSet=schemaMap.keySet();
        List<String>sobjList=new List<String>(sobjSet);
        sobjList.sort();
        System.debug('The sorted :'+sobjList);
        
        Schema.DescribeSObjectResult dsr=Schema.SObjectType.Account;
        System.debug('The describe results :'+dsr);
    }
}