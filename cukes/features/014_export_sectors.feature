@wip
Feature: As an authorised administrator of COP's
    I need view COP's data

    Background: 
        Given I am a registered admin user
        And   I have logged in
        And   I 

        Scenario: Generate report
            Given I have selected '<sectors>'
            When  I click on the button '<Export>'
            Then  I should see the download report

        Scenario: Report downloaded
            Given I have the downloaded report
            When  I click on the report name "<report>"
            Then  I should see the report in an excel format with the following fields

                | Title             |                   |
                | Sector            |                   |
                | Sector Latitude   |                   | 
                | Sector Longitude  |                   |