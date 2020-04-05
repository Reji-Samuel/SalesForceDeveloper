({
    handleClick: function(component, event, helper) {
        //	alert('Click recieved');
        component.set("v.isOpen", true);
    },
    cancel: function(component, event, helper) {
        component.set("v.isOpen", false);
    },
    recordUpdated:function(component, event, helper){
     var pos=[];
        var caseStatus=component.get("v.cStatus");
        if (caseStatus=="New"){
            pos=[false,true,true];
           component.set("v.Coptions",pos) ;
        }
        else if (caseStatus=="Working"){
            pos=[true,false,true];
           component.set("v.Coptions",pos) ;
        }
           else {
            pos=[true,true,false];
           component.set("v.Coptions",pos) ;
        }
        
     /*   var recordId = component.get("v.recordId");
        var action2=component.get("c.getcaseStatus");
        action2.setParams({
            caseId:recordId
        });
        action2.setCallback(this,function(response){
            var state = response.getState();
            var strgetReturnValue=response.getReturnValue();
            if(state==='SUCCESS'){
                component.set("v.Coptions",strgetReturnValue);
            }
        });
        $A.enqueueAction(action2);*/
    },
    Save: function(component, event, helper) {
        var saveText = component.get("v.textValue");
        var recordId = component.get("v.recordId");
        //  alert("save Text recieved :" + saveText + " for recordId: " + recordId);
        var action = component.get("c.saveCaseComment");
        action.setParams({
            caseId: recordId,
            comment: saveText
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var responseValue = response.getReturnValue();
                
                component.set("v.isOpen", false);
                $A.get("e.force:refreshView").fire();
                
                var successToast = $A.get("e.force:showToast");
                successToast.setParams({
                    title: "Comments.",
                    message: "The message will be sent to availity.",
                    type: "success"
                });
                successToast.fire();
            } else {
                var failureToast = $A.get("e.force:showToast");
                failureToast.setParams({
                    title: "Comments.",
                    message: "Technical issue, kindly re send.",
                    type: "error"
                });
                failureToast.fire();
            }
        });
        $A.enqueueAction(action);
    }
});