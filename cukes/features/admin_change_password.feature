Feature: change user password

  	Scenario: An admin user can change a user password
    	Given I'm on the admin page
    	When  I click on the "<change a password>" button
    	And   I fill in the user's e-mail address
    	And   I press "<confirm>"
    	And   I see a message of "<address changed>"
    	Then  A message is sent to the user of "Password has been changed to"

    Scenario: User receives notification of password change
    	Given I have received message that my password has been changed
    	When  I open cops
    	And   I fill in my password
    	Then  I should be allowed access

    Scenario: An admin user can re-set a password
    	Given I'm on the admin page
        When  I click on the "<change a password>" button
        And   I fill in the user's e-mail address
        And   I check "<reset password>"
        And   I press "<confirm>"
        Then  I should see a message of "Password has been reset"