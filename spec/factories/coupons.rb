FactoryBot.define do
  factory :coupon do
    customer_id { 1 }
    owner_id { 1 }
    discount { 1 }
    is_valid { 1 }
  end
end
