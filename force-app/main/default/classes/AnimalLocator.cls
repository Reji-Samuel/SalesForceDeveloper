public class AnimalLocator {
    public static String getAnimalNameById(Integer AnimalId){
       /*Http request*/
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+AnimalId);
        req.setMethod('GET');
        /*Http response*/
        Http httpParam=new Http();
        Httpresponse resp=httpParam.send(req);
        String responseStr='';
        
        if(resp.getStatusCode()==200){
            Map<String,Object> resultJSON=(Map<String,Object>)JSON.deserializeUntyped(resp.getBody());
            Map<String,Object> animals=(Map<String,Object>)resultJSON.get('animal');
            responseStr=string.valueOf(animals.get('name'));
        }
        else{
            System.debug('Invalid statusCode: '+resp.getStatusCode());
            System.debug('Invalid Status: '+resp.getStatus());
        }
        return responseStr;
    }
}