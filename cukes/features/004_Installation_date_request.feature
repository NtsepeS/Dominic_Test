Feature: 1.4 Installation Date Request
	As a Field Engineer
	I want to request an installation date from client
	so that i can gain access to the site to install the equipment

Background:
	Given I am signed in as a Field Services Engineer
	And   I have a task to action

	Scenario: I want to request installation date
		Given I am on the new task assignment
		When  I select "Request installation date" 
		Then  I should be able to send a request for a installation date
		
	Scenario: send message to client
		Given I have opened the task
		And   A message format opens
		Then  I should be able to type a message of my choice
		And   I should see a message "Installation date requested"

	Scenario: Confirmed installation date
		Given I have a confirmed installation date from the client
		And   I open the task assignment
		When  I clicked on "Date" in the calender
		Then  I should see a message "Date saved into calender" 

	Scenario: Confirm customer contact data
		Given I have the task open
		When  I fill in "Contact Person" with "Johnny McGee"
		And   I fill in "Contact telephone number" with "083 123 4567"
		And   I fill in "Street address" with "no. 1, Sesame Street"
		And   I click "Update contact data"
		Then  I should see a successful message stating "Contact updated"

	Scenario: Status Change
		Given I have updated the task with a date 
		When  I close the task assignment
		Then  the task status should change to 'Scheduled'
		