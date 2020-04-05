({
	doInit : function(component, event, helper) {
		helper.onInit(component, event, helper);
	},
    onRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED"){
            var changedFields = eventParams.changedFields;
            console.log('Field that are changed: '+JSON.stringify(changedFields));
            helper.showToast(component, event, helper,{
                	"title" : "Saved",
                    "type" : "error!",
                    "message" : "The record was updated"
            });
        } else if (eventParams.changeType === "LOADED"){
            
        }else if (eventParams.changeType === "REMOVED"){
            
        }else if (eventParams.changeType === "ERROR"){
            
        }
},
    onSave:function(component, event, helper) {
        component.set("v.carExperience.Car__c",component.get("v.car.Id")); 
        component.find("service").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state === "SUCCESS" || saveResult.state ==="DRAFT"){
                var resultsToast = $A.get("e.force:showToast");
                if(resultsToast){
                    resultsToast.setParams({
                        "title" : "Saved",
                        "message" : "Car Experience Added"
                    }); 
                    resultsToast.fire();
                }
                
                else
                {
                    alert('Car Experience Added');
                }
                helper.onInit(component, event, helper);
                var evt=component.getEvent("carExpAdded");
                evt.fire();
            }
            else if (saveResult.state === "INCOMPLETE"){
                helper.showToast(component, event, helper,{
                    "title" : "ERROR!",
                    "type" : "error!",
                    "message" : "Device does not support draft"
                });
                console.log('User is offline,device does not support drafts');
            }
                else if (saveResult.state === "ERROR"){
                    helper.showToast(component, event, helper,{
                    "title" : "ERROR!",
                    "type" : "error!",
                    "message" : "Problem saving record"
                });
                console.log('Problem saving record' + JSON.stringify(saveResult.error));
                }
                else {
                       helper.showToast(component, event, helper,{
                    "title" : "ERROR!",
                    "type" : "error!",
                    "message" : "Device does not support draft"
                }); 
                    console.log('UnKnown problem' + saveResult.state + ',error: ' + JSON.stringify(saveResult.error));
                    }
        }));
}
})