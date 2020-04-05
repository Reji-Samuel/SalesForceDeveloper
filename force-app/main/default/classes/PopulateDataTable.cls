public with sharing class PopulateDataTable {
	@AuraEnabled
	public static List<Case> returnCase() {
		return [SELECT Id, CaseNumber, Status, Priority FROM Case LIMIT 10];
	}

}