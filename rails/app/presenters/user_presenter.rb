class UserPresenter < SimpleDelegator

  def as_json(*)
    {
      name: name,
      email: email,
      ad_username: ad_username,
      role: role
    }
  end
end