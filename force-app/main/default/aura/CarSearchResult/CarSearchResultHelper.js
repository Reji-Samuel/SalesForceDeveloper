({
	onSearch : function(component,helper) {
		helper.callServer(component,"c.getCars",
                          function(response){
                              if(response.length >0){
                                component.set("v.cars",response);  
                                component.set("v.carFound",true);    
                              }
                              else{
                                  component.set("v.carFound",false);  
                              }
                          },{
                              carTypeId:component.get("v.carTypeIdComponent")
                              
                          });
        
	},
        doSearch : function(component,event,helper){
      var params=event.getParam('arguments'); 
        
        if (params){
         component.set("v.carTypeIdComponent",params.carTypeId); 
     	 helper.onSearch(component,helper);
        }
    },
    
    frameSelectedCar : function(component,event,helper){
  	component.set("v.selectedCarId",event.getParam("carId"));
 	}

})