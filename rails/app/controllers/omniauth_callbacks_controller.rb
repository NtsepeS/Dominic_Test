class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
      session["devise.user_info"] = request.env["omniauth.auth"]['info'] unless request.env["omniauth.auth"]['info'] == nil
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :isoauth2, :all
end
