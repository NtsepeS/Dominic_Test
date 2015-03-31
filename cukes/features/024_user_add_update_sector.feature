@wip
Feature: 24. Update or add data for Sector
	As an authorised COPS user
    I need to update or add a Sector
    So that the system has updated information
        
    Background: 
		Given I am logged into COPs
    	And   I am authorised to add a new item
    	
  		Scenario: A user can add Sector (any user)
    		Given I'm on the sector page
    		When  I click on the "add sector" button
    		And   I fill in "<information>"
    			| <sector> |
    			| <select> |
    		And   I And I press "save"
    		Then  I should see a message of "Sector added"
    		 
    	Scenario: A Field services partner can add a sector
       		Given I have entered "Field Service Partner"
        	And   I am on the add sector page
        	When  I click on the "Add sector" button
        	And   I view only the sectors for my FS partner type
        	And   I view and fill in "<information>"
    			| <sector> |
    			| <select> |
        	Then  I press "save"
        	And   I should see a message of "sector added"

    	Scenario: Administrator updates a Sector with a status change or parameter change
    		Given I'm on the sector page
    		When  I click on the "update sector" button
    		And   I fill in "<status>"
    			| <Being Built>  |  <decommissioned> | <Operational> | <Under Construction> |
    		And   I press "save"
    		Then  I should see a message of "Sector updated"

		Scenario: Administrator delete a sector
    		Given I'm on the sector page
    		And   I select a sector
    		When  I click on the "delete sector" button
    		Then  I should see a message "do you want to delete this link"
    		And   I press "save" button
    		And   I press "cancel" button