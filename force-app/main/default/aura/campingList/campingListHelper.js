({
	createItem : function(component,Item) {
		var action=component.get("c.saveItem");
                    action.setParams({
                "item":Item
            });
            action.setCallback(this,function(response){
                 var state = response.getState();
                
                if(state==="SUCCESS"){
                    var newItems=component.get("v.items");
                    newItems.push(response.getReturnValue());
                    component.set("v.items",newItems);
                }
            });
                $A.enqueueAction(action);          
       
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                   'Price__c': 0,'Packed__c': false });
        
	}
})