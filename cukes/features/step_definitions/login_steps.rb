Given(/^I'm on the home page$/) do
  visit "/"
end

Then(/^I should see a login prompt$/) do
  expect( page ).to have_css('#login')
end

When(/^I follow the login link$/) do
  @app.login.follow_login_link
end

When(/^I successfully authenticate$/) do
  @user = @app.isid.authenticate
end

Then(/^I should be on the home page$/) do
	expect(page.current_path).to eql("/") 
end

Then(/^I should be logged in$/) do
	expect( page ).to have_text(@user.gsub(".", " "))
end

