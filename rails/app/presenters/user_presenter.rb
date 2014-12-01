class UserPresenter < SimpleDelegator
  def initialize(user)
    super user
  end

  def as_json(*)
    {
      name: name,
      email: email,
    }
  end
end