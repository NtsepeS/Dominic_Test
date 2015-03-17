class LoginPage < SitePrism::Page

  set_url "/login"

  element :login, "#login"

  def follow_login_link
    login.click
  end
end