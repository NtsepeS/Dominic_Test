@wip
Feature: 1.5 Carry out installation
    As a Field Engineer
    I want to carry out the installation on the scheduled date
    So that the client can use the service

    Background: 
        Given The Field Engineer is logged in
        And   I have a task assigned

    Scenario: Confirm customer contact data
        Given I am on the task assignment page
        When  I fill in "Contact Person" with "Johnny McGee"
        And   I fill in "Contact telephone number" with "083 123 4567"
        And   I fill in "Street address" with "no. 1, Sesame Street"
        And   I click "Update contact data"
        Then  I should see a successful message stating "Contact updated"

    Scenario: Record Physical Installation data
        Given I have filled in the customer contact data
        When  I press  the "installation details" button
        Then  I should be on "Installation"

    Scenario: Record Physical Installation data
        Given I have filled in the customer contact data
        When  I have filled in the Antenna Height
        And   I have filled in the Longitude
        And   I have filled in the Latitude
        And   I have filled in the MAC address
        And   I have filled in the RSSI downlink value
        And   I press the "update" button
        Then  I should see a message of "In Progress"

    Scenario: Physical Installation is incomplete
        Given I have filled in the customer contact data
        And   I have not filled in the installation information
        When  I press the "update" button
        Then  I should see a message of "Incomplete"