@wip
Feature: export client links
	As an authorised administrator of COP's
    I need to generate a report
    
As an authorised administrator of COP's
    I need view COP's data

    Background: 
        Given I am a registered admin user
        And   I have logged in
        
        Scenario: Generate report
            Given I am on the '<client link>' page
            When  I click on the button '<Export>'
            Then  I should see the downloaded report with all the client links