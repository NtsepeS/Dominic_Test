FactoryGirl.define do
  factory :chassis do
  end

  factory :chassis_with_equipment, parent: :chassis do
    after(:create) { |chassis| create(:equipment, equipped: chassis) }
  end

  factory :chassis_with_container, parent: :chassis do
    after(:create) { |chassis| create(:container, containable: chassis) }
  end

  factory :chassis_with_container_and_equipment, parent: :chassis do
    after(:create) do |chassis|
      create(:equipment, equipped: chassis)
      create(:container, containable: chassis)
      chassis.container.equipment << chassis.equipment
    end
  end
end
