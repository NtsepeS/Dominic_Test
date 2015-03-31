Given(/^I( am|'m) on the client links page$/) do |_|
  @app.client_links.load
end

When(/^I create a new client link$/) do
  @app.client_links.new_client_link
end

And(/^I should see a list of all client links$/) do
  pending # express the regexp above with the code you wish you had
end