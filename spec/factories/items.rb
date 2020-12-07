FactoryBot.define do
  factory :item do
    association :user
    name { 'aaaa' }
    explanation { 'aaaaaaaaa' }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    guideline_id { 2 }
    price { 1000 }
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
