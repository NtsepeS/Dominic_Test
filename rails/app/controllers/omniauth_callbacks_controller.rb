class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    login = LoginService.new( User )
    login.call( request.env["omniauth.auth"] )

    if login.successful?
      sign_in_and_redirect login.user
      session["devise.user_info"] = request.env["omniauth.auth"]['info']

    else
      redirect_to "/login"

    end
  end

  alias_method :isoauth2, :all

end
