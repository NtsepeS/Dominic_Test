class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    login = LoginService.new( User )
    login.call( request.env["omniauth.auth"] )

    if login.successful?
      ensure_user_in_workflow(login.user)
      sign_in_and_redirect login.user
      session["devise.user_info"] = request.env["omniauth.auth"]['info']
    else
      redirect_to "/login"
    end
  end

  alias_method :isoauth2, :all

  private

  def ensure_user_in_workflow(user)
    workflow = WorkflowService.new
    workflow.add_user(
      user_id: user.ad_username,
      first_name: user.name,
      last_name: user.name,
      email: user.email,
      role: user.role,
      password: user.uid[0,20]
    )
  end
end
