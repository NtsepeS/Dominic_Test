Feature: Receive acknowledgment of request from Field services engineer
	As an IS Wireless Engineer
	I want to receive an acknowledgment from the Field services engineer
	So that the COPs system is update with the status

Background:
	Given I have assigned a task to the Field Services parter
	And   I have completed the logic check
	And   I have assigned a task

	Scenario: IS Wireless Engineer receives notification
		Given I am logged on to the system
		When  I receive a notification from the field services partner
		Then  the task assignment status should update