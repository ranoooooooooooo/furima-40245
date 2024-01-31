FactoryBot.define do
  factory :item do
    item_name              { Faker::Commerce.product_name }
    item_description       { Faker::Lorem.sentence }
    item_category_id       { 2 }
    item_status_id         { 2 }
    delivery_fee_bearer_id { 2 }
    prefecture_id          { 2 }
    days_to_ship_id        { 2 }
    price                  { Faker::Number.between(from: 300, to: 9999999) }
    association            :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/mabo.jpeg'), filename: 'mabo.jpeg')
    end
  end
end
