@isTest
public with sharing class AccountControllerTest {
    @isTest
    private static void getAllAccouts() {
        //Load test data
        List<Account> lstAccounts = new List<Account>();
        for(Integer i = 0;i < 20; i++)
        {
            lstAccounts.add(new Account(
                Name = 'Test '+i,
                AnnualRevenue = 50000,
                Industry = 'Education'
            ));
        }
        insert lstAccounts;

        //Perform Test
        List<Account> accounts = AccountController.getAccounts();

        //Check the result
        System.assertEquals(20, accounts.size(), 'The accounts is not correct');   
    }
}