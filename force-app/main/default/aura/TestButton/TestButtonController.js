({
	handleClick : function(component, event, helper) {
		alert('I am goin to check');
        alert(component.get("v.recordId"));
        
        var RecId=component.get("v.recordId");
        var action=component.get('c.checkWebsite');
        action.setParams({
            "RID":RecId
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
               var responseValue=response.getReturnValue(); 
            	component.set('v.TheWebSite',responseValue);
                
                    alert(responseValue);
                
            }
            
        });
         $A.enqueueAction(action);
	}
})