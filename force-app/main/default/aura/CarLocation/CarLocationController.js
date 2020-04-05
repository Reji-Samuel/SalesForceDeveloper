({
	jsLoaded : function(component) {
		component.set("v.jsLoaded", true);
	},
    loadMap : function(component, event, helper){
     var car = event.getParam('car');
     var latitude = car.Geolocation__Latitude__s; 
     var longitude = car.Geolocation__Longitude__s; 
        component.set("v.location", {'lat' : latitude, 'long' : longitude});   
  }
})