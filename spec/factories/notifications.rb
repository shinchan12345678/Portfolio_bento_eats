FactoryBot.define do
  factory :notification do
    customer_id { 1 }
    owner_id { 1 }
    coupon_id { 1 }
    information_id { 1 }
    category { 1 }
    is_checked { "" }
  end
end
