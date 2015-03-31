@wip
Feature: Unauthroised user log on

Background: 
        Given I am on the home page of COPs
        And   I can see the log in page
  	
    Scenario: Un-authorised user trying to access the system
    	Given I am on the log in page
        And   I fill in user name
        And   I enter a password
        When  I click "<continue>" button
    	Then  I should see a message of "you are not authorised to access the system, please contact the administrator"