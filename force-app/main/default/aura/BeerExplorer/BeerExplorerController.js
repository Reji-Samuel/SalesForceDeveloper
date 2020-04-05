({
    handleCompEvent: function(component, event, helper) {
        var searchParam = event.getParam("searchText");
        var action = component.get("c.searchBeer");
        action.setParams({
            searchParam: searchParam
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var responseValue = response.getReturnValue();
                
                component.set("v.beerList", responseValue);
            }
        });
        $A.enqueueAction(action);
    },
    updateCart: function(component, event, helper) {
        var params = event.getParam("beerRecord");
        
        var HeaderComp = component.find("HeaderComp");
        
        HeaderComp.updateCart(params);
    }
});