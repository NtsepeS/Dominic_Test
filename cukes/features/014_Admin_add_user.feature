@wip
Feature: 14. Add user to security group
	As a administrator
	I need to add an internal or external user to a security group
	So that they are able to view the correct detail in COPS
		
	Background: 
		Given I am logged in
		And   I am on the COPS admin page
		And   I can see a list of users
		
		Scenario: Add external user to security group
			Given I have a list of users
			And   I click on the user
			And   I click on the "user detail"
			And   I see a list of security groups that the use is assigned to
			When  I select a tick security group
			And   I click "save"
			Then  I should see a message "User has been added to the security group"

		Scenario: Add internal user to security group
			Given I have a list of users
			And   I click on the user
			And   I see a list of security groups
			When  I select a security group
			And   I click "save"
			Then  I should see a message "User has been added to the security group"	

		Scenario: Administrator deletes user from security group
			Given I have a list of users
			And   I select the user
			And   I click on the "user detail"
			And   I see a list of security groups that the user is subscribed to
			When  I select a security group
			And   I click "save"
			Then  I should be able to see a message "User removed from security group"
	


#view group or view user - system check



