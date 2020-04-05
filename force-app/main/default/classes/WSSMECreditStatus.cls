@RestResource(urlMapping='/AccountStatusupdate/')
global class WSSMECreditStatus {
    
    @HttpPost
    global static Response AccountStatusupdate(){
        
        RestRequest req = RestContext.request;
        RestResponse restRes = RestContext.response;
        Response res = new Response();
        //Getting Body from Request
        Map<String, Object> requestBodyParamsMap = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());
        
        //Always Required
        String accountId = req.headers.get('Account-ID');
         
        String creditStatus ;        
        try{
            
            creditStatus = (String) requestBodyParamsMap.get('creditStatus') != null ? (String) requestBodyParamsMap.get('creditStatus') : null;
            
            //Create Savepoint
            Savepoint sp = Database.setSavepoint();
            
            //Declare Objects 
            Account  account = [SELECT Id,name,Type FROM Account WHERE Id =:accountId];            
            account.Type = creditStatus;
            update account;
            
            res.accountData.add(account);
      
            return res;
        }
        catch (Exception e) {
            System.debug('Exception e is ='+e);
            res.errorCode = 'Line number= '+e.getLineNumber()+' Message is= ' +e.getmessage();
      
            return res;
        }          
        
    } 
}