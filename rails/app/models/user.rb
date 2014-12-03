class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  class << self
    def from_omniauth auth
      user = where(provider: auth.provider, uid: auth.uid).first_or_initialize do |new_user|
        new_user.provider = auth.provider
        new_user.uid = auth.uid
      end

      user.name = auth.info.name
      user.email = auth.info.email
      auth.info.aliases.each do |provider_alias|
        user.ad_username = provider_alias.provider_id if provider_alias.provider == 'ddad'
      end

      user.update_role

      user.save

      user
    end

  end

    def update_role!
      update_role && save
    end

    def update_role
      self.role = determine_role
    end

    def determine_role
      return :admin if groups.include? "IS.OPT_Admin" or groups.include? "IS.System Integrators"
    end

    def username
      @username ||= ad_username ? ad_username : email.split("@")[0].downcase
    end

    def groups
      return @groups if defined? @groups

      @groups = []

      begin
        response = RestClient.get "#{Rails.application.secrets.SIAUTH_URL}/users/#{username}/groups", {apiKey: Rails.application.secrets.SIAUTH_KEY, content_type: "application/json"}
        json = Oj.load(response)
        @groups = json["groups"].map { |this_group| this_group['ad_group']  }
      rescue RestClient::InternalServerError => e
      end

      @groups #.tap { |g| puts "user_groups", g }
    end

end