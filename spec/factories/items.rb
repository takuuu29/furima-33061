FactoryBot.define do
  factory :item do
    name                    { Faker::Name.initials(number: 2) }
    text                    { Faker::Name.initials(number: 2) }
    category_id             { 2 }
    sales_id                { 2 }
    shipping_id             { 2 }
    prefecture_id           { 2 }
    shipping_id             { 2 }
    price                   { 1_0000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end