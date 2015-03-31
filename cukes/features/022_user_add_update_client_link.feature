@wip
Feature: 022.Update or add data Clink Link
  As a user of COPS 
  I need to update or add a Client Link
  So that the system has updated information
        
    Background: 
    Given I am logged into COPs
            
      Scenario: An COPS user can add a client link #(any role)
        Given I am on the client links page
        And   I should see a list of all client links
        When  I click on the "Add Client Link" button
        And   I view and fill in "<information>"
        And   I view and fill in <Status>:
        | <Status>|
        | <View>  |
        And   I view and fill in <Contact Details>:
        | <Contact person> | <Contact #> |  <Street Address>  |
        | <Edit>           | <Edit>      |  <Edit>            |
        And   I view and fill in <Antenna Location>:
        | <Lattitude>| <Longitude> |  <Altitude (AGL)> |  <Anntenna Size> |
        | <Edit>     | <edit>      |  <edit>           |  <edit>          |
        And   I view and fill in <Core Node>:
        | <Core Node> | <Base Station> | <Sector> | <RSSI value> |
        | <View>      | <View>         |  <View>  | <view>       |
        And   I view and fill in <RF>:
        | <RF Frequency> | <TX frequency> | <Polarity> | <IFL Cable lenght> |
        | <View>         | <View>         |  <View>    | <view>             |
        And   I view and fill in <Serial Number>:
        | <MSAD> | <Radio> | <Antenna> | 
        | <View> | <edit>  |  <edit>   |
        And   I view and fill in <IS Asset Tag>:
        | <MSAD> | <Radio> | <Antenna> | 
        | <View> | <edit>  |  <edit>   |
        And   I press "save"
        Then  I should see a message of "Client link created"

      Scenario: A Field services partner can add a client link
        Given I have entered "Field Service Partner"
        And   I am on the add client links page
        When  I click on the "Add Client Link" button
        And   I view only the client links for my FS partner type
        And   I view and fill in "<information>"
        And   I view and fill in <Status>:
        | <Status>|
        | <View>  |
        And   I view and fill in <Contact Details>:
        | <Contact person> | <Contact #> |  <Street Address>  |
        | <Edit>           | <Edit>      |  <Edit>            |
        And   I view and fill in <Antenna Location>:
        | <Lattitude>| <Longitude> |  <Altitude (AGL)> |  <Anntenna Size> |
        | <Edit>     | <edit>      |  <edit>           |  <edit>          |
        And   I view and fill in <Core Node>:
        | <Core Node> | <Base Station> | <Sector> | <RSSI value> |
        | <View>      | <View>         |  <View>  | <view>       |
        And   I view and fill in <RF>:
        | <RF Frequency> | <TX frequency> | <Polarity> | <IFL Cable lenght> |
        | <View>         | <View>         |  <View>    | <view>             |
        And   I view and fill in <Serial Number>:
        | <MSAD> | <Radio> | <Antenna> | 
        | <View> | <edit>  |  <edit>   |
        And   I view and fill in <IS Asset Tag>:
        | <MSAD> | <Radio> | <Antenna> | 
        | <View> | <edit>  |  <edit>   |
        And   I press "save"
        Then  I should see a message of "Client link created"

      Scenario: A user can update a client link (any role)
        Given I am on the client links page
        When  I click on the "Update Client Link" button
        And   I fill in "<information>"
        And   I view and fill in <Status>:
        | <Status>|
        | <View>  |
        And   I view and fill in <Contact Details>:
        | <Contact person> | <Contact #> |  <Street Address>  |
        | <Edit>           | <Edit>      |  <Edit>            |
        And   I view and fill in <Antenna Location>:
        | <Lattitude>| <Longitude> |  <Altitude (AGL)> |  <Anntenna Size> |
        | <Edit>     | <edit>      |  <edit>           |  <edit>          |
        And   I view and fill in <Core Node>:
        | <Core Node> | <Base Station> | <Sector> | <RSSI value> |
        | <View>      | <View>         |  <View>  | <view>       |
        And   I view and fill in <RF>:
        | <RF Frequency> | <TX frequency> | <Polarity> | <IFL Cable lenght> |
        | <View>         | <View>         |  <View>    | <view>             |
        And   I view and fill in <Serial Number>:
        | <MSAD> | <Radio> | <Antenna> | 
        | <View> | <edit>  |  <edit>   |
        And   I view and fill in <IS Asset Tag>:
        | <MSAD> | <Radio> | <Antenna> | 
        | <View> | <edit>  |  <edit>   |
        And   I press "save"
        Then  I should see a message of "Client link updated"

      Scenario: A administrator can delete a client link
        Given I am on the client links page
        And   I see a list of all client links
        And   I select the client link
        When  I click on the "Delete Client Link" button
        Then  I should see a message "do you want to delete this link"
        And   I select "save" button
        And   I select "cancel" button