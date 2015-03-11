@wip
Feature: 1.9 Commission Site
As a IS Carrier Engineer
I have received a notification that the site installation has been completed

Background: 
    Given the Field Engineer has completed the installation successfully
	And   I have received at notification
	And   I have opened the task assignment

	Scenario: Wireless Engineer commissions site
		Given I 
		When  I open the work order
		Then  I am able to start commissioning the site

	Scenario: Record RF Performance
		Given I have input the data into the work order
		And   I have the RF performance results
		When  the results are acceptable 
		Then  I am able to move to the next page