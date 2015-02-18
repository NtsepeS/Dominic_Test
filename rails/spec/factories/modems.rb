FactoryGirl.define do
  factory :modem do
    sequence(:name) { |n| "modem-#{n}" }
  end

  factory :modem_with_equipment, parent: :modem do
    after(:create) { |modem| create(:equipment, equipped: modem) }
  end
end
