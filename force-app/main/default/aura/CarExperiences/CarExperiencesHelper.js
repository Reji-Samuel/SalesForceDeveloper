({
	onInit : function(component, event, helper) {
        helper.callServer(component,"c.getCarExperience",function(response){
            if(response){
               component.set("v.carExperiences",response);
            }
            else{
              console.log("Error Getting car experiences") ; 
            }
        },{
            carId : component.get("v.car").Id
        });
	}
})