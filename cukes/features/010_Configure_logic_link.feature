@wip
Feature: 1.10 Configure Logic Link
In order to configure logic link
As a IS Carrier Engineer
I need to input more details

	Background: Given the Field Engineer has completed the installation successfully
		And I have received the notification
		Then I can Configure Logic Link

	Scenario: Wireless Engineer Received notification
		Given I am on the task
		When I press "Configure"
		Then I Should be able to move to the next page

	Scenario: Configure Logic Link
		Given I have input the data into the work order
		When  I fill in the Serial Number
		And   I fill in the Circuit Number
		And   I fill in the Line Tag
		Then  I should be able to move to the next page

	Scenario: Update UniNMS system
		Given I am on the task
		And   I have filled in the Serial number
		And   I have filled in the Circuit number
		And   I have filled in the Line Tag
		When  I press "update"
		Then  I should receive a response "updated successfully"
	
	Scenario: Update Siebel system
		Given I am on the task
		And   I have filled in the Serial number
		And   I have filled in the Circuit number
		And   I have filled in the Line Tag
		When  I press "update"
		Then  I should receive a response "updated successfully"