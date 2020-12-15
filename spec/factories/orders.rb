FactoryBot.define do
  factory :order do
    association :shipping_address, :item
  end
end
