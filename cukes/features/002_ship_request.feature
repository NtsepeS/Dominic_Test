@wip
Feature: 1.2 Ship request to Support Vendor
	As a Field Engineer
	I want to action a request 
	So that the task can be completed

Background: 
	Given I am a Field Engineer
	And   I have a mobile device with an active connection
	And   I am logged on
	And   I have tasks to action
	
	Scenario: Acknowledge request
		Given I have a new task assignment 
		When  I open the task
		Then  I should be able to view the task assignment

	Scenario: No request to acknowledge
		Given I am on the task assignment 
		When  I do not have a task
		Then  I should be not be able to view new tasks