@wip
Feature: Update or add data
	As an authorised administrator of COP's
    I need to update or add a Client Link
    And i need to update or add a Sector
    And i need to update or add a Base Station Unit
    And i need to update or add a Core node
    
    	Backgroud: 
		Given I am logged into COPs
    	And   I am authorised to add a new item to the system
    	
  		Scenario: An admin user can update or add a client link
    		Given I'm on the client links page
    		When  I click on the Update Client Link button
    		And   I fill in information
    		And   I And I press "<Confirm>"
    		Then  I should see a message of "Client link updated"

    	Scenario: An admin user can update or add Sector
    		Given I'm on the sector page
    		When  I click on the Update sector button
    		And   I fill in information
    		And   I And I press "<Confirm>"
    		Then  I should see a message of "Sector updated"

    	Scenario: An admin user can update or add Base Station Unit
    		Given I'm on the base station unit page
    		When  I click on the update base station unit button
    		And   I fill in information
    		And   I And I press "<Confirm>"
    		Then  I should see a message of "base station unit updated"		

    		Scenario: An admin user can update or add Core Node
    		Given I'm on the core node page
    		When  I click on the Update core node button
    		And   I fill in information
    		And   I And I press "<Confirm>"
    		Then  I should see a message of "Core node updated"