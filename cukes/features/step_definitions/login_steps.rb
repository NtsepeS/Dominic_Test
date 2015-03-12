Given(/^I'm on the home page$/) do
  visit "/"
end

Then(/^I should see a login prompt$/) do
  p page.body
  expect( page ).to have_css('.login-box')
end

When(/^I follow the login link$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I successfully authenticate$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the home page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see \?$/) do
  pending # express the regexp above with the code you wish you had
end

