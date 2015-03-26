FactoryGirl.define do
  factory :authorization do
    email "joe@mailinator.com"
    name "Joe"
    invite_id "MyString"
    invited_by "Justin"
    role "staff"
  end
end
