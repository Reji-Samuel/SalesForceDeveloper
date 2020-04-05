public class RestExplorerSampleWrapper {

    public class CaseDetails {
		public String Status {get;set;} 
		public String CaseOrigin {get;set;} 
		public String Priority {get;set;} 

		public CaseDetails(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Status') {
							Status = parser.getText();
						} else if (text == 'CaseOrigin') {
							CaseOrigin = parser.getText();
						} else if (text == 'Priority') {
							Priority = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'CaseDetails consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
            System.debug('The Priority :'+Priority);
		}
	}
	
	public CaseDetails CaseDetails {get;set;} 
	public WebInfo WebInfo {get;set;} 

	public RestExplorerSampleWrapper(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'CaseDetails') {
						CaseDetails = new CaseDetails(parser);
					} else if (text == 'WebInfo') {
						WebInfo = new WebInfo(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'ParseCaseDetails consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class WebInfo {
		public String WebMail {get;set;} 
		public String WebCompany {get;set;} 

		public WebInfo(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'WebMail') {
							WebMail = parser.getText();
						} else if (text == 'WebCompany') {
							WebCompany = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'WebInfo consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
        
	}
	
	
	public static RestExplorerSampleWrapper parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new RestExplorerSampleWrapper(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
 
}