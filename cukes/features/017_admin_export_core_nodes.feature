@wip
Feature: 17. export core nodes
	As an authorised COPS administrator
    I need to generate a core node report

    Background: 
        Given I am a registered admin user
        And   I have logged in
        
        Scenario: Generate report
            Given I am on the core nodes page
            When  I click on the "export" button
            Then  I should see the downloaded report with all the Core Nodes