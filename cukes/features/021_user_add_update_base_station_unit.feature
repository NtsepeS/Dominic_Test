@wip
Feature: 21. Update or add data
	As an authorised COPS user
    I need to update or add a Base Station Unit
        
    	Background: 
		Given I am logged into COPs
    	And   I am authorised to add a new item to the system
    	
  		Scenario: An user can add a Base Station Unit
    	    Given I am on the base station unit page
    	    When  I click on the add base station unit button
    		And   I fill in "<information>"
              | Client              | Adcorp                |
              | Branch              | Happy Branch          |
              | Network Operator    | Internet Solutions    |
    		And   I And I press confirm
    		Then  I should see a message of "Base station unit added"	

        Scenario: A Field services partner can add a base station unit
            Given I have entered "Field Service Partner"
            And   I am on the add sector page
            When  I click on the "Add base station unit" button
            And   I view only the base stations for my FS partner type
            And   I view and fill in "<Base station unit>"
                | <Base station name> |
                | <edit> |
            Then  I press "save"
            And   I should see a message of "base station unit added"

        Scenario: An user can update Base Station Unit
            Given I am on the base station unit page
            When  I click on the "update base station unit" button
            And   I fill in "<Base station unit>"
                | <Base station name> |
                |  <edit>   | 
            And   I press "save"
            Then  I should see a message of "Base station unit updated"   
    		
        Scenario: A user can add base station (any user)
            Given I'm on the base station page
            When  I click on the "add base station" button
            And   I fill in "<base station unit>"
                | <Base station name> |
                | <edit> |
            And   I press "save"
            Then  I should see a message of "base station added"
    
        Scenario: Administration update a Base station unit status or parameter change
            Given I'm on the base station page
            When  I click on the "update base station unit" button
            And   I fill in "<base station unit>"
                | <Base station name> |
                | <edit> |
            And   I press "save"
            Then  I should see a message of "base station unit updated"

        Scenario: Administrator delete a base station unit
            Given I'm on the base station unit page
            When  I click on the "delete base station unit" button
            Then  I should see a message "do you want to delete this base station unit"
            And   I press "save" button
            And   I press "cancel" button