class ISIDPage < SitePrism::Page

  element :username_input, "#username"
  element :password_input, "#password"
  element :provider_select, "#provider"
  element :sign_in, ".btn-primary"

  def authenticate(username="Justin.Naidu")
  	username_input.set(username)
  	password_input.set("123Boom!")
  	provider_select.select("Fake IS Staff")
  	sign_in.click
  	return username
  end
end