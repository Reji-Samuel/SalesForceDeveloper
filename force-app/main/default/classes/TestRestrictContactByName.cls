@isTest private class TestRestrictContactByName {
    @isTest static void validContact(){
      Contact contact_1=new Contact(LastName='Samuel');
        insert contact_1;
    }
    @isTest static void InvalidContact(){
        Contact contact_2=new Contact(LastName='INVALIDNAME');
        insert contact_2;
    }
}