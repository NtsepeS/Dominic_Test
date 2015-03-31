@wip
Feature: 15. export sector
	As an authorised COPS administrator
    I need to generate a sector report
    
	Background: 
        Given I am a registered admin user
        And   I have logged in

        Scenario: Generate report
            Given I am on the sector page
            When  I click on the "export" button
            Then  I should see the downloaded report with all the sectors