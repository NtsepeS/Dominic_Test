class OmniauthUserService

  def initialize user, auth_hash
    @user = user
    @auth = auth_hash
  end

  def call
    set_user_attributes
    user.update_role
    user.save
    user
  end

  private

  attr_reader :user, :auth

  def set_user_attributes
    user.provider = auth.provider
    user.uid = auth.uid

    user.name = auth.info.name
    user.email = auth.info.email
    auth.info.aliases.each do |provider_alias|
      user.ad_username = provider_alias.provider_id if provider_alias.provider == 'ddad'
    end
  end
end