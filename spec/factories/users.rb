FactoryBot.define do
  factory :user do
    nickname        { 'お兄ちゃん' }
    email           { Faker::Internet.email }
    password        { 'a1' + Faker::Internet.password(min_length: 4, mix_case: false) }
    password_confirmation { password }
    last_name       { '中川家' }
    first_name      { '剛' }
    last_name_kana  { 'ナカガワケ' }
    first_name_kana { 'ツヨシ' }
    birthday        { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end