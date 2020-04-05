({
    validateForm: function(component, event, helper) {
        var isValid = component
        .find("bOrder")
        .reduce(function(validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            inputCmp.set("v.validity", { valid: false, badInput: true });
            return validSoFar && inputCmp.get("v.validity").valid;
        }, true);
        return isValid;
    },
    
    updateBeerQty: function(component, event, totalQnty, recordId) {
        var beerQnty = component.get("v.simpleRecord.Remaining_Quantity__c");
        var remainingQnty = parseInt(beerQnty) - parseInt(totalQnty);
        
        component.set("v.simpleRecord.Remaining_Quantity__c", remainingQnty);
        component.find("recordEditor").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                var navService = component.find("navService");
                var pageReferenceNav = {
                    type: "standard__component",
                    attributes: {
                        componentName: "c__OrderDetail"
                    },
                    state: {
                        c__orderId: recordId
                    }
                };
                navService.navigate(pageReferenceNav);
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log(
                    "Problem saving contact, error: " + JSON.stringify(saveResult.error)
                );
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    title: "Error While Placing Your Order.",
                    message: JSON.stringify(saveResult.error),
                    type: "success"
                });
                resultsToast.fire();
            } else {
                console.log(
                    "Unknown problem, state: " +
                    saveResult.state +
                    ", error: " +
                    JSON.stringify(saveResult.error)
                );
            }
        });
    }
});