Feature: Create client link

  Scenario: A user can create a new client link
    Given I have a client "Adcorp"
    And I'm on the client links page
    Then I should see a Add Client Link button
    When I click on the Add Client Link button
    Then the uri should match "/client-links/new"
    When I select "Adcorp" from "Client"
    And I fill in "Branch Name" with "Happy Branch"
    And I click on the Save button
    And Go to the client links page
    Then I should see a client link titled "Adcorp - Happy Branch"
