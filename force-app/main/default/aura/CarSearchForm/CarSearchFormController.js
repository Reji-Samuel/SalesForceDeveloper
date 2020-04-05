({
	onClickSearch : function(component, event, helper) {
		helper.helperMethodSearchButton(component, event, helper);
	},
    theSelectedType : function(component, event, helper) {
		helper.helperMethodSelectedButton(component, event, helper);
	},
   createNewRecord: function(component, event, helper) {
        var createCarRecord=$A.get("e.force:createRecord");
        createCarRecord.setParams({
            "entityApiName": "Car_Type__c"
             
        });
        createCarRecord.fire();
	},
    doInit: function(component, event, helper) {
     helper.getCarType(component,helper);
        var createNewCarRecord=$A.get("e.force:createRecord");
        if(createNewCarRecord){
            component.set("v.showNew",true);
        }
        else {
           component.set("v.showNew",false); 
        }
	}
   
})