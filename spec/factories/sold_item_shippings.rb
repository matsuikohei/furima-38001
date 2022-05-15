FactoryBot.define do
  factory :sold_item_shipping do
    postal { '123-4567' }
    area_id { Faker::Number.within(range: 2..48) }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '12345678910' }
    token { ENV["PAYJP_PUBLIC_KEY"] }
    price { 2000 }
  end
end
