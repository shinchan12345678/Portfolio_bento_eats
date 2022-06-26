class Coupon < ApplicationRecord
  belongs_to :customer
  belongs_to :owner

  validates :customer_id, presence: true
  validates :owner_id, presence: true
  validates :discount, presence: true
  validates :is_valid, presence: true
  validates :using_period, presence: true

  # 有効:0, 無効:1
  enum is_valid: {
    before_use: 0,
    after_use: 1
  }

  # 50円:0, 100円:1, 150円:2, 200円:3
  enum discount: {
    fifty: 0,
    one_hundred: 1,
    one_hundred_fifty: 2,
    two_hundred: 3
  }
end
