public class TestUtilityClass {
    public static Case createCase(String caseStatus,String caseOrigin){
        
        Case caseRecord=new Case(
            Status=caseStatus,
            Origin=caseOrigin);
        return caseRecord;
    }
    
}