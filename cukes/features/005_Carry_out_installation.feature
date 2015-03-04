Feature: 1.5 Carry out installation
As a Field Engineer
I want to carry out the installation on the scheduled date

	Background: 
		Given The Field Engineer logged in
		And   I have a task assignment

	Scenario: Confirm customer contact data
		Given I have carried out the physical installation
		When  I fill in "Contact Person" with "Johnny McGee"
		And   I fill in "Contact telephone number" with "083 123 4567"
		And   I fill in "Street address" with "no. 1, Sesame Street"
		And   I click "Update contact data"
		Then  I should see a successful message stating "Contact updated"

	Scenario: Record Physical Installation data
		Given I have filled in the customer contact data
		And   I have filled in the Antenna Height
		And   I have filled in the Longitude
		And   I have filled in the Latitude
		And   I have filled in the MAC address
		And   I have filled in the RSSI downlink value
		When  I update the task
		And   the status is updated to "In Progress"
		Then  I should see a successful message

	Scenario: Physical Installation is incomplete
		Given I have filled in the customer contact data
		When  I have not filled in the information
		Then  I update the task assignment and a message displays "Incomplete"