@wip
Feature: 12 Export data
    In order to extract data into a format that can be manipulated
    As an authorised administrator of COP's
    I need view COP's data

    Background: 
        Given I am a registered admin user
        And   I have logged in

        Scenario: Generate report
            Given I have selected '<Client Links>'
            When  I click on the button '<Export>'
            Then  I should see the report download

        Scenario: Report downloaded
            Given I have downloaded the report
            When  I press "<View Report>"
            Then  I should see the report in an excel format with the following fields
                | Vendor                             | Plessy                   |
                | Base Station Sector                |                          |
                | Base Station Unit                  |                          | 
                | Client                             | Adcorp                   |
                | Date Start                         | calendar                 |
                | Date finish                        | calendar                 |
    
       # | email address                    | graham.dalbrook@is.co.za |
       # | Save report                      | Desktop                  |
       # | Subscribe to re-occuring report  | Weekly                   |
       # | UnSubscribe to re-occuring report| report name              |