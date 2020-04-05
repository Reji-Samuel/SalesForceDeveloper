({
	doInit : function(component, event, helper) {
        var options=[];
		var action=component.get("c.ActiveCaseStatus");
        action.setCallback(this,function(response){
           var state=response.getState();
            if(state==="SUCCESS"){
                var stringItems=response.getReturnValue();
                stringItems.forEach(function(element){
                  options.push({value:element,label:element});   
                });
                
               component.set("v.Coptions",options); 
                
            }
        });
        $A.enqueueAction(action);
    
	}
})