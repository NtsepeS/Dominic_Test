Scenario: Field Services Partner installaiton is complete
	Given I have completed the steps aboce
	And   I have entered the Antenna co-ordinates 
	And   I have entered the MAC address
	When  I have updated the work order
	Then  The status is updated to "In Progress"

Scenario: Installation preping is incomplete
	Given I have completed the preping requirements
	And   I have not entered the Antenna co-ordinates 
	And   I have not entered the MAC address
	When  I update the work order a message displays "Incomplete*
	Then  I should not be able to move to the next page

Scenario: Installation notification sent to COP's
	Given the Field services Partner has changed the status to "In Progress"
	When  I have exited the work order
	Then  a mail notification is sent to IS Wireless Engineer with the updated status

Scenario: Wireless Engineer commissions site
	Given The feild services parter has closed the work order
	When  I open the work order
	Then  I am able to start commissioning the site