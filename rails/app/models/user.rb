class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  def username
    ActiveSupport::Deprecation.warn("User#username is deprecated with no replacement", caller)
    ad_username ? ad_username : email.split("@")[0].downcase
  end

end
