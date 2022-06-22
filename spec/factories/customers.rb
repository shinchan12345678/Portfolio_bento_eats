FactoryBot.define do
  factory :customer do
    nickname { 'test_customer' }
    email { 'test@com' }
    password { 'password' }
  end
end