Feature: 13. Change user password
As a user
I want to change my password
So that i can log on

    Background: 
        Given I am logged into COPS
        And   I have a password to reset

        Scenario: An external user can re-set a password
        	Given I'm on the admin page
            When  I click on the change password button
            And   I fill in the user's e-mail address
            And   I press confirm
            Then  I should see a message of "Password has been reset"

        Scenario: User receives notification of password reset
            Given I have received a message of password has been reset
            And   I have a link to click on
            When  I click on the link
            And   I am taken to the password reset page
            And   I fill in my password
            Then  I should be allowed access