class LoginService < BaseService

  attr_reader :user

  def initialize( scope )
    super()
    @scope = scope
  end

  def call( auth_hash )
    @auth = auth_hash

    run do
      find_user
      update_user
      set_user_role
      save_user
    end
  end

  private

  attr_reader :auth, :scope

  def find_user
    if auth.provider.nil? || auth.uid.nil?
      throw :abort
    end

    @user = scope.where(provider: auth.provider, uid: auth.uid).first_or_initialize
  end

  def update_user
    user.name  = auth.info.name
    user.email = auth.info.email

    ad_provider = auth.info.aliases.detect { |provider_alias|
      provider_alias.provider == 'ddad'
    }

    if ad_provider.present?
      user.ad_username = ad_provider.provider_id
    end
  end

  def set_user_role
    if groups.any? { |g| /IS\.System Integrators/ =~ g }
      user.role = :admin
    end
  end

  def save_user
    user.save
  end

  def groups
    return @groups if defined? @groups

    @groups = []

    begin
      response = RestClient.get "#{Rails.application.secrets.SIAUTH_URL}/users/#{user.username}/groups", {apiKey: Rails.application.secrets.SIAUTH_KEY, content_type: "application/json"}
      json = Oj.load(response)
      @groups = json["groups"].map { |this_group| this_group['ad_group']  }
    rescue RestClient::InternalServerError => e
    end

    @groups #.tap { |g| puts "user_groups", g }
  end

end
