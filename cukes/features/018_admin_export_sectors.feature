@wip
Feature: 18. export base station unit
	As an authorised COPS administrator
    I need to generate a base station unit report
    
	Background: 
        Given I am a registered admin user
        And   I have logged in

        Scenario: Generate report
            Given I am on the base station unit page
            When  I click on the "export" button
            Then  I should see the downloaded report with all the Base Station Units