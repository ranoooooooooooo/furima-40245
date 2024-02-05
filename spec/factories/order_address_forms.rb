FactoryBot.define do
  factory :order_address_form do
    postcode      { '123-4567' }
    prefecture_id { 2 }
    city          { '小金井市' }
    street        { '戸田公園３−３−３' }
    building      { '東京錦糸町ハイツ' }
    phone_number  { "09012345678" }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
