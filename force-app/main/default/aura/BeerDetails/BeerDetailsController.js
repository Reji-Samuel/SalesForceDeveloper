({
    onOrder: function(component, event, helper) {
        var navService = component.find("navService");
        
        var pageReferenceNav = {
            type: "standard__component",
            attributes: {
                componentName: "c__CreateBeerOrder"
            },
            state: {
                c__beerId: component.get("v.beerId")
            }
        };
        navService.navigate(pageReferenceNav);
    }
});