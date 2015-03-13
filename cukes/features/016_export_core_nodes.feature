As an authorised administrator of COP's
    I need view COP's data

    Background: 
        Given I am a registered admin user
        And   I have logged in
        And   I 

        Scenario: Generate report
            Given I have selected '<Core Node>'
            When  I click on the button '<Export>'
            Then  I should see the download report

        Scenario: Report downloaded
            Given I have the downloaded report
            When  I click on the report name "<report>"
            Then  I should see the report in an excel format with the following fields

                | Core Node     |                   |
                | Title         |                   |
                | Cluster       |                   | 
                | Status        |                   |
    
       # | email address                    | graham.dalbrook@is.co.za |
       # | Save report                      | Desktop                  |
       # | Subscribe to re-occuring report  | Weekly                   |
       # | UnSubscribe to re-occuring report| report name              |

        Scenario: Receive report
            Given I am on Report criteria selection page
            And (
            When I (when?)
            Then I (then?)
