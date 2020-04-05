({
    doInit: function(component, event, helper) {
        var pageReference = component.get("v.pageReference");
        if (pageReference) {
            var state = pageReference.state;
            if (state.c__cartId) {
                //  component.set('v.cartItemList',state.cartId);
                //
                var action = component.get("c.getCartItems");
                action.setParams({
                    'CartId':state.c__cartId
                });
                action.setCallback(this, function(response) {
                    var stateResponse=response.getState();
                    if (stateResponse === "SUCCESS" || stateResponse === "DRAFT") {
                        var resultData=response.getReturnValue();
                        var items=[];
                        for(var key in resultData ){
                          items.push(resultData[key]) ; 
                        }
                        component.set('v.cartItemList',items);
                    } else if (stateResponse === "INCOMPLETE") {
                    } else if (stateResponse === "ERROR") {
                        var errors = response.getError();
                        if (errors || errors[0].pageMessage) {
                            console.log("Page Error" + errors[0].pageMessage);
                        }
                    } else {
                    }
                });
                $A.enqueueAction(action);
            } else {
                component.set("v.cartItemList", []);
            }
        }
    },
    homePage: function(component, event, helper) {
        var pageReference = component.find("navigation");
        var pageReferenceNav = {
            type: "standard__navItemPage",
            attributes: {
                apiName: "Beer_Explorer__c"
            }
        };
        pageReference.navigate(pageReferenceNav, true);
    }
});