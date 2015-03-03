Feature: Receive acknowledgment of request from Field Engineer
	As an IS Field Engineer
	I want to receive an acknowledgement from the Field Engineer

Background:
	Given I am signed in as a Feild Services Engineer
	And   I have received an e-mail to action a new work order

	Scenario: Feild Services Engineer receives work order notification
		Given I am on the new work order page
		When  I open the first work order
		Then  I should see a work order to action
	
	Scenario: Feild Services Engineer acknowledges the work order notification
		Given I am on the new work order page
		When  I open the first work order
		Then  I should see a work order