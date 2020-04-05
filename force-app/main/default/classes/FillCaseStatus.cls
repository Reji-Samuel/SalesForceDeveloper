public class FillCaseStatus {
@AuraEnabled
    public static List<String> ActiveCaseStatus(){
        List<String>cStatus=new List<String>();
     
      Schema.DescribeFieldResult fieldResult=Case.Status.getDescribe();
        List<Schema.PicklistEntry>ple=fieldResult.getPicklistValues();
        for(Schema.PicklistEntry fld:ple){
            cStatus.add(fld.getValue());
        }
        return cStatus;
        
    }
}