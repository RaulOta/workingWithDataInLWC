@isTest
public with sharing class ContactControllerTest {

    @isTest
    private static void getAllContacts() {
        //Load test data
        List<Contact> lstContacts = new List<Contact>();
        for(Integer i = 0; i < 30; i++){
            lstContacts.add(new Contact(
                LastName = 'Test '+i,
                FirstName = 'Setup',
                Email = i+'test@gm.com'
            ));
        }
        insert lstContacts;

        // Perform test
        List<Contact> lstResultContacts = ContactController.getContacts();

        // Check the result
        System.assertEquals(30, lstResultContacts.size(), 'The Contacts are not correct');
    }

    @isTest
    private static void getContactsBornAfterBirthData(){
        // Load test data
        List<Contact> lstContacts = new List<Contact>();
        for (Integer i = 0; i < 20; i++) {
            Contact contact = new Contact();
            if (i < 12) {
                contact.Birthdate = Date.today();
            }else {
                contact.Birthdate = Date.today()+2;
            }
            contact.LastName = 'Test' + i;
            contact.Title = 'Title test';
            contact.Email = i+'test@gm.com';
            contact.Phone = '9841150241';
            lstContacts.add(contact);
        }
        insert lstContacts;
        Date birthDate = Date.today()+1;

        // Perform test
        List<Contact> lstContactTest = ContactController.getContactsBornAfter(birthDate);

        // Check the result
        System.assertEquals(8, lstContactTest.size(), 'The date is not correct');
    }

    /*@isTest
    private static void getAllContactsWithException() {
        //Load test data
        List<Contact> lstContacts = new List<Contact>();
        for(Integer i = 0; i < 30; i++){
            lstContacts.add(new Contact(
                LastName = 'Test '+i,
                FirstName = 'Setup',
                Email = i+'test@gm.com'
            ));
        }
        insert lstContacts;

        try {
            // Perform test
            List<Contact> lstResultContacts = ContactController.getContacts();
            // Siempre colocar al final de la invocación del método una assert que falle en 
            // caso de que alguien borre la invocación de la excepción, si no se coloca siempre va a 
            // marcar correcto como esta dentro del try catch nunca va a entrar, ya con el assert nos damos cuenta si se modifico.
            System.assert(false, 'The method did not throw an exception');

        } catch (Exception error) {
            // Check the result
            System.assert(error.getMessage().contains('Script-thrown exception'), error.getMessage());
        }
    }*/
}