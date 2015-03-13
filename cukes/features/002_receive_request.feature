Feature: 1.2 Support Vendor receives task
	As a Field Engineer
	I want to action a task that has been assigned to me
	So that the equipment will be installed for the client to use

Background: 
	Given I am a Field Engineer
	And   I have a mobile device with an active connection
	And   I am logged on
	And   I have tasks to action
	
	Scenario: Acknowledge request
		Given I have a new task assignment 
		When  I open the task
		Then  I should be able to view the task assignment