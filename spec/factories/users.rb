FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"カタカナ"}
    first_name_kana       {"カタカナ"}
    birthday              {"1930-01-01"}
  end
end