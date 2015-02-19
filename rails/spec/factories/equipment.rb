FactoryGirl.define do
  factory :equipment do
    sequence(:name) { |n| "equipment-name-#{n}" }
    sequence(:is_asset_tag) { |n| "asset-tag-#{n}" }
    sequence(:serial_number) { |n| "serial-number-#{n}" }
    sequence(:model_number) { |n| "model-number-#{n}" }
    sequence(:product_number) { |n| "product-number-#{n}" }
  end
end
