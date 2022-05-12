FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '123abcd' }
    password_confirmation { password }
    last_name { 'マつ井' }
    first_name { 'こウ平' }
    kana_last_name { 'マツイ' }
    kana_first_name { 'コウヘイ' }
    birthday { Faker::Date.backward }
  end
end
