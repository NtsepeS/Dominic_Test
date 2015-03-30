@wip
Feature: 19. Block user access
    As a user who is a member of the administrator security group
    I want to revoke a users access
    So that they are unable to access COPS

    Background: 
        Given I am an authorised COPS administrator
        And   I have logged in

  	     Scenario: An admin user can block user access
    	   Given I am on the admin page
    	   When  I click on the "manage users" button
    	   And   I select the user from their security group
    	   And   I check "disable user"
    	   And   I see a message of "The user account has been blocked"
            And  I press the "save" button
    	   Then  I should see the user as having disabled status on the authorised list
            And  The user's account will be locked

        Scenario: An admin user can unblock user access
           Given I am on the admin page
           When  I click on the "manage users" button
           And   I select the user from their security group
           And   I check "enable user"
           And   I see a message of "The user account has been enabled"
            And  I press the "save" button
           Then  I should see the user as having access status on the authorised list