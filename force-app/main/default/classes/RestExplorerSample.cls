@RestResource(urlMapping='/RestExplorerSample/')
global with sharing class RestExplorerSample {
    @HttpPost
    global static void doPost(){
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String strRequestBody=req.requestBody.toString();
        System.debug('The recieved payLoad: '+strRequestBody);
        RestExplorerSampleWrapper holder= RestExplorerSampleWrapper.parse(strRequestBody);
		
        Case nc=new Case();
        nc.Status=holder.CaseDetails.Status;
        nc.Origin=holder.CaseDetails.CaseOrigin;
        nc.Priority=holder.CaseDetails.Priority;
        nc.SuppliedCompany=holder.WebInfo.WebCompany;
        nc.SuppliedEmail=holder.WebInfo.WebMail;
        insert nc;
        System.debug('The new Case Id :'+nc.Id);
    }
    
}