({
	helperMethodSearchButton : function(component, event, helper) {
        var searchFormSubmit=component.getEvent("searchFormEvent");
        searchFormSubmit.setParams({
            "carTypeId" : component.find("carTypeList").get("v.value")
        });
        searchFormSubmit.fire();
	},
    helperMethodSelectedButton: function(component, event, helper) {
     
	},
    getCarType: function(component,helper){
       /* Written Genric as a Base Helper
        var action=component.get("c.getcarTypes");
        action.setCallback(this,function(data){
            var state=data.getState();
            if (state==="SUCCESS"){
                component.set("v.carType",data.getReturnValue());
            } else if (state==="ERROR"){
                alert('UnKnown Error');
            }
        });
        $A.enqueueAction(action);*/
        helper.callServer(component,"c.getcarTypes",
                          function(response){
                             component.set("v.carType",response);
                          });
                          
    }
    
})