({
    goToCart : function(component, event, helper) {
        
        var action=component.get('c.getCartId');
        action.setParams({
            beerList:component.get('v.beerNameList')
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            var cartId=response.getReturnValue();
        
            if(state==='SUCCESS' || state==='DRAFT'){
                var pageReference=component.find("navigation");
                var pageReferenceNav={
                    "type":"standard__component",
                    "attributes":{
                        "componentName":"c__CartDetail"
                    },
                    "state":{
                        "c__cartId":response.getReturnValue()
                    }
                };
                
                pageReference.navigate(pageReferenceNav,true);
                
            }else if(state==='INCOMPLETE'){
                
            }
                else if (state==='ERROR'){
                    var errors=response.getError();
                    if(errors || errors[0].pageMessage){
                        console.log('Page Error'+errors[0].pageMessage);
                    }
                }
                    else{
                        
                    }
            
        });
        $A.enqueueAction(action);
    },
    createCartItems:function(component, event, helper){
        // console.log('Selected Beer'+component.get('v.recordList'))
        var names=[];
        for(var i=0;i<component.get('v.recordList').length;i++){
            names.push(component.get('v.recordList')[i].Id);
            
        }
        component.set('v.beerNameList',names);
    }
})