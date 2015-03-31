@wip
Feature: 1.7 Upload ATP
	As a Field Engineer
	I want to upload the client sign off document

Background: 
	Given I have uploaded the site info
	And   the photographs have been uploaded
	Then  I should see a button"Client sign off"
	
	Scenario: upload client sign off
		Given I have a ATP document
		And   I click on the "upload" button
		Then  I should be able to upload