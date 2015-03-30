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
		And   the photograph is saved
		When  I click on "upload"
		Then  The photograph is uploaded

	Scenario: Delete photograph
		Given I have selected the type of photograph
		And   I take a photograph
		And   the photograph is not suitable to upload
		When  I click on "delete"
		And   the photograph is deleted
		Then  I Should be able selected the type of photograph

Background:
	Given  I have selected the "upload photograph" button
	And    I have selected the type of photograph

	Scenario: Take photograph using photo icon button
		Given I have selected the type of photograph
		When  I press the photograph icon button
		And   I take the photo
		Then  I should be see the photograph uploaded directly into the folder
