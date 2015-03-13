Feature: 1.8 Change status
	As a Field Engineer
	I have completed the installation on site

Background: 
	Given I have filled in the installation information
	And   I have uploaded the photographs
	And   I have uploaded the sign off

	Scenario: Change status to complete
		Given I am on the task
		And I press "update"
		Then I should see "status updated" to "installed"