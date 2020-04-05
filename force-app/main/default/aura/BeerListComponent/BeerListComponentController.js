({
    showInfo: function(component, event, helper) {
        var eventSource = event.getSource();
        var beerObj = eventSource.get("v.name");
        var bName = eventSource.get("v.value");
        
        component.set("v.beerId", beerObj);
        $A.createComponent(
            "c:BeerDetails",
            {
                beerId: beerObj,
                beerName: bName
            },
            function(beerDetails, status, errorMessage) {
                if (status === "SUCCESS") {
                    component.find("overLayLib").showCustomModal({
                        header: "Beer Details",
                        body: beerDetails,
                        footer: "Footer",
                        showCloseButton: true,
                        closeCallback: function() {}
                    });
                } else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline");
                } else if (status === "ERROR") {
                    console.log("Error:" + errorMessage);
                }
            }
        );
    },
    addToCart: function(component, event, helper) {
        var eventSource=event.getSource();
        var beerId=eventSource.get('v.name');
        var index=eventSource.get('v.value');
        var selectedBeer=component.get('v.recordList')[index];
        
        var addToCartEvent=component.getEvent('AddToCart');
        
        addToCartEvent.setParams({
            beerRecord:selectedBeer
        });
        
        addToCartEvent.fire();
        
    }
});