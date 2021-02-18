FactoryBot.define do
  factory :address do
    postal_code            { '000-0000' }
    prefecture_id          { 2 }
    city                   { '札幌' }
    address_line           { Faker::Name.initials(number: 2) }
    building               { Faker::Name.initials(number: 2) }
    phone_number           { '01234567890' }

    association :purchase
  end
end
