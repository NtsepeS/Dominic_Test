@wip
Feature: Users can login

    Scenario: A user can login
        Given I'm on the home page
        Then I should see a login prompt
        When I follow the login link
        And I successfully authenticate
        Then I should be on the home page
        And I should see ?
