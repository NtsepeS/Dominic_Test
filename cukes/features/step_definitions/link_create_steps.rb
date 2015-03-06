Given(/^I'm on the client links page$/) do
  visit "/client-links"
end

Then(/^I should see a Add Client Link button$/) do
  expect( page ).to have_link("Add Client Link")
end

When(/^I click on the Add Client Link button$/) do
  find_link("Add Client Link").click
end

Then(/^the uri should match "(.*?)"$/) do |url|
  expect(page.current_path).to eql(url) 
end