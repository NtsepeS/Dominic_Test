@wip
Feature: 1.6 Uploading photographs
As a Field Engineer
I want to take and upload the site photographs

Background: 
	Given I have input the installation data required
	And   I the status of the installation is "in Progress"
	Then  I Should see a button "upload photographs"
	
	Scenario: Take photographs
		Given I am on the photograph page 
		And   I tick the "<checkbox>" of the photograph to upload
		Then  the checkbox for the photograph is ticked

	Scenario: Upload photograph
		Given I have selected the type of photograph
		And   I have taken a photograph
		And   the photograph is acceptable quality
		When  I click on "upload"
		Then  The photograph is uploaded

	Scenario: Delete photograph
		Given I have selected the type of photograph
		And   I take a photograph
		And   the photograph is not of acceptable quality
		When  I click on "delete"
		Then  I Should be able to take another photograph