FactoryBot.define do
  factory :item do
name   {"aaaa"}
explanation {"aaaaaaaaa"}
category_id {"メンズ"}
status_id {"新品、未使用"}
burden_id {"着払い（購入者負担）"}
area_id {"北海道"}
guideline_id {"1〜2日で配送"}
price {"1000"}
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
