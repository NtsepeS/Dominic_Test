FactoryGirl.define do
  factory :picture do
    mechanism "MyString"
    picture_data "MyString"
    date_taken "2001-02-03T04:05:06+07:00"
    album nil
  end
end
