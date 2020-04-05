public class GoogleAPIWebService {
public String returnTimeZoneFromLead(String LeadID){
        Lead[] LeadRecord =[SELECT Address,Name,Country,State from Lead where ID=:LeadID];
String formatStreet,formatCity,URL;
String latitude,longitude,tZone,tZoneID;
String API_KEY='AIzaSyDyOBZset31Ag2WYxA__A4nKppnFbNFk1Y';

for(Lead ldrec:LeadRecord){
    Address addr=ldrec.Address;
    String State=ldrec.State;
	String  Country=addr.getCountry();
    System.debug('The Country :'+Country);
    System.debug('The State :' +State);
    if (Country=='USA'){
        URL='https://maps.googleapis.com/maps/api/geocode/json'
	+ '?address='+State
    +'%20'        
    +Country
	+'&key='+API_KEY;
        System.debug(URL);
    }
    else{
   String Street=addr.getStreet();
  formatStreet=Street.replace(' ','+');

  String City=addr.getCity();
  formatCity=City.replace(' ','+');
 
  URL='https://maps.googleapis.com/maps/api/geocode/json'
	+ '?address='+formatStreet
  	+',+'+
    +formatCity
	+'&key='+API_KEY;
        
    }
}

Http http = new Http();
HttpRequest request = new HttpRequest();

System.debug(URL);
request.setEndpoint(URL);
request.setMethod('GET');
HttpResponse response = http.send(request);
Integer responseCode=response.getStatusCode();
System.debug(responseCode);
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
JSONParser parser=JSON.createParser(response.getBody());
  //  System.debug(response.getBody());
while(parser.nextToken()!=null){
        if((parser.getCurrentToken()==JSONToken.FIELD_NAME) && (parser.getText()=='location')){
            parser.nextToken();
            parser.nextToken();
            parser.nextToken();
            latitude=parser.getText();
            parser.nextValue();
            longitude=parser.getText();
        }
    }
}
System.debug('Latitude :'+latitude);
System.debug('Longitude :'+longitude);
    
Http http_timez = new Http();
HttpRequest request_timez = new HttpRequest();

String timeStamp='1478880000';
//String API_KEY='AIzaSyDyOBZset31Ag2WYxA__A4nKppnFbNFk1Y';

String URL_timez='https://maps.googleapis.com/maps/api/timezone/json'
    +'?location='+latitude+'%20'+longitude
    + '&timestamp='+timeStamp
    + '&key='+API_KEY;
System.debug(URL_timez);

request_timez.setEndpoint(URL_timez);
request_timez.setMethod('GET');
HttpResponse response_timez = http.send(request_timez);
Integer responseCode_timez=response_timez.getStatusCode();
System.debug(responseCode_timez);
// If the request is successful, parse the JSON response.
if (response_timez.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response_timez.getBody());
    if(results.ContainsKey('timeZoneName')){
        System.debug('Irukku');
      	tZone= String.valueof(results.get('timeZoneName'));
		Integer DST=Integer.valueOf(results.get('dstOffset'));
        System.debug('DST :'+DST);
        Integer UTCOffset=Integer.valueOf(results.get('rawOffset'));
        System.debug('UTCOffset: '+UTCOffset);
		Datetime now = Datetime.now();
        
		now=now.addSeconds(UTCOffset+DST);
        System.debug('The Time Zone is  :'+tZone+ ' & the local Time :' +now);
    }
    else
    {
      System.debug('Illa');  
    }
    
}
    return tZone;
}
}