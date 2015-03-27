class Authorization < ActiveRecord::Base

  validates :email, presence: true
  validates :name, presence: true
  validates :invited_by, presence: true
  validates :role, presence: true

end
