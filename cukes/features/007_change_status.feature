@wip
Feature: Change status
    As a Field Engineer
    I have completed the installation on site

    Background: 
    Given the Field Engineer has completed the installation sucessfully
    And the Field Engineer has submitted the required information

    Scenario: Change status to complete
        Given the IS Field Engineer has completed the installation
        And has sucessfully uploaded the information
        Then the status changes to "Installed"