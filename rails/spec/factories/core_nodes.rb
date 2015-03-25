FactoryGirl.define do
  factory :core_node do
    name "Bryanston Towers"
    status nil
    city nil
    location nil

    to_create { |instance|
      NewContainerService.new.create( instance ).containable
    }
  end
end
