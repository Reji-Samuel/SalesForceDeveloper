({
    clickCreateItem: function(component, event, helper) {

        // Simplistic error checking
        var validItem = true;
        validItem = component.find('campform').reduce(function(validSoFar, inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if(validItem){
            helper.createItem(component);
        }
    }
})