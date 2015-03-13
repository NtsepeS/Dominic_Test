Feature: 1.11 Quality Assurance
	In order to check the completeness of the task
	As an approver
	I need approve the task information

Background: 
	Given I am logged in
	And   I have received the notification of a completed task
	And   I open the task
	
	Scenario: Successful Quality check
		Given I am on the task
		When I check "Approved"
		Then I should see a message of "Approved"

	Scenario: Unsuccessful Quality check
		Given I am on the task
		When I check "Decline"
		Then I should be able to send a message of "Declined due to bad or incomplete data"

	Scenario: Notification of unsuccessful quality check
		Given I have received a "Declined due to bad or incomplete data" notification
		When  I open the task
		And   I click "view message"
		Then  I should be able to see the message