class UserPresenter < SimpleDelegator
  def initialize(user)
    super user
  end

  def as_json(*)
    {
      name: name,
      email: email,
      ad_username: ad_username,
      role: role
    }
  end
end