Feature: 1.1 Carry out logic check and assign to vendor
	As a Carrier Operations Engineer
	I want to be able to check the task assignment
	so that it can be assigned to the support Vendor to action the new request

Background:
	Given I am signed in as an IS Engineer
	And there are work orders to process

	Scenario: Logic check is successful
		Given I am on the new work order page
		And   I open the first work order
		When  I run the logic check
		And   I approve the work order
		Then  I should see a work order approval message
		And   A work order approval should be sent to the field services engineer

	Scenario: Logic check is unsuccessful
		Given I am on the new work order page
		And   I open the first work order
		When  I run the logic check
		And   I reject the work order with a message of "Rejected due to bad data"
		Then  I should see a work order rejection message

	Scenario: Assigning a Support Vendor
		Given I have opened the new work order
		And   I use the drop down list to select the Support Vendor
		When  I fill in the Support Vendor
		Then  I have selected the vendor

	Scenario: Assigning a Base station unit 
		Given I have opened the work order
		And   I use the drop down list view the base station units
		When  I fill in the base station unit
		Then  Then I should see "task assigned"