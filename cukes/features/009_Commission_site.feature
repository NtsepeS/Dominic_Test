@wip
Feature: 1.9 Commission Site
In order to commission site
As a IS Carrier Engineer
I need to record the performance

Background: 
    Given the Field Engineer has completed the installation
    And   I have received a notification
    And   I have opened the task assignment

	Scenario: Wireless Engineer commissions site
		Given I am on "task" page
		When I check "Record RF performance"
		And  I receive the RF performance results
		Then I should be able to move to the next page
