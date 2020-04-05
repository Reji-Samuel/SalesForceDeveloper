({
	clickCreateItem : function(component, event, helper) {
		
        var validItem=component.find('campform').reduce(function(validSoFar,inputCmp){
           inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
        
        if(validItem){
         
            var Item = component.get("v.newItem"); 
            helper.createItem (component,Item);       

        }
	},
    
    doInit : function(component, event, helper) {
    var action=component.get("c.getItems");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var vItems=component.get("v.items");
                vItems=response.getReturnValue();
                component.set("v.items",vItems);
            }
        }); 
        $A.enqueueAction(action);
        
},
    handleAddItem : function(component, event, helper){
        var newCampingItem = event.getParam('item');

        var saveItemAction = component.get('c.saveItem');
        saveItemAction.setParams({ 'campingItem' :  newCampingItem });

        saveItemAction.setCallback(this, function(response){
            var respState = response.getState();
            console.log(respState);
            if( respState == 'SUCCESS'){
                var theItems = component.get("v.items");
                theItems.push(response.getReturnValue());
                component.set("v.items", theItems);
            }
        });

        $A.enqueueAction(saveItemAction);
    }

    

})