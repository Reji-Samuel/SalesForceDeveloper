public class StringArrayTest {

    public static String[] generateStringArray(Integer retNum){
        List<String> newList=new List<String>();
        for(Integer i=0;i<retNum;i++){
            newList.add('Test '+i);
            System.debug(newList[i]);
           
        }
       return  newList;
    } 
}