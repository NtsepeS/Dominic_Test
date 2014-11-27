class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  class << self
    def from_omniauth auth
      user = where(provider: auth.provider, uid: auth.uid).first_or_create do |new_user|
        new_user.provider = auth.provider
        new_user.uid = auth.uid
      end

      update_user_info user, auth
      user
    end

  private

    def update_user_info user, auth
      user.name = auth.info.name
      user.email = auth.info.email

      # auth.info.aliases.each do |provider_alias|
      #   user.ad_username = provider_alias.provider_id if provider_alias.provider == 'ddad'
      # end
      user.save
    end
  end
end