Feature: Create client link

  Scenario: A user can create a new client link
    Given I'm on the client links page
    Then I should see a Add Client Link button
    When I click on the Add Client Link button
    Then the uri should match "/client-links/new"
    