Feature: Create client link

  Background:
    Given I have a client "Adcorp"

  Scenario: I can create a new client link
    Given I'm on the client links page
    When I create a new client link
    And I populate the Site Information as follows:
      | Client              | Adcorp                |
      | Branch              | Happy Branch          | 
      | Network Operator    | Internet Solutions    |
    And I save the new client link
    Then a new client link titled "Happy Branch" is created
