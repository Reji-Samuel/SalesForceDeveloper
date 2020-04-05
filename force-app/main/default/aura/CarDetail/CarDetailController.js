({
	doInit : function(component, event, helper) {
        var navEvt=$A.get("e.force:navigateToSObject");
        if(navEvt){
          component.set("v.showCardAction",true);  
        }
        else{
          component.set("v.showCardAction",false);    
        }
	},
    onFullDetails : function(component, event, helper) {
       var ObjFullDetails=$A.get("e.force:navigateToSObject");
        if(ObjFullDetails){
            ObjFullDetails.setParams({
                "recordId":component.get("v.car").Id,
                "slideDevName":"detail"
            }); 
            ObjFullDetails.fire();
        }
        else{
           console.log("'e.force:navigateToSObject' is not supported in this context");
            helper.showToast(component,{
                "title":"Error",
                "type":"error",
                "message":"Event not supported"
            });
        }
    }
    
    })