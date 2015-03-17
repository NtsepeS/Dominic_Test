class LoginPage < SitePrism::Page

  set_url "/login"

  element :login, "#login"

  def follow_login_link
    login.click
  end

  def login_as_user
    follow_login_link
    isid = ISIDPage.new
    isid.authenticate 
  end

end