FactoryGirl.define do
  factory :user do
    name "Test Guy"
    sequence(:email) { |i| "test#{i}@example.com" }
    provider "isoauth2"
    sequence(:uid) { |i| "flsadhglskdhgalf#{i}" }
    ad_username "test.guy"
  end
end