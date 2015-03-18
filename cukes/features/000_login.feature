@wip
Feature: 0.0 Login to COPS
	In order to start using COPS
	As a user
	I need to log in to COPS

	Scenario: Log in as engineer
		Given I am not logged in
		  And I am on the login page
		 When I fill in 'User name' with 'Graham Dalbock'
		  And I fill in 'Password' with 'foobar'
		  And I select 'Fake IS User' from 'Provider'
		  And I click on 'Sign In'
		 Then I should see 'Successfully logged in'
		  And I should see 'Log out'

	Scenario: Log in as a Field Services Engineer
		Given I am not logged in
		  And I am on the login page
		 When I fill in 'User name' with 'Some Other Dude'
		  And I fill in 'Password' with 'foobar'
		  And I select 'Fake IS User' from 'Provider'
		  And I click on 'Sign In'
		 Then I should see 'Successfully logged in'
		  And I should see 'Log out'

	Scenario: Logout of COPS
		Given I am logged in
		  And I can see "logout"
		 When I click on "logout"
		 Then I should see 'Successfully logged out'
		  And I should see 'Log in'