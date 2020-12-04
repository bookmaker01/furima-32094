FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"12345a"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name              {"太朗"}
    first_name_kana        {"ヤマダ"}
    last_name_kana         {"タロウ"}
    birthday               {"1995-02-06"}
  end
end