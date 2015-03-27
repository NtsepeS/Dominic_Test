@wip
Feature: 23.Update or add data Core Node Information
	As a member of the COPS admin security group
    I need to update or add a core node
    So that the Core Node can be found in COPS
        
    	Background: 
		Given I am logged into COPs
    	And   I am authorised to add a new item to the system
    	
  		Scenario: Add Core Node only if i am a COPS member or a member of an admin security group
    		Given I'm on the core node page
            And   I am an administrator or have rights to change COPS
    		When  I click on the add core node button
    		And   I fill in "<site information>"
            | <Core Node> | <Latitude> | <Longitude> |   <Height>  |  <Status>   |
            And   I press "save"
            Then  I should see a message of "Core node added"

        Scenario: A admin user or a member of a security group can Update a Core Node
            Given I'm on the core node page
            And   I am an administrator of COPS
            And   I am a member of an admin security group
            When  I click on the update core node button
            And   I click on the core node name
            And   I fill in "<site information>"
            | <Core Node> | <Latitude> | <Longitude> |   <Height>  |  <Status>   |
            And  I press "save"
            Then  I should see a message of "Core Node updated"

        Scenario: Incomplete information for Add or Update a Core Node
            Given I'm on the core node page
            And   I am an administrator of COPS
            And   I am a member of an admin security group
            When  I click on the update core node button
            And   I do not fill in "<site information>"
            | <Core Node> | <Latitude> | <Longitude> |   <Height>  |  <Status>   |
            And  I press "save"
            Then I should see a message of "Information incomplete"
            And  I press "ok" button
            And  I am able to input the fields

        Scenario: Delete Core Node
            Given I'm on the core node page
            And   I am a COPS administrator
            When  I click on "delete core node" button
            And   I click on the core node name
            And   I fill in "<site information>"
            | <Core Node> | <Latitude> | <Longitude> |   <Height>  |  <Status>   |
            When  I press c"save"
            Then  I should see a message of "Delete Core Node"
            And   I press "ok"
            And   I should not be able to see the Core Node

        Scenario: Change the Status of a Core Node
            Given I am on the core node page
            And   I am a COPS administrator
            When  I click on "update status" button
            And   I click on the core node name
            And   I fill in "<site information>"
            |  <Status>   |
            When  I press "save"
            Then  I should see a message of "Status updated"
            And   I press "ok"
            And   I should see the updated status