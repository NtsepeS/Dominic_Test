@wip
Feature: revoke user access

Background: 
        Given I am an authorised administrator
        And   I have logged in

  	Scenario: An admin user can revoke user access
    	Given I am on the admin page
    	When  I click on the "<manage users>" button
    	And   I fill in the user's e-mail address
    	And   I check "<delete user>"
    	And   I see a message of "This user will no longer have access"
        And   I press the "<continue>" button
    	Then  I should not be able to see the user on the authorised list

    Scenario: Un-authorised user trying to access the system
    	Given I am on the log in page
        And   I fill in user name
        And   I enter a password
        When  I click "<continue>" button
    	Then  I should see a message of "you are not authorised to access the system, please contact the administrator"