FactoryBot.define do
  factory :form do
    postal_code { "123-1234" }
    prefectures_id { 1 }
    municipality { "ああ" }
    address  { "aa" }
    phone_number { "12345678901"}
    building_name {"ビル"}
    token {"200"}
    
    # association  :item
    # order_id {order.id}
  end
end