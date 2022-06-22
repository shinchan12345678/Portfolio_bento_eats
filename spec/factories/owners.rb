FactoryBot.define do
  factory :owner do
    name {'test'}
    email {'test@com'}
    address {Faker::Address.name}
    telphone_number {'0000000000'}
    password {'password'}
  end
end