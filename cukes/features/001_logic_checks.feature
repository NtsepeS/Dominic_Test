

Feature: 1.1 Log onto the Carrier Operations System
	As a Carrier Operations Engineer
	I want to be able to view the work order request
	so that i can assign it to the Support Vendor to action the new request

Background:
	Given I am signed in as an IS Engineer
	And there are work orders to process

	Scenario: Logic check is successful
		Given I am on the new work order page
		And   I open the first work order
		When  I run the work order logic check
		And   I approve the work order
		Then  I should see a work order approval message
		And   a work order approval mail should be sent to the field services engineer

	Scenario: Logic check is unsuccessful
		Given I am on the new work order page
		And   I open the first work order
		When  I run the logic check
		And   I reject the work order with a message of "Rejected due to bad data"
		Then  I should see a work order rejection message

	Scenario: Assigning a Support Vendor
		Given I have opened the new work order
		And I use the drop down list to select the Support Vendor
		And I click on one Support Vendor
		Then I have selected the vender

	Scenario: Assigning a Base station unit to the installation request, based on the area and installation location of the nearest BSU
		Given I have opened the work order
		And I use the drop down list view the BSU's
		And I select the BSU
		Then I have selected the BSU