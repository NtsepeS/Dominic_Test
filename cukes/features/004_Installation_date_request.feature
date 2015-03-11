@wip
Feature: 1.4 Request Installation date from client
	As a field services engineer
	I want to request an installation date from client
	so that i can schedule a date to install the equipment

Background:
	Given I am signed in as a Field Services Engineer
	And   I have a task to action

	Scenario: Request installation date from Client
		Given I am on the task assignment
		And   I select "Request installation date" 
		And   I have a message format
		When  I type a message of my own choice
		And   I press "send"
		Then  I should see a message "Installation date request sent"

	Scenario: Confirmed installation date
		Given I have a confirmed installation date from the client
		And   I open the task assignment
		When  I fill in the "Calendar" with "Date"
		And   I press "Save"
		Then  I should see a message "Date saved" 

	Scenario: Status Change
		Given I have updated the task with an installation date
		When  I press "update status"
		Then  the status should change to "Scheduled"

	Scenario: Confirm or input customer contact data
		Given I have the task open
		When  I fill in "Contact Person" with "Johnny McGee"
		And   I fill in "Contact telephone number" with "083 123 4567"
		And   I fill in "Street address" with "no. 1, Sesame Street"
		And   I click "Update contact data"
		Then  I should see a successful message stating "Contact updated"