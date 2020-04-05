({
    updateCart: function(component, event, helper) {
        var params = event.getParam("arguments");
        if (params) {
            var beerRecord = params.beerRecord;
            
            var existingRecords = component.get("v.recordList");
            if (existingRecords) {
                existingRecords.push(beerRecord);
                component.set("v.recordList", existingRecords);
            } else {
                existingRecords = [];
                existingRecords.push(beerRecord);
                component.set("v.recordList", existingRecords);
            }
        }
    }
});