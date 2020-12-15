FactoryBot.define do
  factory :shipping_address do
    association :order
    postal_code { 123-1234 }
    prefecture_id { 1 }
    municipality { ああ }
    address  { aa }
    phone_number { 12345678}
  end
end
