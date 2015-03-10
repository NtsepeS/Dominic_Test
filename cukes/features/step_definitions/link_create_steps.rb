Given(/^I have a client "(.*?)"$/) do |client_name|
	FactoryGirl.create :client, :name => client_name
end

Given(/^I'm on the client links page$/) do
  visit "/client-links"
end

When(/^I create a new client link$/) do
  find('.add-client-link').click
end

When(/^I populate the Site Information as follows:$/) do |table|
  data = table.rows_hash

  select data['Client'], from: "client-select"
  fill_in 'branch-input', with: data['Branch']
end

When(/^I save the new client link$/) do
  find('.save').click
end

Then(/^a new client link titled "(.*?)" is created$/) do |title|
  visit "/client-links"
  expect( page ).to have_text(title)
end

# Then(/^the uri should match "(.*?)"$/) do |url|
#   expect(page.current_path).to eql(url) 
# end

# Then(/^I should see a Add Client Link button$/) do
#   expect( page ).to have_link("Add Client Link")
# end

# When(/^I click on the (.*?) button$/) do |button|
#   find(".#{button.parameterize}").click
# end

# When(/^I select "(.*?)" from "(.*?)"$/) do |option, select_box|
#   select(option, :from => "#{select_box.downcase}-select")
# end

# When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
#   fill_in field.downcase, :with => value 
# end

# When(/^Go to the (.*?) page$/) do |page|
#   visit "/#{page.parameterize}"
# end

# Then(/^I should see a client link titled "(.*?)"$/) do |title|
#   expect( page ).to have_text(title)
# end


