@wip
Feature: 25. Capacity Request
	In order to obtain the capacity information
	As a user
	So that I can quote a client correctly

	Background:
		Given I am logged in
		And I want to quote a customer
		And I want to know the capacity

		Scenario: Request Capacity
			Given I am logged in
			And   I click on "Wi-band Xtend request - new item"
			And   I click on "<Client Information>"
			And   I fill in "<Point to Point wireless capacity request form>"
				| <Client Name> | <Branch> | <Work Order Number> | <Bandwidth> | <Request Date> |
			And   I click on "attach documentation"
			And   I fill in the "due by date"
			When  I press "Submit"
			Then  I should be see a message "Your request has been sent"	
		
		Scenario: Incomplete Capacity Request
			Given I am logged in
			And   I click on "Wi-band Xtend request - new item"
			And   I click on "<Client Information>"
			And   I do not fill in fields "<Point to Point wireless capacity request form>"
				| <Client Name> | <Branch> | <Work Order Number> | <Bandwidth> | <Request Date> |
			And   I do not click "attach documentation"
			When  I press "Submit"
			Then  I should be see a message "Your request is incomplete, please resubmit"

		Scenario: COPS receives capacity request
			Given I am logged in
			When  I click on "View capacity requests"
			And   I select "<all items>"
				| <Approved> | <Declined> | <Requested> |  <Under investigation>  |
			And   I click on "Requested"
			Then  I should be able to see a list of requests

		Scenario: User actions capacity request
	   		Given I can see a list of requests
	   		And   I click on a request
	   		And   I fill in "<Update input parameters>"
			| <Client> | <Requested by>| <request logged> | <Work order number> | <Bandwidth> | <Wiband standard> | <attached files> |
			|  <View>  |  <view>       |  <view>          | <view>              | <view>      | <edit>            | <view>           |
			And   I fill in "<Node Analysis>"
			| <Core Node 1> | <Result> | <Core Node 2> | <Result> | <Core Node 3> | <Result> | <Core Node 4> |
			|  <View>       |  <edit>  |  <view>       | <edit>   | <view>        | <edit>   | <view>        |
			And  I fill in "<Conclusion>"
			| <Status> | 
			| <select> |
			When  I press "Submit"
			Then  I should see a message "Request has been submitted"