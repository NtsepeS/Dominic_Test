Feature: Delete client link

  Scenario: An admin user can delete a new client link
    Given I'm on the client links page
    When  I click on the delete Client Link button
    Then  I should see a message of "are you sure you want to delete"

   Scenario: Confirm delete
     Given I have a message "are you sure you want to delete"
     When  I press then "<Yes>" button
     Then  I should not be able to see the client link

   Scenario:  declind delete
     Given I have a message "are you sure you want to delete"
     When  I press the "<No>" button
     Then  I should still see the client link