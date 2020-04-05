({
	handleClick : function(component, event, helper) {
    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
      "url": "/lightning/o/Beer__c"
    });
    urlEvent.fire();    
    }
})