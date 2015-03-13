@wip
Feature: export core nodes
	As an authorised administrator of COP's
    I need to generate a report

    Background: 
        Given I am a registered admin user
        And   I have logged in
        
        Scenario: Generate report
            Given I am on the '<core nodes>' page
            When  I click on the button '<Export>'
            Then  I should see the downloaded report with all the Core Nodes