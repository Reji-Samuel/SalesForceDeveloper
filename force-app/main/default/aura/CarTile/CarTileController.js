({
	onCarClick : function(component, event, helper) {
        var car=component.get("v.car");
		var selectedCar=component.getEvent("onCarSelect");
        selectedCar.setParams({"carId":car.Id});
        selectedCar.fire();
        
        var appEvent=$A.get("e.c:CarSelectedApplicationEvent");
        if(appEvent){
            appEvent.setParams({"car":car,});
            appEvent.fire();
        }
        else{
            
        }
	}
})