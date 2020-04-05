({
	doInit : function(component, event, helper) {
	var action= component.get('c.getContactList');
        action.setParams({
            accountId:component.get('v.recordId'),
        });
       
        action.setCallback(this,function(response){
            var responseValue=response.getReturnValue();
            component.set('v.conList',responseValue);
        }); 
      $A.enqueueAction(action,false)  ;
	},
    
    doReDirect : function(component, event, helper) {
    var eventSource=event.getSource();
    var id= eventSource.get('v.name');  
    var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": id,
      "slideDevName": "detail"
    });
    navEvt.fire();
    }
})