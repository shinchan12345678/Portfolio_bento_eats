FactoryBot.define do
  factory :item do
    name { '幕内弁当' }
    price { 200 }
    introduction { Faker::Lorem.sentence }
    owner
  end
end
