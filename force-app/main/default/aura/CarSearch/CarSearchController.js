({
	doFormSubmit : function(component, event, helper) {
        
	var carTypeIdFromChoice=event.getParam("carTypeId");
    var carSearchResultComp= component.find("carSearchResult");
    var carSearchCmpResult=carSearchResultComp.searchCars(carTypeIdFromChoice);
      
	}
})