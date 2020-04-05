({
	 carInFrameSelected: function(component, event, helper) {
		component.set("v.Id",event.getParam("car").Id);
        component.find("service").reloadRecord();
	},

    onCarExpAdded: function(component, event, helper){
    component.set("v.tabId","carexp");
    component.find("carExpid").refresh();
},
    onRecordUpdated: function(component, event, helper){
        
    }
})